<?php
class Edit
{
    protected $Conn;
    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }


    public function editBook($data)
    {
        $query = "UPDATE book SET book_ISBN = :new_book_ISBN, book_title = :new_book_title, author_id = :new_author_id, book_number_available = :new_book_number_available, book_language = :new_book_language, book_pages = :new_book_pages, book_genre = :new_book_genre, book_series = :new_book_series, book_image = :new_book_image, user_id = :user_id, book_description = :new_book_description  WHERE book_listing_id = :book_listing_id
        ";
        $data['user_id'] = $_SESSION['user_data']['user_id'];
        $stmt = $this->Conn->prepare($query);
        $stmt->execute(
            array(
                'user_id' => $_SESSION['user_data']['user_id'],
                'book_listing_id' => $data['book_listing_id'],
                'new_book_ISBN' => $data['new_book_ISBN'],
                'new_book_title' => $data['new_book_title'],
                'new_author_id' => $data['new_author_id'],
                'new_book_number_available' => $data['new_book_number_available'],
                'new_book_language' => $data['new_book_language'],
                'new_book_pages' => $data['new_book_pages'],
                'new_book_genre' => $data['new_book_genre'],
                'new_book_series' => $data['new_book_series'],
                'new_book_image' => $data['new_book_image'],
                'new_book_description' => $data['new_book_description']
            )
        );
        return true;
    }


    public function editAuthor($data)
    {
        $query = "UPDATE author SET author_name = :new_author_name, author_surname = :new_author_surname, author_image = :new_author_image, author_bio = :new_author_bio WHERE author_id = :author_id";
        $data['user_id'] = $_SESSION['user_data']['user_id'];
        $data = array(
            'author_id' => $data['author_id'],
            'new_author_name' => $data['new_author_name'],
            'new_author_surname' => $data['new_author_surname'],
            'new_author_image' => $data['new_author_image'],
            'new_author_bio' => $data['new_author_bio']
        );

        $stmt = $this->Conn->prepare($query);
        $stmt->execute($data);
        return true;
    }

    public function editUser($data)
    {
        $query = "UPDATE users SET user_email = :new_user_email, user_name = :new_user_name, user_surname = :new_user_surname, user_type = :new_user_type WHERE user_id = :user_id";


        $data = array(
            'user_id' => $_SESSION['user_data']['user_id'],
            'new_user_name' => $data['new_user_name'],
            'new_user_surname' => $data['new_user_surname'],
            'new_user_email' => $data['new_user_email'],
            'new_user_type' => $data['new_user_type'],
        );


        $stmt = $this->Conn->prepare($query);
        $stmt->execute($data);
        return true;
    }




}