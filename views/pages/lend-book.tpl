{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Lend Book</li>
            </ol>
        </nav>
        <h1>Lend Book</h1>
        {if $error}
            <div class="alert alert-danger mb-3" role="alert">
                {$error}
            </div>
        {else if $success}
            <div class="alert alert-success mb-3" role="alert">
                {$success}
            </div>
        {/if}
        <div class="row">
            <form method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label" for="book_listing_id">Book</label><br>
                    <select class="form-control" id="book_listing_id" name="book_listing_id" required>
                        {foreach from=$books item=book}
                            <option value="{$book.book_listing_id}">{$book.book_title}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="user_id">User</label>
                    <select class="form-control" id="user_id" name="user_id" required>
                        {foreach from=$users item=user}
                            <option value="{$user.user_id}">{$user.user_name} {$user.user_surname}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="borrowing_period_days">Borrowing Period (Days)</label>
                    <input type="text" class="form-control" id="borrowing_period_days" name="borrowing_period_days"
                        required>
                </div>
                <button type="submit">Lend Book</button>
            </form>
        </div>
    </div>
{/block}