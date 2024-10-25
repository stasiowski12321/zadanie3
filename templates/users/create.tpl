{extends file="layout.tpl"}
{block name=title}
<title>Formularz Tworzący Użytkownika</title>
{/block}
{block name=head}
<link rel="stylesheet" href="css/create.css">
{/block}
{block name="content"}
    <h1>Formularz do tworzenia użytkownika</h1>
    <form method="post" action="index.php?method=createUser">
        <label for="firstname">Podaj imie użytkownika</label>
        <input type="text" name="firstname" id="firstname">

        <label for="lastname">Podaj nazwisko użytkownika</label>
        <input type="text" name="lastname" id="lastname">

        <label for="email">Podaj e-mail użytkownika</label>
        <input type="email" name="email" id="email">

        <label for="password">Podaj hasło użytkownika</label>
        <input type="password" name="password" id="password">

        <button type="submit">Zatwierdz Dane</button>
        <button type="reset">Wyczyść Dane Formularza</button>
    </form>
{/block}