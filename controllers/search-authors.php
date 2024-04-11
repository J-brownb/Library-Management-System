<?php
//Author search query
$author_query = $_POST['authorQuery'];
$Smarty->assign('authorQuery', $author_query);

//Search authors
$Author = new Author($Conn);
$authors = $Author->searchAuthors($author_query);
$Smarty->assign('authors', $authors);