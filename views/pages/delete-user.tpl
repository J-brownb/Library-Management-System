{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Delete User</li>
            </ol>
        </nav>
        <h1>Delete User</h1>
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
                <div class=" mb-3">
                    <label class="form-label" for="user_id">User</label><br>
                    <select class="form-control" id="user_id" name="user_id" required>
                        {foreach from=$users item=user}
                            <option value="{$user.user_id}">{$user.user_name} {$user.user_surname}</option>
                        {/foreach}
                    </select>
                </div>
                <button type="submit" name="delete-user" value="1" class="delete">Delete User <i
                        class="fa fa-trash"></i></button>
            </form>
        </div>
    </div>
{/block}