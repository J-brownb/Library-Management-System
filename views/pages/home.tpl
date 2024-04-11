{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="banner pt-5 pb-5">
        <div class="container intro pt-3 pb-5 text-center">
            <h1>Welcome to the Library</h1>
            <div class="search-select">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active " id="book-tab" data-bs-toggle="tab" data-bs-target="#books"
                            type="button" role="tab" aria-controls="home" aria-selected="true"
                            aria-label="book search">Books <i class="fa-solid fa-book"></i></button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="author-tab" data-bs-toggle="tab" data-bs-target="#authors"
                            type="button" role="tab" aria-controls="profile" aria-selected="false"
                            aria-label="author search">Authors <i class="fa-solid fa-pen"></i></button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="books" role="tabpanel" aria-labelledby="home-tab">
                        <form action="/SDDE-assignment/search-books" method="post">
                            <input type="text" placeholder="Search Books.." name="bookQuery" onfocus="this.value=''" />
                            <button type="submit" class="homeSearch">Search <i class="fa fa-search"></i></button>
                        </form>
                    </div>
                    <div class="tab-pane fade" id="authors" role="tabpanel" aria-labelledby="profile-tab">
                        <form action="/SDDE-assignment/search-authors" method="post">
                            <input type="text" placeholder="Search Authors.." name="authorQuery" onfocus="this.value=''" />
                            <button type="submit" class="homeSearch">Search <i class="fa fa-search"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {if $user_data}
        {* Page content if user is logged in *}
        <div class="container pt-5 pb-5">
            <h2>Welcome back, {$user_data['user_name']}</h2>
            <p>{$_SESSION["user_type"]}</p>
            <div class="row pt-5 pb-5">
                <div class="col-md account-options">
                    <i class="fa-solid fa-book"></i>
                    <p><strong>Books</strong></p>
                    <p><a href="/SDDE-assignment/books">View Books</a></p>
                    {* Visible if account type is employee *}
                    {if in_array('Employee', $user_data)}
                        <p><a href="/SDDE-assignment/add-book">Add Book</a></p>
                        <p><a href="/SDDE-assignment/edit-book">Edit Book</a></p>
                        <p><a href="/SDDE-assignment/delete-book">Delete Book</a></p>
                    {/if}
                    </ul>
                </div>
                <div class="col-md account-options">
                    <i class="fa-solid fa-pen"></i>
                    <p><strong>Authors</strong></p>
                    <p><a href="/SDDE-assignment/authors">View Authors</a></p>
                    {if in_array('Employee', $user_data)}
                        <p><a href="/SDDE-assignment/add-author">Add Author</a></p>
                        <p><a href="/SDDE-assignment/edit-author">Edit Author</a></p>
                        <p><a href=" /SDDE-assignment/delete-author">Delete Author</a></p>
                    {/if}
                </div>
                {if in_array('Employee', $user_data)}
                    <div class="col-md account-options">
                        <i class="fa-solid fa-users"></i>
                        <p><strong>Users</strong></p>
                        <p><a href="/SDDE-assignment/users">View Users</a></p>
                        <p><a href="/SDDE-assignment/add-user">Add User</a></p>
                        <p><a href="/SDDE-assignment/edit-user">Edit User</a></p>
                        <p><a href="/SDDE-assignment/delete-user">Delete User</a></p>
                    </div>
                    <div class="col-md account-options">
                        <i class="fa-solid fa-repeat"></i>
                        <p><strong>Lending / Returns</strong></p>
                        <p><a href="/SDDE-assignment/lend-book">Lend Book</a></p>
                        <p><a href="/SDDE-assignment/return-book">Return Book</a></p>
                    </div>
                {/if}
                <div class="col-md account-options">
                    <i class="fa-solid fa-user"></i>
                    <p><strong>Your Account</strong></p>
                    <p><a href="/SDDE-assignment/account">View Account</a></p>
                    {* Visible if account type is customer*}
                    {if in_array('Customer', $user_data)}
                        <p><a href="/SDDE-assignment/my-books">Your Books</a></p>
                        <p><a href="/SDDE-assignment/my-reviews">Your Reviews</a></p>
                        <p><a href="/SDDE-assignment/my-fines">Your Fines</a></p>
                    {/if}
                    <p><a href="/SDDE-assignment/logout">Logout</a></p>
                </div>
            </div>
        </div>
    {else}
        {* Page content if user is not logged in *}
        <div class="container pt-5 pb-5">
            <h2>Recently Added Books</h2>
            <div class="row pt-5 pb-5">
                {foreach from=$books item=book}
                    <div class="col-sm mb-3 mt-3">
                        <a href='/SDDE-assignment/book-listing/{$book.book_listing_id}'>
                            <img src="/SDDE-assignment/images/books/{$book.book_image}" width="200" height="300"
                                alt="{$book.book_title}">
                        </a><br>
                        <h3>{$book.book_title}</h3>
                        <p>
                            <a href='/SDDE-assignment/author-listing/{$book.author_id}'>
                                {$book.author_name} {$book.author_surname}
                            </a>
                        </p>
                        {if $book.avg_rating}
                            <p><i class="fas fa-star"></i> {$book.avg_rating} / 5</p>
                        {else}
                            <p>No rating yet</p>
                        {/if}
                        <a href='/SDDE-assignment/book-listing/{$book.book_listing_id}'>
                            <button>View <i class="fa fa-search"></i></button>
                        </a><br>
                    </div>
                {/foreach}
            </div>
        </div>

        <div class="container pt-5 pb-5 mb-5">
            <div class="row">
                <div class="col">
                    <h2>Recently Added Author</h2>
                    {foreach from=$authors item=author}
                        <div class="col-sm">
                            <p><strong>{$author.author_name} {$author.author_surname}</strong></p>
                            <p>{$author.author_bio}</p>
                            <a href='/SDDE-assignment/author-listing/{$author.author_id}'> <button>View <i
                                        class="fa fa-search"></i></button></a><br>
                        </div>
                    {/foreach}
                </div>
                <div class="col">
                    {foreach from=$authors item=author}
                        <div class="col-sm">
                            <img src="/SDDE-assignment/images/authors/{$author.author_image}" width="350" height="400"
                                alt="{$author.author_name} {$author.author_surname}">
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    {/if}

{/block}