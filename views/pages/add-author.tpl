{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Edit Author</li>
            </ol>
        </nav>
        <h1 class="mb-3">Add New Author</h1>
        {if $error}
            <div class="alert alert-danger mb-z3" role="alert">
                {$error}
            </div>
        {else if $success}
            <div class="alert alert-success mb-3" role="alert">
                {$success}
            </div>
        {/if}
        <form method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label class="form-label" for="author_name">Author First Name</label>
                <input type="text" class="form-control" id="author_name" name="author_name" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="author_surname">Author Last Name</label>
                <input type="text" class="form-control" id="author_surname" name="author_surname" required>
            </div>
            <div class="mb-3">
                <label class="form-label" for="author_bio">Author Bio</label>
                <input type="text" class="form-control" id="author_bio" name="author_bio" required>
            </div>
            <div class="mb-3">
                <label for="formFile" class="form-label">Author Image</label>
                <input class="form-control" type="file" id="formFile" name="author_image" required>
            </div>
            <button type="submit">Add Author</button>
        </form>
    </div>
{/block}