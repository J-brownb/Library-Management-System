<?php

//Get author for listing page
$author_id = $_GET['id'];
$Author = new Author($Conn);
$author_data = $Author->getAuthor($author_id);
$Smarty->assign('author', $author_data);

//Get books for author page 
$Author = new Author($Conn);
$authors = $Author->getLatestBooksByAuthor($author_id);
$Smarty->assign('authors', $authors);