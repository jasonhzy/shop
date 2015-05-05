<?php
$sms_user = "jueyuanti3327";
$sms_psw = "332719434"; // 用户密码的md5码
class SMS {
	var $SMS_USER;
	var $SMS_PSW;
	public function __construct() {
	}
	public function send($moblie, $content) {
		$sms_send_api = "http://www.smsbao.com/sms?u={$sms_user}&p=" . md5 ( $sms_psw ) . "&m={$moblie}&c=" . urlencode ( $content );
		return file_get_contents ( $sms_send_api );
	}
	public function getinfo() {
		$sms_api = "http://www.smsbao.com/query?u={$sms_user}&p=" . md5 ( $sms_psw );
		$sms_count = explode ( "\n", trim ( file_get_contents ( $select_sms_count_api ) ) );
		if (! empty ( $sms_count )) {
			if ($sms_count ['0'] == 0) {
				$sms_count = explode ( ",", $sms_count ['1'] );
			}
		}
		return $sms_count;
	}
}
?>