{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <div class="row confirmation">
            <h1>Confirm Delete User</h1>
            <p>Are you sure you want to delete: {$user.user_name} {$user.user_surname}?</p>
            <p><strong>This action cannot be undone!</strong></p>
            <form method="post">
                <input type="hidden" name="user_id" value="{$user.user_id}">
                <button type="submit" class="destructive" name="delete-user" value="1">Delete User <i
                        class="fa fa-trash"></i></button>
                <button type="submit" name="cancel-delete" value="1">Cancel</button>
                <input type="hidden" name="confirm-delete" value="1">
            </form>
        </div>
    </div>
{/block}