{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Login</li>
            </ol>
        </nav>
        <h1>Login</h1>
        <form class="m-5" id="login-form" method="post">
            {if $error}
                <div class="alert alert-danger mb-3" role="alert">
                    {$error}
                </div>
            {else if $success}
                <div class="alert alert-success mb-3" role="alert">
                    {$success}
                </div>
            {/if}
            <div class="mb-3">
                <label class="form-label" for="login_email">Email address</label>
                <input type="email" class="form-control" id="login_email" name="email" required />
            </div>
            <div class="mb-3">
                <label class="form-label" for="login_password">Password</label>
                <input type="password" class="form-control" id="login_password" name="password" required />
            </div>
            <button type="submit" name="login" value="1" class="btn btn-primary">Login</button>
        </form>
    </div>
{/block}