<?php
//Add new author
if ($_POST) {

    if ($error) {
        $Smarty->assign('error', $error);
    } else {
        $random = substr(str_shuffle(MD5(microtime())), 0, 10);
        $new_filename = $_FILES['author_image']['name'];

    }

    if (move_uploaded_file($_FILES['author_image']['tmp_name'], __DIR__ . '/../images/authors/' . $new_filename)) {
        $Author = new Author($Conn);
        $_POST['author_image'] = $new_filename;
        $attempt = $Author->addAuthor($_POST);
        if ($attempt) {
            $Smarty->assign('success', "Your author has been added.");
        } else {
            $Smarty->assign('error', "An error occurred.");
        }
    }
}