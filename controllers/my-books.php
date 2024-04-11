<?php
//Get user by ID
$User = new User($Conn);
$currentUser = $User->getUser($user_id);

//Get all authors for book list
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);

//Get books borrowed by user 
$Book = new Book($Conn);
$borrowed_books = $Book->getBorrowedBooksByUserId($user_id);
$Smarty->assign('borrowed_books', $borrowed_books);

//Get user transactions
$Returns = new Lendreturn($Conn);
$returns = $Returns->getAllTransactions();
$Smarty->assign('returns', $returns);