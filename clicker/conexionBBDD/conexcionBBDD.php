<?php


function Connection{

    $con = mysqli_connect("localhost", "root", "password", "db");
    return $con;



}


?>