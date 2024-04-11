<?php
//Get all books for book list
$Book = new Book($Conn);
$books = $Book->getAllBooks();
$Smarty->assign('books', $books);

//get all authors for author list
$Author = new Author($Conn);
$authors = $Author->getAllAuthors();
$Smarty->assign('authors', $authors);

//edit book
$Edit = new Edit($Conn);
$edit = $Edit->editBook($data);
$Smarty->assign('edit', $edit);


//edit book
if ($_POST) {

    if ($error) {
        $Smarty->assign('error', $error);
    } else {
        $random = substr(str_shuffle(MD5(microtime())), 0, 10);
        $new_filename = $_FILES['new_book_image']['name'];

    }

    if (move_uploaded_file($_FILES['new_book_image']['tmp_name'], __DIR__ . '/../images/books/' . $new_filename)) {
        $User = new User($Conn);
        $_POST['new_book_image'] = $new_filename; {
            $book_listing_id = $_POST['book_listing_id'];
            $new_book_ISBN = $_POST['new_book_ISBN'];
            $new_book_title = $_POST['new_book_title'];
            $new_author_id = $_POST['new_author_id'];
            $new_book_number_available = $_POST['new_book_number_available'];
            $new_book_language = $_POST['new_book_language'];
            $new_book_pages = $_POST['new_book_pages'];
            $new_book_genre = $_POST['new_book_genre'];
            $new_book_series = $_POST['new_book_series'];
            $new_book_image = $_POST['new_book_image'];
            $new_book_description = $_POST['new_book_description'];

            // Create array with book data
            $data = array(
                'book_listing_id' => $book_listing_id,
                'new_book_ISBN' => $new_book_ISBN,
                'new_book_title' => $new_book_title,
                'new_author_id' => $new_author_id,
                'new_book_number_available' => $new_book_number_available,
                'new_book_language' => $new_book_language,
                'new_book_pages' => $new_book_pages,
                'new_book_genre' => $new_book_genre,
                'new_book_series' => $new_book_series,
                'new_book_image' => $new_book_image,
                'new_book_description' => $new_book_description
            );

            // Update book data
            $result = $Edit->editBook($data);

            // If the book was successfully updated, redirect to the book details page
            if ($result) {
                header("Location: /SDDE-assignment/book-listing/$book_listing_id");
            } else {
                // If there was an error, display an error message
                $Smarty->assign('error', "An error occurred.");
            }
        }
    }
}
?>