<?php

$arr = array( "a" => "1", "b" => "2" );
$arr["c"]="3";

unset($arr["b"]);

$arr["b"] = "2";
/*
foreach( $arr as $key => $val )
{
  echo "key: $key ... val: $val <br>";
}*/

while( list($a, $b) = each($arr) )
{
  echo "$a .. $b .. <br>";
}

?>