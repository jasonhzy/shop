<?php
// 本类由系统自动生成，仅供测试用途
header("content-type:text/html;charset=utf-8");
class weixinAction extends Action {
	
	public $wxurl ; 
	
	function __construct()   
    {   
		$this->wxurl = $_SERVER['SERVER_NAME'].__ROOT__ ;
	}

	public function wenben($fromUsername, $toUsername, $time, $contentStr)
	{
		//////文本链接的处理/ ///
		$str=$contentStr;
	    $reg = '/\shref=[\'\"]([^\'"]*)[\'"]/i';
		preg_match_all($reg , $str , $out_ary);//正则：得到href的地址
		$src_ary = $out_ary[1];
       if(!empty($src_ary))//存在
      {
      	$comment=$src_ary[0];
      	if(stristr($comment,$this ->wxurl))
      	{
      		if(stristr($comment,"?"))
      		{
      			$links=$comment."&key=".$fromUsername;
      			$contentStr= str_replace($comment,$links,$str);
      		}else
      		{
      			$links=$comment."?key=".$fromUsername;
      			$contentStr= str_replace($comment,$links,$str);
      		}
      	}
      }
		
      	//////文本链接的处理 END////
      
		     $textTpl = "<xml>
							<ToUserName><![CDATA[%s]]></ToUserName>
							<FromUserName><![CDATA[%s]]></FromUserName>
							<CreateTime>%s</CreateTime>
							<MsgType><![CDATA[%s]]></MsgType>
							<Content><![CDATA[%s]]></Content>
							<FuncFlag>0</FuncFlag>
							</xml>";
              		$msgType = "text";
                	//$contentStr =$contentStr;
                	$resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, $msgType, $contentStr);
            	echo $resultStr;
	}
	public function tuwen($textTpl,$fromUsername, $toUsername, $time,$count)
	{
              		$msgType = "news";
                	$resultStr = sprintf($textTpl, $fromUsername, $toUsername, $time, $msgType,$count);
            	echo $resultStr;
	}
	
	public function index(){
		import('Think.ORG.Weixin');// 导入微信类

		$wechat = new Weixin();
		$wechat->valid();
		//$wechat->responseMsg();

		$postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
		if (!empty($postStr)){
			$key_word=M('keyword');

			$postObj = simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
			$fromUsername = trim($postObj->FromUserName);//发送方帐号（一个OpenID）
			$toUsername = $postObj->ToUserName;//开发者微信号 
			$keyword = trim($postObj->Content);//用户发来的信息
			$RX_TYPE = trim($postObj->MsgType);//类型
			$EventKey=trim($postObj->EventKey);//事件KEY值
			$Event=$postObj->Event;//事件类型
			$time = time();
			
			if($fromUsername!='')
			{
			 	$user= M('user')->field('id,username')->where("username='".$fromUsername."'")->find();
			 	if($user)
			 	{
					/*$str = "欢迎您".$fromUsername."来的微商城！如遇到问题可留言。";
					$this->wenben($fromUsername, $toUsername, $time,$str);*/
			 	
			 	}else 
			 	{
			 		$date=time();
        			$data['username']=$fromUsername;//用户名
        			$data['reg_time']=$date;
        			$data['last_time']=$date;
        			$userid= M('user')->add($data);
			 	}
			}
			
			
			
			if($RX_TYPE=='event')
			{
			
			//**自定义点击事件**//
			if($Event=='CLICK')
			{

				if($EventKey!='')
				{
					 $where=array('key'=>$EventKey);
					 $custom_key= M('custom_menu')->where($where)->find();
					$key_list= $key_word->where("kyword='".$custom_key['keyword']."'")->find();
					//$key_list= $key_word->where("kyword='".$EventKey."'")->find();
					if(is_array($key_list))
					{
						if($key_list['type']==1)//文本
						{
							$this->wenben($fromUsername, $toUsername, $time,$key_list['kecontent']);
						}else //图文
						{
							$titles                   = unserialize($key_list['titles']);
							$imageinfo                = unserialize($key_list['imageinfo']);
							$linkinfo                 = unserialize($key_list['linkinfo']);

							$textTpl = "<xml>
							<ToUserName><![CDATA[%s]]></ToUserName>
							<FromUserName><![CDATA[%s]]></FromUserName>
							<CreateTime>%s</CreateTime>
							<MsgType><![CDATA[%s]]></MsgType>
							 <ArticleCount>%s</ArticleCount> 
                            <Articles>";
							for($i=0;$i<count($titles);$i++)
							{
								if(stristr($linkinfo[$i],$this ->wxurl))
								{
									if(stristr($linkinfo[$i],"?"))
									{
										$links=$linkinfo[$i]."&key=".$fromUsername;
									}else
									{
										$links=$linkinfo[$i]."?key=".$fromUsername;
									}
								}else{
									$links=$linkinfo[$i];
								}
								
								if(stristr($imageinfo[$i],$this ->wxurl))
								{
								$images=$imageinfo[$i];
								}else
								{
								$images="http://".$this ->wxurl.'/'.$imageinfo[$i];
								}
								
								
								$textTpl.= " <item>
                           <Title><![CDATA[".$titles[$i]."]]></Title> 
                           <Description><![CDATA[".$titles[$i]."]]></Description>
                          <PicUrl><![CDATA[".$images."]]></PicUrl>
                           <Url><![CDATA[".$links."]]></Url>
                           </item>";
						 /*  $textTpl.= " <item>
                           <Title><![CDATA[".$titles[$i]."]]></Title> 
                           <Description><![CDATA[".$titles[$i]."]]></Description>
                          <PicUrl><![CDATA[http://".$this ->wxurl.'/'.$imageinfo[$i]."]]></PicUrl>
                           <Url><![CDATA[".$links."]]></Url>
                           </item>";*/
							}
							$textTpl.= "</Articles>
                           <FuncFlag>0</FuncFlag>
                           </xml> 
							";
							$this->tuwen($textTpl,$fromUsername, $toUsername, $time,count($titles));
						}

					}

				}
			}
				
				if($Event=='subscribe')
				{
					$key_list= $key_word->where("isfollow=1")->find();
					if(is_array($key_list))//关注时回复
					{
						if($key_list['type']==1)//文本
						{
							$this->wenben($fromUsername, $toUsername, $time,$key_list['kecontent']);
						}else //图文
						{

							$titles                   = unserialize($key_list['titles']);
							$imageinfo                = unserialize($key_list['imageinfo']);
							$linkinfo                 = unserialize($key_list['linkinfo']);

							$textTpl = "<xml>
							<ToUserName><![CDATA[%s]]></ToUserName>
							<FromUserName><![CDATA[%s]]></FromUserName>
							<CreateTime>%s</CreateTime>
							<MsgType><![CDATA[%s]]></MsgType>
							 <ArticleCount>%s</ArticleCount> 
                            <Articles>";
							for($i=0;$i<count($titles);$i++)
							{
								if(stristr($linkinfo[$i],$this ->wxurl))
								{
									if(stristr($linkinfo[$i],"?"))
									{
										$links=$linkinfo[$i]."&key=".$fromUsername;
									}else
									{
										$links=$linkinfo[$i]."?key=".$fromUsername;
									}
								}else{
									$links=$linkinfo[$i];
								}
                            if(stristr($imageinfo[$i],$this ->wxurl))
								{
								$images=$imageinfo[$i];
								}else
								{
								$images="http://".$this ->wxurl.'/'.$imageinfo[$i];
								}
								
								
								$textTpl.= " <item>
                           <Title><![CDATA[".$titles[$i]."]]></Title> 
                           <Description><![CDATA[".$titles[$i]."]]></Description>
                          <PicUrl><![CDATA[".$images."]]></PicUrl>
                           <Url><![CDATA[".$links."]]></Url>
                           </item>";
							}
							$textTpl.= "</Articles>
                           <FuncFlag>0</FuncFlag>
                           </xml> 
							";
							$this->tuwen($textTpl,$fromUsername, $toUsername, $time,count($titles));
						}
					}
				}
			}
				
			if(!empty($keyword))
			{
				
				//---------------------------------- 郑军
				$content = trim($keyword); 
				$keywordArr = $this->data($content);   
				
					if(is_array($keywordArr)){
			
						$cmd = $keywordArr['cmd'];
						$para = $keywordArr['para'];
 
						if($cmd == 'kd'){
							$resultStr = $this->getkuaidi($para);
							$this->wenben($fromUsername, $toUsername, $time,$resultStr);
						 }elseif($cmd == 'help'){							 
							 $keyword = "业务介绍" ;
						}elseif($cmd = 'msg'){														
							$resultStr = $this->sendmsg($fromUsername, $toUsername,$time,$para);
							$this->wenben($fromUsername, $toUsername, $time,$resultStr);							
							}
					
					
					} 
					
				//----------------------------------
							
				$key_list= $key_word->where("kyword='".$keyword."'")->find();
				if(is_array($key_list))
				{
					if($key_list['type']==1)//文本
					{
						$this->wenben($fromUsername, $toUsername, $time,$key_list['kecontent']);
					}else //图文
					{
							$titles                   = unserialize($key_list['titles']);
							$imageinfo                = unserialize($key_list['imageinfo']);
							$linkinfo                 = unserialize($key_list['linkinfo']);
						
                    $textTpl = "<xml>
							<ToUserName><![CDATA[%s]]></ToUserName>
							<FromUserName><![CDATA[%s]]></FromUserName>
							<CreateTime>%s</CreateTime>
							<MsgType><![CDATA[%s]]></MsgType>
							 <ArticleCount>%s</ArticleCount> 
                            <Articles>";
                    for($i=0;$i<count($titles);$i++)
                    {
                    	if(stristr($linkinfo[$i],$this ->wxurl))
                    	{
                    		if(stristr($linkinfo[$i],"?"))
                    		{
                    			$links=$linkinfo[$i]."&key=".$fromUsername;
                    		}else
                    		{
                    			$links=$linkinfo[$i]."?key=".$fromUsername;
                    		}
                    	}else{
                    		$links=$linkinfo[$i];
                    	}
                    	   if(stristr($imageinfo[$i],$this ->wxurl))
								{
								$images=$imageinfo[$i];
								}else
								{
								$images="http://".$this ->wxurl.'/'.$imageinfo[$i];
								}
								
								
								$textTpl.= " <item>
                           <Title><![CDATA[".$titles[$i]."]]></Title> 
                           <Description><![CDATA[".$titles[$i]."]]></Description>
                          <PicUrl><![CDATA[".$images."]]></PicUrl>
                           <Url><![CDATA[".$links."]]></Url>
                           </item>";
                    }
                          $textTpl.= "</Articles>
                           <FuncFlag>0</FuncFlag>
                           </xml> 
							";
                    $this->tuwen($textTpl,$fromUsername, $toUsername, $time,count($titles));
					}

				}else //自动回复
				{
					$key_list= $key_word->where("ismess=1")->find();
					if(is_array($key_list))//是否存在
					{
						if($key_list['type']==1)//文本
						{
							$this->wenben($fromUsername, $toUsername, $time, $key_list['kecontent']);
						}else //图文
						{
							$titles                   = unserialize($key_list['titles']);
							$imageinfo                = unserialize($key_list['imageinfo']);
							$linkinfo                 = unserialize($key_list['linkinfo']);

							$textTpl = "<xml>
							<ToUserName><![CDATA[%s]]></ToUserName>
							<FromUserName><![CDATA[%s]]></FromUserName>
							<CreateTime>%s</CreateTime>
							<MsgType><![CDATA[%s]]></MsgType>
							 <ArticleCount>%s</ArticleCount> 
                            <Articles>";
                    for($i=0;$i<count($titles);$i++)
                    {
                    	if(stristr($linkinfo[$i],$this ->wxurl))
                    	{
                    		if(stristr($linkinfo[$i],"?"))
                    		{
                    			$links=$linkinfo[$i]."&key=".$fromUsername;
                    		}else
                    		{
                    			$links=$linkinfo[$i]."?key=".$fromUsername;
                    		}
                    	}else{
                    		$links=$linkinfo[$i];
                    	}
                    	
                    	   if(stristr($imageinfo[$i],$this ->wxurl))
								{
								$images=$imageinfo[$i];
								}else
								{
								$images="http://".$this ->wxurl.'/'.$imageinfo[$i];
								}
								
								
								$textTpl.= " <item>
                           <Title><![CDATA[".$titles[$i]."]]></Title> 
                           <Description><![CDATA[".$titles[$i]."]]></Description>
                          <PicUrl><![CDATA[".$images."]]></PicUrl>
                           <Url><![CDATA[".$links."]]></Url>
                           </item>";
                    }
                          $textTpl.= "</Articles>
                           <FuncFlag>0</FuncFlag>
                           </xml> 
							";
                    $this->tuwen($textTpl,$fromUsername, $toUsername, $time,count($titles));
						}
					}else
					{

					}
				}


			}else{
				echo "Input something...";
			}

		}else {
			echo "";
			exit;
		}

	}
	
public function sendmsg($fromUsername, $toUsername, $time, $para){
				
		$data['ftid'] =	"";	 
        $data['from_id']="";//用户名
		$data['from_name'] = $fromUsername;	 
        $data['to_id']= "";//用户名
        $data['to_name']=  (string)$toUsername;
		$data['add_time']= $time;
        $data['info']= $para;
		$data['status']= 1;
		$message = M('message')->add($data);
		if($message){			
			 return "亲，您的留言已经收到，我们会尽快处理！";
		}else{
			
			 return "留言没有发送成功！";
		}
		
	}
 
public function data($keyword){
	
		$cmd = array("天气"=>"tq","翻译"=>"fy","找书"=>"cs","电影"=>"movies","txl"=>"txl","bd"=>"bd","淘宝"=>"taobao","留言"=>"msg","音乐"=>"music","股票"=>"gp","快递"=>"kd","归属"=>"ckmobei","身份证"=>"ckpopid","通讯录"=>"concate");
		 
	    $keyword = strtolower(trim($keyword));
   
			if($keyword == "help"){

				$keywordArr = array();
				$keywordArr['cmd'] = "help";
				$keywordArr['para'] = $keyword;
				return $keywordArr;
				exit();	
			}
			
			$str2= stristr($keyword,":");

            $str= false;

			if(!$str2){
				$str1 = stristr($keyword,"：");
				if($str1){
				$keyword = str_replace("：","#",$keyword);
				$str = ture;
				}

			}else{
				$keyword = str_replace(":","#",$keyword);
				$str = ture;

			}
			 

			if($str){

				$keyfn = explode("#",$keyword);

				if(array_key_exists($keyfn[0],$cmd)){

					$keywordArr = array();	
					$keywordArr['cmd']  = $cmd[$keyfn[0]];
					$keywordArr['para'] = $keyfn[1];

					return $keywordArr;	

				}

			}else{
			 
				   return $keyword;	
			}

	}
	
	
	
	
public function getkuaidi($keyword){
	
	import('Think.ORG.Kuaidicompany');// 导入快递公司
	
	$kd = new Kuaidicompany();

    $keyword = $this->get_utf8_string($keyword);

    $typeNu = $this->findNum($keyword);

    $str = $typeNu;

    $type = substr($keyword,0,strlen($keyword)-strlen($typeNu));

    $typeCom = $kd->ckkdcm($type);

   if(isset($typeCom) && isset($typeNu)){

     $url ="http://wap.kuaidi100.com/wap_result.jsp?rand=20130517&id=$typeCom&fromWeb=null&&postid=$typeNu";

     $curl = curl_init();
     curl_setopt ($curl, CURLOPT_URL, $url);
     curl_setopt($curl,CURLOPT_HEADER,0);     
     curl_setopt ($curl, CURLOPT_RETURNTRANSFER, 1);
     curl_setopt ($curl, CURLOPT_TIMEOUT,5);
    
     $content = curl_exec($curl);

     $output = explode('<div style="margin:8px 0;padding:5px;background-color:#FFFAE2">',$content);

     $content = explode('</div>',$output[1]);
     $content = str_replace("</p>", "\n", $content[1]);
     $content = str_replace("&middot;", "", $content);
     $str = preg_replace( "@<(.*?)>@is", "", $content);

    if(empty($str)){ $str='查询失败，请重试';}  

    }else{

        $str='查询失败，请重新核对快递信息！';
    }
 
    $contentStr = $this->get_utf8_string(trim($str)); 

    return  $contentStr;

}


	 //  将一些字符转化成utf8格式      
public function get_utf8_string($content)
{    
    
     $encoding = mb_detect_encoding($content, array('ASCII','UTF-8','GB2312','GBK','BIG5'));  
       return  mb_convert_encoding($content, 'utf-8', $encoding);
}

//提取字符串中数字

public function findNum($str='')
{
    $str=trim($str);
    if(empty($str)){return '';}
    $temp=array('1','2','3','4','5','6','7','8','9','0');
    $result='';
    for($i=0;$i<strlen($str);$i++){
        if(in_array($str[$i],$temp)){
            $result.=$str[$i];
        }
    }
    return $result;
}
	
    
}