<?php
//Login
if ($_POST["login"]) {
    if (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
        $error = "This email address is not valid.";
    }
    if ($error) {
        $Smarty->assign("error", $error);
    } else {
        $User = new User($Conn);
        $user_data = $User->loginUser($_POST["email"], $_POST["password"]);

        if ($user_data) {
            $_SESSION["is_loggedin"] = true;
            $_SESSION["user_data"] = $user_data;
            $_SESSION["user_type"] = $user_data["user_type"]; // Set user type for secure pages array (index.php)
            header("Location: /SDDE-assignment/");
            exit();
        } else {
            $Smarty->assign("error", "Incorrect Email/Password");
        }
    }
}