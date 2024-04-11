{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <div class="row confirmation">
            <h1>Confirm Delete Account </h1>
            {if $error}
                <div class="alert alert-danger mb-3" role="alert">
                    {$error}
                </div>
            {else if $success}
                <div class="alert alert-success mb-3" role="alert">
                    {$success}
                </div>
            {/if}
            <p>{$user_data['user_name']}, are you sure you want to delete your account?</p>
            <p><strong>This action cannot be undone! </strong></p>
            <form method="post">
                <select class="form-control hidden" id="user_id" name="user_id" required>
                    <option value="{$user_data['user_id']}">{$user_data['user_id']}</option>
                </select>
                <button type="submit" class="destructive" name="delete-account" value="1">Delete Account <i
                        class="fa fa-trash"></i></button>
                <button type="submit" name="cancel-delete" value="1">Cancel</button>
                <input type="hidden" name="confirm-delete" value="1">
            </form>
        </div>
    </div>
{/block}