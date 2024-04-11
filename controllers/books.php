<?php
//Get all books
$Book = new Book($Conn);
$books = $Book->getAllBooks();
$Smarty->assign('books', $books);

//Get author for books
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);