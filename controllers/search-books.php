<?php
//Book query
$book_query = $_POST['bookQuery'];
$Smarty->assign('bookQuery', $book_query);

//Search books
$Book = new Book($Conn);
$books = $Book->searchBooks($book_query);
$Smarty->assign('books', $books);