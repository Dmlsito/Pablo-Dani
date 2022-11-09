<?php
include("conexionBBDD.php");
$con = Connection();

if(isset ($_POST["nombre"])){
    $nombre = $_POST["nombre"];
}
else return; 
if(isset ($_POST["monedas"])){
    $monedas = $_POST["monedas"];
}
else return; 

$query = "INSERT INTO 'nelsonesmipadredb' ('nombre', 'monedas')
VALUES('$nombre', '$monedas')";
$exe = msqli_query($con, $query);


$arr = [];

if($exe){
    $arr["exito"] = "true";
}
else{
    $arr["exito"] = "false";
}

print(json_encodes($arr));

?>