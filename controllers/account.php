<?php

//Gets current user
$User = new User($Conn);
$User->getUser($user_id);
$Smarty->assign('user', $user);

//If delete account button is clicked
$Delete = new Delete($Conn);
if (isset($_POST['delete-account'])) {
    $user_id = $_POST['user_id'];

    // Check if the confirmation form was submitted
    if (isset($_POST['confirm-delete'])) {
        $Delete->deleteUser($user_id);
        //log them out
        $_SESSION = array();
        session_destroy();
        //redirect to homepage
        header("Location: /SDDE-assignment/");


    } else {
        // clicked cancel
        $user = $User->getUser($user_id);
        $Smarty->assign('user', $user);
        $Smarty->display('pages/confirm-delete-account.tpl');
        exit();
    }
}

$Smarty->assign('delete', $Delete);