<?php
$PHP_SELF=$_SERVER['PHP_SELF'];
echo $PHP_SELF;

$url='http://'.$_SERVER['HTTP_HOST'].substr($PHP_SELF,0,strrpos($PHP_SELF,'/')+1);

echo "URL='".$url."';<br>";

$url=substr($url,0,strpos($url,"/wapapli/"));//http://localhost/yi_system/

echo "URL='".$url."';";

//echo "document.write(URL);";
?>