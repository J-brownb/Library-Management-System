<?php class Delete
{
    protected $Conn;
    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }


    public function deleteBook($book_listing_id)
    {
        $query = "DELETE FROM book WHERE book_listing_id = :book_listing_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->bindValue(":book_listing_id", $book_listing_id);
        $stmt->execute();

    }

    public function deleteAuthor($author_id)
    {
        $query = "DELETE FROM author WHERE author_id = :author_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->bindValue(":author_id", $author_id);
        $stmt->execute();
    }

    public function deleteUser($user_id)
    {
        $query = "DELETE FROM users WHERE user_id = :user_id";
        $stmt = $this->Conn->prepare($query);

        $stmt->bindValue(":user_id", $user_id);
        $stmt->execute();

    }




}