<?php
class Fine
{
    protected $Conn;

    public function __construct($Conn)
    {
        $this->Conn = $Conn;
    }

    //get individual fines for 'your fines' page
    public function getFineByUserID($user_id)
    {
        $query = "SELECT f.fine_id, f.amount, f.fine_status, b.book_title
        FROM fine f
        JOIN users u ON u.user_id = f.user_id
        JOIN book b ON b.book_listing_id = f.book_listing_id
        WHERE u.user_id = :user_id";

        $stmt = $this->Conn->prepare($query);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }



//function to mark fines as paid 
    public function markFineAsPaid($fine_id)
    {
        $query = "UPDATE fine SET fine_status = 'Paid' WHERE fine_id = :fine_id";
        $stmt = $this->Conn->prepare($query);
        $stmt->bindParam(':fine_id', $fine_id);
        return $stmt->execute();
    }

}