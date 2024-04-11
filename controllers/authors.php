<?php
//Get all authors
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);