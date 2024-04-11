{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pb-5 pt-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Account</li>
            </ol>
        </nav>
        <h1>{$user_data['user_name']}'s Account</h1>
    <div class="container account_options pb-5">
        <div class="row pt-5">
            <div class="col-md account-options">
                <i class="fa-solid fa-user"></i>
                <p><a href="/SDDE-assignment/account-details">Account Details</a></p>
            </div>
            {* Visible if account type is customer *}
            {if in_array('Customer', $user_data)}
            <div class="col-md account-options">
                <i class="fa-solid fa-book"></i>
                <p><a href="/SDDE-assignment/my-books">Your Books</a></p>
            </div>
            <div class="col-md account-options">
                <i class="fa-solid fa-star"></i>
                <p><a href="/SDDE-assignment/my-reviews">Your Reviews</a></p>
            </div>
            <div class="col-md account-options">
                <i class="fa-solid fa-money-bill"></i>
                <p><a href="/SDDE-assignment/my-fines">Your Fines</a></p>
            </div>
            {/if}
            <div class="col-md account-options">
                <i class="fa-solid fa-key"></i>
                <p><a href="/SDDE-assignment/changepassword">Change Password</a></p>
            </div>
            <div class="col-md account-options">
                <i class="fa-solid fa-trash-can"></i>
                <form method="post">
                    <select class="form-control hidden" id="user_id" name="user_id" required>
                        <option value="{$user_data['user_id']}">{$user_data['user_id']}</option>
                        </select>
                        <button type="submit" class="destructive" name="delete-account" value="1">Delete Account </button>
                    </form>

                </div>
            </div>
        </div>
    </div>
{/block}