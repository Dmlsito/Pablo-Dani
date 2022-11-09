<?php

function Connection{

    $con = mysqli_connect("aws-eu-west-2.connect.psdb.cloud", "c6x9qp3c8s6plywpvv7b", 
    "pscale_pw_y4ZSRbYVl6A1IOXUlNh6toLkqEHoGi5URjnK7cdZLbw", "nelsonesmipadredb");
    return $con;
} 


?>