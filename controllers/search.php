<?php
//Search query
$search_query = $_POST['query'];
$Smarty->assign('query', $search_query);

//search authors
$Author = new Author($Conn);
$authors = $Author->searchAuthors($search_query);
$Smarty->assign('authors', $authors);

//Search books
$Book = new Book($Conn);
$books = $Book->searchBooks($search_query);
$Smarty->assign('books', $books);