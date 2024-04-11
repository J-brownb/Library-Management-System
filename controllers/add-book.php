<?php

//Get all authors for author selection
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);

//Add new book
if ($_POST) {

    if ($error) {
        $Smarty->assign('error', $error);
    } else {
        $random = substr(str_shuffle(MD5(microtime())), 0, 10);
        $new_filename = $_FILES['book_image']['name'];

    }

    if (move_uploaded_file($_FILES['book_image']['tmp_name'], __DIR__ . '/../images/books/' . $new_filename)) {
        $Book = new Book($Conn);
        $_POST['book_image'] = $new_filename;
        $attempt = $Book->addBook($_POST);
        if ($attempt) {
            $Smarty->assign('success', "Your book has been added.");
        } else {
            $Smarty->assign('error', "An error occurred.");
        }
    }
}