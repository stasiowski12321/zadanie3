<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formularz Tworzący Użytkownika</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #4CAF50;
        }

        form {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-right: 10px;
        }

        button:hover {
            background-color: #45a049;
        }

        button[type="reset"] {
            background-color: #f44336;
        }

        button[type="reset"]:hover {
            background-color: #d32f2f;
        }
    </style>
</head>
<body>
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
</body>
</html>
