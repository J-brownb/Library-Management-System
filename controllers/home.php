<?php
//Get selected books for homepage
$Book = new Book($Conn);
$books = $Book->getFewerBooks();
$Smarty->assign('books', $books);

//Get featured author for homepage
$Author = new Author($Conn);
$authors = $Author->getFeaturedAuthor();
$Smarty->assign('authors', $authors);