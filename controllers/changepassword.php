<?php
//Change password
if ($_POST) {
    $error = '';
    if (isset($_POST["changePass"])) {
        if (strlen($_POST["newPassword"]) < 8) {
            $error = "Your new password must be at least 8 characters in length.";
        } else {
            $change_pass = $User->changeUserPassword($_POST['currentPassword'], $_POST['newPassword']);
            if ($change_pass) {
                $Smarty->assign('success', "Password has been updated.");
            } else {
                $error = "Something went wrong.";
            }
        }
    }

    if ($error) {
        $Smarty->assign('error', $error);
    }
}