{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item"><a href="/SDDE-assignment/account">Account</a></li>
                <li class="breadcrumb-item active" aria-current="page">Your Reviews</li>
            </ol>
        </nav>
        <h1>Your Reviews</h1>
        <div class="row pt-5 pb-5">
            {if $reviews}
                {foreach from=$reviews item=review}
                    <div class="col-md-6">
                        <div class="card mb-3">
                            <div class="card-header">{$review.book_title} -
                                <i class="fas fa-star"></i>{$review.review_rating}/5
                            </div>
                            <div class="card-body">
                                <p class="card-text">
                                    {$review.review_text}</p>
                            </div>
                        </div>
                    </div>
                {/foreach}
            {else}
                <p>You have not submitted any reviews yet.</p>
            {/if}
        </div>
    </div>
{/block}