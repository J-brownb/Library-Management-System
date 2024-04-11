{extends file="layouts/main.tpl"}
{block name ="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item"><a href="/SDDE-assignment/books">Books</a></li>
                <li class="breadcrumb-item active" aria-current="page">{$book.book_title}</li>
            </ol>
        </nav>
        <h1>{$book.book_title}</h1>
        <div class="row pt-5 pb-5">

            {if $error}
                <div class="alert alert-danger mb-3" role="alert">
                    {$error}
                </div>
            {else if $success}
                <div class="alert alert-success mb-3" role="alert">
                    {$success}
                </div>
            {/if}
            <div class="col">
                <img src="/SDDE-assignment/images/books/{$book.book_image}" width="305" height="500"
                    alt="{$book.book_title}">
            </div>
            <div class="col">
                <h3>Book Information</h3>
                <p>{$book.book_description}</p>
                <strong>
                    <p><a href='/SDDE-assignment/author-listing/{$book.author_id}'>{$book.author_name}
                            {$book.author_surname}</a></p>
                </strong>
                <p><strong>ISBN: </strong>{$book.book_ISBN}</p>
                <p><strong>Number in Stock: </strong>{$book.book_number_available}</p>
                <p><strong>Pages: </strong>{$book.book_pages}</p>
                <p><strong>Genre: </strong>{$book.book_genre}</p>
                <p><strong>Language: </strong>{$book.book_language}</p>
                <p><strong>User Rating: </strong><i class="fas fa-star"></i> {$book_rating} / 5 Stars</p>
            </div>
            {if $reviews}
                <div class="row pt-3">
                    <h2>Latest Reviews of this Book</h2>
                    {foreach $reviews as $review}
                        <div class="col pb-3">
                            <div class="card mb-3">
                                <div class="card-header">
                                    <i class="mb-2 fas fa-star"></i> {$review.review_rating}/5
                                    <h6 class="card-subtitle text-muted">Review by {$review.user_name}</h6>
                                </div>
                                <div class="card-body">
                                    <p class="card-text">{$review.review_text}</p>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                </div>
            {else}
                {* display if not current review for book *}
                <p class="pt-5">No reviews yet. Be first to leave one!</p>
            {/if}
        </div>
        <div class="row">
            <div class="col">
                <h2 class="pb-3">Read this book? Leave a review</h2>
                {if $user_data}
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="rating">Rating</label>
                            <select class="form-control" id="rating" name="rating">
                                <option value="1">1 Star (Very bad)</option>
                                <option value="2">2 Star (Bad)</option>
                                <option value="3">3 Star (Okay)</option>
                                <option value="4">4 Star (Good)</option>
                                <option value="5">5 Star (Very Good)</option>
                            </select>
                            <label class="form-label" for="review_text">Comments</label>

                            <input type="text" class="form-control" id="review_text" name="review_text" required />
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                {else}
                    <div class="alert alert-primary" role="alert">
                        Please <a href="/SDDE-assignment/login">login</a> to leave a review of this book.
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/block}