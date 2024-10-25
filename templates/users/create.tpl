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
        <div class="row mb-3">
            <div class="col-6">
                <label for="firstname" class="text-info fw-bold">Imię</label>
                <input type="text" class="form-control" name="firstname" id="firstname" placeholder="Podaj imię użytkownika">
            </div>

            <div class="col-6">
                <label for="lastname" class="text-info fw-bold">Nazwisko</label>
                <input type="text" class="form-control" name="lastname" id="lastname" placeholder="Podaj nazwisko użytkownika">
            </div>

            <div class="col-6">
                <label for="email" class="text-info fw-bold">E-mail</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Podaj e-mail użytkownika">
            </div>

            <div class="col-6">
                <label for="password" class="text-info fw-bold">Hasło</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Podaj hasło użytkownika">
            </div>
        </div>

        <dvi class="row">
            <div class="col-12">
                <button type="submit" id="btn" class="btn btn-info">Zatwierdź dane</button>
                <button type="reset" class="btn btn-secondary">Wyczyść dane formularza</button>
            </div>
        </dvi>

</form>
    {/block}