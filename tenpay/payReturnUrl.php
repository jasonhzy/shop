<META http-equiv=Content-Type content="text/html; charset=utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<?php

//---------------------------------------------------------
//财付通即时到帐支付页面回调示例，商户按照此文档进行开发即可
//---------------------------------------------------------
require_once ("./classes/ResponseHandler.class.php");
require_once ("./classes/function.php");
require_once ("./tenpay_config.php");
include_once('DB.php');

log_result("进入前台回调页面");


/* 创建支付应答对象 */
$resHandler = new ResponseHandler();
$resHandler->setKey($key);

$PHP_SELF=$_SERVER['PHP_SELF'];
$url='http://'.$_SERVER['HTTP_HOST'].substr($PHP_SELF,0,strrpos($PHP_SELF,'/')+1);
$url=substr($url,0,strpos($url,"/tenpay/")); 

//判断签名
if($resHandler->isTenpaySign()) {
	
	//通知id
	$notify_id = $resHandler->getParameter("notify_id");
	//商户订单号
	$out_trade_no = $resHandler->getParameter("out_trade_no");
	//财付通订单号
	$transaction_id = $resHandler->getParameter("transaction_id");
	//金额,以分为单位
	$total_fee = $resHandler->getParameter("total_fee");
	//如果有使用折扣券，discount有值，total_fee+discount=原请求的total_fee
	$discount = $resHandler->getParameter("discount");
	//支付结果
	$trade_state = $resHandler->getParameter("trade_state");
	//交易模式,1即时到账
	$trade_mode = $resHandler->getParameter("trade_mode");
	
	
	if("1" == $trade_mode ) {
		if( "0" == $trade_state){ 
		
		
		 if(!empty($out_trade_no)){
		
		$sql = "update weixin_item_order set status=2,support_time=" . time () . " where orderId='" . $out_trade_no . "'";
		$result = @mysql_query ( $sql, $conn ) or die ( mysql_error () );
		
			if ($result) {
			
			$sql = "SELECT * FROM `weixin_item_order` LEFT JOIN weixin_order_detail ON weixin_item_order.orderId=weixin_order_detail.orderId WHERE weixin_item_order.orderId='$out_trade_no';";
			$result = @mysql_query ( $sql ) or die ( mysql_error () );
			$orders = mysql_fetch_array ( $result, MYSQL_ASSOC );
			$sms_user = "fscxy";
			$sms_psw = "457904";
			$sms_send_to = $orders ['mobile'];
			$select_sms_count_api = "http://42.121.104.22:7592/Service.asmx/Balance?zh=$sms_user&mm=$sms_psw&dxlbid=8";
			// $select_sms_count_api =
			// "http://www.smsbao.com/query?u=jueyuanti3327&p=" . md5 (
			// '332719434' );
			// var_dump(file_get_contents ( $select_sms_count_api ));
			$sms_count = trim ( strip_tags ( file_get_contents ( $select_sms_count_api ) ) );
			if ($sms_count <= 100 && ($sms_count % 5) == 0) {
				$SendTo = '332719434@qq.com,472343221@qq.com';
				$ReplyTo = $SendTo;
				$headers = "Content-type: text/html; charset=utf-8\r\nFrom:webmaster@{$_SERVER['SERVER_NAME']}\r\nReply-To:{$ReplyTo}\r\nX-Mailer:PHP/" . phpversion ();
				$M_title = "短信余额不足!";
				$M_body = "<h1>短信余额不足! 目前剩余：<a href=\"{$select_sms_count_api}\" target=\"_blank\">{$sms_count}</a>条,请及时充值</h1>";
				mail ( $SendTo, $M_title, $M_body, $headers );
			}
			$sms_body = "感谢您购买【{$orders['title']}】，订单编号为：{$orders['orderId']}，我们将尽快为您发货，请注意查收！";
			$sms_send_api = "http://www.smsbao.com/sms?u=jueyuanti3327&p=" . md5 ( '332719434' ) . "&m=$sms_send_to&c=" . urlencode ( $sms_body );
			
			// $sms_send_api =
			// "http://42.121.104.22:7592/Service.asmx/sendsms?zh={$sms_user}&mm={$sms_psw}&hm={$sms_send_to}&nr={$sms_body}&dxlbid=8&extno=";
			file_get_contents ( $sms_send_api );

			echo "支付成功!<br />";
			echo "您的财付通交易号：".$transaction_id;
			echo "<br />";
			echo "您的订单号：".$out_trade_no;
			echo "<br />";
			echo "<a href='$url'>返回微商城</a>";
		    }
		 }
			
			//echo "<br/>" . "即时到帐支付成功" . "<br/>";
	
		} else {
			//当做不成功处理
			echo "<br/>" . "即时到帐支付失败" . "<br/>";
		}
	}elseif( "2" == $trade_mode  ) {
		if( "0" == $trade_state) {
		
		if(!empty($out_trade_no)){
		
		$sql = "update weixin_item_order set status=2,support_time=" . time () . " where orderId='" . $out_trade_no . "'";
		$result = @mysql_query ( $sql, $conn ) or die ( mysql_error () );
		
			if ($result) {
			
			$sql = "SELECT * FROM `weixin_item_order` LEFT JOIN weixin_order_detail ON weixin_item_order.orderId=weixin_order_detail.orderId WHERE weixin_item_order.orderId='$out_trade_no';";
			$result = @mysql_query ( $sql ) or die ( mysql_error () );
			$orders = mysql_fetch_array ( $result, MYSQL_ASSOC );
			$sms_user = "fscxy";
			$sms_psw = "457904";
			$sms_send_to = $orders ['mobile'];
			$select_sms_count_api = "http://42.121.104.22:7592/Service.asmx/Balance?zh=$sms_user&mm=$sms_psw&dxlbid=8";
			// $select_sms_count_api =
			// "http://www.smsbao.com/query?u=jueyuanti3327&p=" . md5 (
			// '332719434' );
			// var_dump(file_get_contents ( $select_sms_count_api ));
			$sms_count = trim ( strip_tags ( file_get_contents ( $select_sms_count_api ) ) );
			if ($sms_count <= 100 && ($sms_count % 5) == 0) {
				$SendTo = '332719434@qq.com,472343221@qq.com';
				$ReplyTo = $SendTo;
				$headers = "Content-type: text/html; charset=utf-8\r\nFrom:webmaster@{$_SERVER['SERVER_NAME']}\r\nReply-To:{$ReplyTo}\r\nX-Mailer:PHP/" . phpversion ();
				$M_title = "短信余额不足!";
				$M_body = "<h1>短信余额不足! 目前剩余：<a href=\"{$select_sms_count_api}\" target=\"_blank\">{$sms_count}</a>条,请及时充值</h1>";
				mail ( $SendTo, $M_title, $M_body, $headers );
			}
			$sms_body = "感谢您购买【{$orders['title']}】，订单编号为：{$orders['orderId']}，我们将尽快为您发货，请注意查收！";
			$sms_send_api = "http://www.smsbao.com/sms?u=jueyuanti3327&p=" . md5 ( '332719434' ) . "&m=$sms_send_to&c=" . urlencode ( $sms_body );
			
			// $sms_send_api =
			// "http://42.121.104.22:7592/Service.asmx/sendsms?zh={$sms_user}&mm={$sms_psw}&hm={$sms_send_to}&nr={$sms_body}&dxlbid=8&extno=";
			file_get_contents ( $sms_send_api );

			echo "支付成功!<br />";
			echo "您的财付通交易号：".$transaction_id;
			echo "<br />";
			echo "您的订单号：".$out_trade_no;
			echo "<br />";
			echo "<a href='$url'>返回微商城</a>";
		    }
		 }
		   
		   
			
			//echo "<br/>" . "中介担保支付成功" . "<br/>";
		
		} else {
			//当做不成功处理
			echo "<br/>" . "中介担保支付失败" . "<br/>";
		}
	}
	
} else {
	echo "<br/>" . "认证签名失败" . "<br/>";
	echo $resHandler->getDebugInfo() . "<br>";
}

?>