{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <div class="row confirmation">
            <h1>Confirm Delete Author</h1>
            <p>Are you sure you want to delete: {$author.author_name} {$author.author_surname}?</p>
            <p><strong>This action cannot be undone!</strong></p>
            <form method="post">
                <input type="hidden" name="author_id" value="{$author.author_id}">
                <button type="submit" class="destructive" name="delete-author" value="1">Delete Author <i
                        class="fa fa-trash"></i></button>
                <button type="submit" name="cancel-delete" value="1">Cancel</button>
                <input type="hidden" name="confirm-delete" value="1">
            </form>
        </div>
    </div>
{/block}