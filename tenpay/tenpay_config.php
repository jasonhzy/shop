<?php

include_once ('DB.php');

$sql = "select * from weixin_alipay where id = '2'";
$result = mysql_query ( $sql, $conn );
$alipay = mysql_fetch_array ( $result );

$PHP_SELF=$_SERVER['PHP_SELF'];
$url='http://'.$_SERVER['HTTP_HOST'].substr($PHP_SELF,0,strrpos($PHP_SELF,'/')+1);


$spname=$alipay ['alipayname'];
$partner = $alipay ['partner'];                                	//财付通商户号
$key = $alipay ['key'];											//财付通密钥

$return_url = $url."payReturnUrl.php";			//显示支付结果页面,*替换成payReturnUrl.php所在路径
$notify_url = $url."payNotifyUrl.php";			//支付完成后的回调处理页面,*替换成payNotifyUrl.php所在路径
?>