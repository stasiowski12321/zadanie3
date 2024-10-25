{extends file="layout.tpl"}
{block name=title}
    <title>Edit User: {$user->firstname}</title>
    {/block}
    {block name=head}
    <link rel="stylesheet" href="css/edit.css">
    {/block}
{block name="content"}
    <div id="container">
        <h2>Użytkownik, którego właśnie edytujesz: <u>{$user->firstname} {$user->lastname}</u></h2>
        <form class="column" id="newData" method="post" action="index.php?method=update">
            <h3>Nowe dane</h3>
            <input type="hidden" name="userID" value="{$user->id}">
            
            <label for="firstname">Imię</label>
            <input type="text" name="firstname" id="firstname" placeholder="Stare Imie: {$user->firstname}">

            <label for="lastname">Nazwisko</label>
            <input type="text" name="lastname" id="lastname" placeholder="Stare Nazwisko: {$user->lastname}">

            <label for="email">E-mail</label>
            <input type="email" name="email" id="email" placeholder="Stary E-mail: {$user->email}">

            <label for="password">Hasło</label>
            <input type="password" name="password" id="password" placeholder="Wprowadź nowe hasło">

            <button type="submit" id="btn">Zatwierdz dane</button>
        </form>
    </div>
{/block}
