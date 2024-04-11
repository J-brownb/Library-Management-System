<?php
//Get author to show name on confirm delete 
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);