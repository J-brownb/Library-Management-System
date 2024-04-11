<?php
//Get authors for author delete list
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);

//Edit author 
$Edit = new Edit($Conn);
$edit = $Edit->editAuthor($data);
$Smarty->assign('edit', $edit);

//edit author
if ($_POST) {

    if ($error) {
        $Smarty->assign('error', $error);
    } else {
        $random = substr(str_shuffle(MD5(microtime())), 0, 10);
        $new_filename = $_FILES['new_author_image']['name'];

    }

    if (move_uploaded_file($_FILES['new_author_image']['tmp_name'], __DIR__ . '/../images/authors/' . $new_filename)) {
        $User = new User($Conn);
        $_POST['new_author_image'] = $new_filename; {
            $author_id = $_POST['author_id'];
            $new_author_name = $_POST['new_author_name'];
            $new_author_surname = $_POST['new_author_surname'];
            $new_author_image = $_POST['new_author_image'];
            $new_author_bio = $_POST['new_author_bio'];

            // Create array with author data
            $data = array(
                'author_id' => $author_id,
                'new_author_name' => $new_author_name,
                'new_author_surname' => $new_author_surname,
                'new_author_image' => $new_author_image,
                'new_author_bio' => $new_author_bio,
            );


            // Update author data
            $result = $Edit->editAuthor($data);

            // If the author was successfully updated, redirect to the author details page
            if ($result) {
                header("Location: /SDDE-assignment/author-listing/$author_id");
            } else {
                // If there was an error, display an error message
                $Smarty->assign('error', "An error occurred.");
            }
        }
    }
}