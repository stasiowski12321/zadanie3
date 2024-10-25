{extends file="layout.tpl"}
{block name=title}
<title>Formularz Tworzący Użytkownika</title>
{/block}
{block name=head}
<link rel="stylesheet" href="css/create.css">
{/block}
    {block name="content"}
<h2>Tworzenie nowego użytkownika</h2>
<form method="post" action="index.php?method=createUser">
        <div class="row">
            <div class="col">
                <label for="firstname" class="text-info">Imię</label>
                <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Podaj imię użytkownika">
            </div>

            <div class="col">
                <label for="lastname" class="text-info">Nazwisko</label>
                <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Podaj nazwisko użytkownika">
            </div>

            <div class="col">
                <label for="email" class="text-info">E-mail</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Podaj e-mail użytkownika">
            </div>

            <div class="col">
                <label for="password" class="text-info">Hasło</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Podaj hasło użytkownika">
            </div>
            
            <div class="col">
                <button type="submit" id="btn" class="btn btn-info">Zatwierdź dane</button>
                <button type="reset" class="btn btn-secondary">Wyczyść dane formularza</button>
            </div>
        </div>
</form>
    {/block}