<?php
//Get authors for author list
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);

$Delete = new Delete($Conn);
//Check delete author submit button 
if (isset($_POST['delete-author'])) {
    $author_id = $_POST['author_id'];

    // Check if the confirmation form was submitted
    if (isset($_POST['confirm-delete'])) {
        $Delete->deleteAuthor($author_id);
        $Smarty->assign('success', "The author has been deleted. Please refresh the page.");
    } else {
        // clicked cancel
        $author = $Author->getAuthor($author_id);
        $Smarty->assign('author', $author);
        $Smarty->display('pages/confirm-delete-author.tpl');
        exit();
    }
}

$Smarty->assign('delete', $delete);