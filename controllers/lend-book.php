<?php

//Get all books for book list
$Book = new Book($Conn);
$books = $Book->getAllBooks();
$Smarty->assign('books', $books);

//Get all users for user list 
$User = new User($Conn);
$users = $User->getAllUsers();
$Smarty->assign('users', $users);

//Lend book
if ($_POST) {
    $borrow_data = array(
        'user_id' => $_POST['user_id'],
        'book_listing_id' => $_POST['book_listing_id'],
        'borrowing_period_days' => $_POST['borrowing_period_days'],
    );

    $Lendreturn = new Lendreturn($Conn);

    if ($Lendreturn->lendBook($borrow_data)) {
        $Smarty->assign('success', 'Book has been lent.');
    } else {
        $Smarty->assign('error', 'Error lending book.');
    }
}