<?php
/* * 
 * 功能：支付宝页面跳转同步通知页面
 * 版本：3.3
 * 日期：2012-07-23
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 *************************页面功能说明*************************
 * 该页面可在本机电脑测试
 * 可放入HTML等美化页面的代码、商户业务逻辑程序代码
 * 该页面可以使用PHP开发工具调试，也可以使用写文本函数logResult，该函数已被默认关闭，见alipay_notify_class.php中的函数verifyReturn
 */

require_once("alipay.config.php");
require_once("lib/alipay_notify.class.php");
include_once('DB.php');
?>
<!DOCTYPE HTML>
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

<?php

//计算得出通知验证结果
$alipayNotify = new AlipayNotify($alipay_config);
$verify_result = $alipayNotify->verifyReturn();
if($verify_result) {//验证成功
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//请在这里加上商户的业务逻辑程序代码
	
	//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
    //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表

	//商户订单号
	$out_trade_no = $_GET['out_trade_no'];

	//支付宝交易号
	$trade_no = $_GET['trade_no'];

	//交易状态
	$result = $_GET['result']; 


	//判断该笔订单是否在商户网站中已经做过处理
		//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
		//如果有做过处理，不执行商户的业务程序
	
		
			if(!empty($out_trade_no))
			{
		
		$sql = "update weixin_item_order set status=2,support_time=" . time () . " where orderId='" . $out_trade_no . "'";
		$result = @mysql_query ( $sql, $conn ) or die ( mysql_error () );
		if ($result) {
			
			$sql = "SELECT * FROM `weixin_item_order` LEFT JOIN weixin_order_detail ON weixin_item_order.orderId=weixin_order_detail.orderId WHERE weixin_item_order.orderId='{$out_trade_no}';";
			$result = @mysql_query ( $sql ) or die ( mysql_error () );
			$orders = mysql_fetch_array ( $result, MYSQL_ASSOC );
			$sms_user = "fscxy";
			$sms_psw = "457904";
			$sms_send_to = $orders ['mobile'];
			$select_sms_count_api = "http://42.121.104.22:7592/Service.asmx/Balance?zh={$sms_user}&mm={$sms_psw}&dxlbid=8";
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
			$sms_send_api = "http://www.smsbao.com/sms?u=jueyuanti3327&p=" . md5 ( '332719434' ) . "&m={$sms_send_to}&c=" . urlencode ( $sms_body );
			
			// $sms_send_api =
			// "http://42.121.104.22:7592/Service.asmx/sendsms?zh={$sms_user}&mm={$sms_psw}&hm={$sms_send_to}&nr={$sms_body}&dxlbid=8&extno=";
			file_get_contents ( $sms_send_api );
		}
	
	}
		
	echo "支付成功<br />";
	echo "您的支付宝交易号为：".$trade_no;
	echo "<br />";
	echo "您的订单号为：".$out_trade_no;
	echo "<br />";
		
 ?>
 
 
 <a href="../index.php">支付成功!点击返回首页</a>
	
	<?PHP 

	
}
else {
    //验证失败
    //如要调试，请看alipay_notify.php页面的verifyReturn函数
    echo "验证失败";
}
?>
        <title>支付宝即时到账交易接口</title>
	</head>
    <body>
    </body>
</html>