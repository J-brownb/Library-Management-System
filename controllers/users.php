<?php
//Get all users for user list
$User = new User($Conn);
$users = $User->getAllUsers();
$Smarty->assign('users', $users);