<?php

class alipayAction extends backendAction
{

    public function _initialize() {
        parent::_initialize();
        $this->_mod = D('alipay');
    }

    public function index() {
     
    	if(IS_POST)
    	{
    		$alipayname=trim($_POST['alipayname']);
    		$partner=trim($_POST['partner']);
    		$key=trim($_POST['key']);
			$leixing=trim($_POST['leixing']);
									
    		$data['alipayname']=$alipayname;
    		$data['partner']=$partner;
    		$data['key']=$key;
			$data['leixing']=$leixing;
			
			$data1['alipayname']=trim($_POST['tenpayname']);
    		$data1['partner']=trim($_POST['tenpartner']);
    		$data1['key']=trim($_POST['tenkey']);
			$data1['leixing']=trim($_POST['tenleixing']);
			
    		if(empty($_POST['id']))
    		{

    			if($this->_mod->where('id=1')->data($data)->add()!==false&&$this->_mod->where('id=2')->data($data1)->add()!==false)
    			{
    				$this->success('修改成功!');exit;
    			}else
    			{
    				$this->error('修改失败');exit;
    			}
    		}else
    		{
              
    		if($this->_mod->data($data)->where('id=1')->save()!==false&&$this->_mod->data($data1)->where('id=2')->save()!==false)
    		{
    				$this->success('修改成功!');exit;
    		}else 
    		{
    			$this->error('修改失败');exit;
    		}

    		}
    		
    	}else 
    	{
    		$info= $this->_mod->where('id=1')->select();		 
    		$this->assign('info',$info[0]);
		 
			$teninfo= $this->_mod->where('id=2')->select();
    		$this->assign('teninfo',$teninfo[0]);
			
    	}
    	
    	$this->display();
    }

   
    
}