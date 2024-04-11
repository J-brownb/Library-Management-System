<?php
//Get users to show name on confirm delete 
$User = new User($Conn);
$users = $User->getAllUsers();
$Smarty->assign('users', $users);