<?php
    if(!isset($_SESSION)) 
    { 
        session_start(); 
    } 
//checking if the session exists
//if the session is not set it redirects the user to the login form/page

    if(! isset($_SESSION["logged_in"])){
        header("location:index.php");
    }

?>