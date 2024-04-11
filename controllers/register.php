<?php
//Register new user
if ($_POST) {
    if ($_POST["register"]) {
        if ($_POST["password"] != $_POST["password_confirm"]) {
            $error = "Passwords do not match.";
        } elseif (strlen($_POST["password"]) < 8) {
            $error = "Your password must be at least 8 characters in length.";
        } elseif (!filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
            $error = "Your email address is not valid.";
        }
        if ($error) {
            $Smarty->assign("error", $error);
        } else {
            $User = new User($Conn);
            $attempt = $User->createUser($_POST);
            if ($attempt) {
                $Smarty->assign(
                    "success",
                    "Your account has been created and a confirmation email has been sent. You can now login."
                );
                //Send confirmation email
                $email = new \SendGrid\Mail\Mail();
                $email->setFrom("s223358@uos.ac.uk", "Fictional Library Co");
                $email->setSubject("Welcome to the Library");
                $email->addTo($_POST['email'], "User");
                $email->addContent(
                    "text/html",
                    "<h1>Welcome to the Library</h1> <p>Your account has been created successfully.</p>"
                );
                $sendgrid = new \SendGrid('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');
                $response = $sendgrid->send($email);
            } else {
                $Smarty->assign(
                    "error",
                    "An error occurred, please try again later."
                );
            }
        }
    }
}