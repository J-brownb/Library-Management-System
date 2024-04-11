{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit Author</li>
            </ol>
        </nav>
        <h1>Edit Author</h1>
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
            <form method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label" for="author_id">Author</label><br>
                    <select class="form-control" id="author_id" name="author_id" required>
                        {foreach from=$authors item=author}
                            <option value="{$author.author_id}">{$author.author_name} {$author.author_surname}</option>
                        {/foreach}
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_author_name">Update Author Name</label>
                    <input type="text" class="form-control" id="new_author_name" name="new_author_name" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_author_surname">Update Author Surname</label>
                    <input type="text" class="form-control" id="new_author_surname" name="new_author_surname" required>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label">Update Author Image</label>
                    <input class="form-control" type="file" id="formFile" name="new_author_image" required>
                </div>
                <div class="mb-3">
                    <label class="form-label" for="new_author_bio">Update Author Bio</label>
                    <input type="text" class="form-control" id="new_author_bio" name="new_author_bio" required>
                </div>
                <button type="submit" name="edit-author" value="1" class="btn btn-primary">Update Author</button><br>
            </form>
        </div>
    </div>
{/block}