{extends file="layouts/main.tpl"}
{block name="body"}
    <div class="container pt-5 pb-5">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/SDDE-assignment/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">Login</li>
            </ol>
        </nav>
        <h1>Customer Registration</h1>
        <form class="m-5" id="registration-form" method="post" action="">
            {if $error}
                <div class="alert alert-danger mb-3" role="alert">
                    {$error}
                </div>
            {else if $success}
                <div class="alert alert-success mb-3" role="alert">
                    {$success}
                </div>
            {/if}
            <div class="row mb-3">
                <div class="col">
                    <label class="form-label" for="name">First Name</label>
                    <input type="text" class="form-control" id="name" name="name" required />
                </div>
                <div class="col">
                    <label class="form-label" for="surname">Last Name</label>
                    <input type="text" class="form-control" id="surname" name="surname" required />
                </div>
            </div>
            <div class="mb-3">
                <label class="form-label" for="reg_email">Email address</label>
                <input type="email" class="form-control" id="reg_email" name="email" required />
            </div>
            <div class="mb-3">
                <label class="form-label" for="reg_password">Password</label>
                <input type="password" class="form-control" id="reg_password" name="password" required />
            </div>
            <div class="mb-3">
                <label class="form-label" for="reg_password_confirm">Confirm Password</label>
                <input type="password" class="form-control" id="reg_password_confirm" name="password_confirm" required />
            </div>
            <div class="mb-3 hidden">
                <label class="form-label" for="account_type">Account Type</label>
                <select class="form-select" aria-label="Default select example" name="type">
                    <option value="1">Customer</option>
                    <option value="2">Employee</option>
                </select>
            </div>
            <button type="submit" name="register" value="1" class="btn btn-primary">Register</button><br>
        </form>
    </div>
{/block}