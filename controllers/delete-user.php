<?php
//Get users for book user list
$User = new User($Conn);
$users = $User->getAllUsers();
$Smarty->assign('users', $users);

$Delete = new Delete($Conn);

//Check delete user submit button 
if (isset($_POST['delete-user'])) {
    $user_id = $_POST['user_id'];
    if (isset($_POST['confirm-delete'])) {
        $Delete->deleteUser($user_id);
        $Smarty->assign('success', "The user has been deleted. Please refresh the page.");
    } else {
        // clicked cancel
        $user = $User->getUser($user_id);
        $Smarty->assign('user', $user);
        $Smarty->display('pages/confirm-delete-user.tpl');
        exit();
    }
}

$Smarty->assign('delete', $Delete);