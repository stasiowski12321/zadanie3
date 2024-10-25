{extends file="layout.tpl"}

{block name=title}
<title>Strona Główna</title>
{/block}

{block name=head}
<link rel="stylesheet" href="css/index.css">
{/block}

{block name="content"}
    <div id="user-table">
        <h2>Lista Użytkowników</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>Imię</th>
                    <th>Edytuj</th>
                    <th>Usuń</th>
                </tr>
            </thead>
            <tbody>
            {foreach from=$users item=user}
                <tr>
                    <td>{$user.firstname}</td>
                    <td><a class="button btn btn-info" href="?id={$user.id}&method=loadEditForm">Edytuj</a></td>
                    <td><a class="button btn btn-danger delete" href="?id={$user.id}&method=delete">Usuń</a></td>
                </tr>
            {/foreach}
            </tbody>
        </table>
        <div class="form-group">
            <a class="button btn btn-primary" href="?method=loadCreateForm">Stwórz nowego użytkownika</a>
        </div>
    </div>
{/block}
