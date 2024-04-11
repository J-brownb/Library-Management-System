<?php
//Get books for book delete list
$Book = new Book($Conn);
$books = $Book->getAllBooks();
$Smarty->assign('books', $books);

$Delete = new Delete($Conn);
//Check delete book submit button 
if (isset($_POST['delete-book'])) {
    $book_listing_id = $_POST['book_listing_id'];

    // Check if the confirmation form was submitted
    if (isset($_POST['confirm-delete'])) {
        $Delete->deleteBook($book_listing_id);
        $Smarty->assign('success', "The book has been deleted. Please refresh the page.");
    } else {
        // clicked cancel
        $book = $Book->getBook($book_listing_id);
        $Smarty->assign('book', $book);
        $Smarty->display('pages/confirm-delete-book.tpl');
        exit();
    }
}

$Smarty->assign('delete', $Delete);