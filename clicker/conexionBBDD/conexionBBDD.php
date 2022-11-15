<?php

function Connection{

    $con = mysqli_connect("localhost", "root", 
    "instiagra", "prueba");
    return $con;
}   


?>