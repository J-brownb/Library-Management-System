{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit Book</li>
            </ol>
        </nav>
        <h1>Edit User</h1>
        <div class="row">
            {if $error}
                <div class="alert alert-danger mb-3" role="alert">
                    {$error}
                </div>
            {else if $success}
                <div class="alert alert-success mb-3" role="alert">
                    {$success}
                </div>
            {/if}
            <form method="post">
                <div class="mb-3">
                    <label class="form-label" for="user_id">User</label>
                    <select class="form-control" id="user_id" name="user_id" required>
                        {foreach from=$users item=user}
                            <option value="{$user.user_id}">{$user.user_name} {$user.user_surname}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="user_name">Update Name</label>
                    <input type="text" class="form-control" id="user_name" name="new_user_name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="user_surname">Update Surname</label>
                    <input type="text" class="form-control" id="user_surname" name="new_user_surname" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="user_email">Update Email</label>
                    <input type="email" class="form-control" id="user_email" name="new_user_email" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="account_type">Account Type</label>
                    <select class="form-select" aria-label="Default select example" name="new_user_type">
                        <option value="1">Customer</option>
                        <option value="2">Employee / Admin</option>
                    </select>
                </div>
                <button type="submit" name="edit-user" value="1" class="btn btn-primary">Update User</button>
            </form>
        </div>
    </div>
{/block}