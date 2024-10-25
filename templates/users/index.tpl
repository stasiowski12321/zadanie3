{extends file="layout.tpl"}
{block name=title}
<title>Strona Główna</title>
{/block}
{block name=head}
<link rel="stylesheet" href="css/index.css">
{/block}
{block name="content"}
    <table>
        <thead>
            <tr>
                <th>First Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        {foreach from=$users item=user}
            <tr>
                <td>{$user.firstname}</td>
                <td><a class="button" href="?id={$user.id}&method=loadEditForm">Edit</a></td>
                <td><a class="button delete" href="?id={$user.id}&method=delete">Delete</a></td>
            </tr>
        {/foreach}
        </tbody>
    </table>
    <a class="button" href="?method=loadCreateForm">Stwórz nowego użytkownika</a>
{/block}
