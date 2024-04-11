<?php
//Get books to show name on confirm delete 
$Book = new Book($Conn);
$books = $Book->getAllBooks();
$Smarty->assign('books', $books);