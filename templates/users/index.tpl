<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .button {
            display: inline-block;
            padding: 10px 15px;
            margin: 5px;
            background-color: #007BFF;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.2s;
        }
        .button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .button.delete {
            background-color: #FF5733;
        }
        .button.delete:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
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
</body>
</html>
