<?php
//Logout
$_SESSION = array();
session_destroy();
header("Location: /SDDE-assignment/");