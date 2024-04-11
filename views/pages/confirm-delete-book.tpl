{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <div class="row confirmation">
            <h1>Confirm Delete Book</h1>
            <p>Are you sure you want to delete: {$book.book_title}?</p>
            <p><strong>This action cannot be undone!</strong></p>
            <form method="post">
                <input type="hidden" name="book_listing_id" value="{$book.book_listing_id}">
                <button type="submit" class="destructive" name="delete-book" value="1">Delete Book <i
                        class="fa fa-trash"></i></button>
                <button type="submit" name="cancel-delete" value="1">Cancel</button>
                <input type="hidden" name="confirm-delete" value="1">
            </form>
        </div>
    </div>
{/block}