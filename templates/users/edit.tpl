{extends file="layout.tpl"}

{block name=title}
    <title>Edit User: {$user->firstname}</title>
{/block}

{block name=head}
    <link rel="stylesheet" href="css/edit.css">
{/block}

{block name="content"}
    <div id="login">
        <div id="login-box">
            <h2>Użytkownik, którego właśnie edytujesz: <u>{$user->firstname} {$user->lastname}</u></h2>
            <input type="hidden" name="userID" value="{$user->id}">
            <form id="newData" method="post" action="index.php?method=update">
                <h3>Nowe dane</h3>

                <div class="form-group">
                    <label for="firstname" class="text-info">Imię</label>
                    <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Stare Imię: {$user->firstname}">
                </div>

                <div class="form-group">
                    <label for="lastname" class="text-info">Nazwisko</label>
                    <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Stare Nazwisko: {$user->lastname}">
                </div>

                <div class="form-group">
                    <label for="email" class="text-info">E-mail</label>
                    <input type="email" class="form-control" name="email" id="email" placeholder="Stary E-mail: {$user->email}">
                </div>

                <div class="form-group">
                    <label for="password" class="text-info">Hasło</label>
                    <input type="password" class="form-control" name="password" id="password" placeholder="Wprowadź nowe hasło">
                </div>

                <div class="form-group">
                    <button type="submit" id="btn" class="btn btn-info">Zatwierdź dane</button>
                </div>
            </form>
        </div>
    </div>
{/block}
