<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bolsas</title>

        <style>
            body {margin: 0;}
            .topnav {
                overflow: hidden;
                background-color: #333;
            }
            .topnav a{
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 2% 2%;
                text-decoration: none;
                font-size: 17%;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
            legend{
                padding: 5.2% 2%;
            }
            strong {color: white;}
            table, th, td {

                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
                color: white;
            }
        </style>
    </head>
    <body>
        <h1>Bolsa</h1>

        <form  class="topnav">
            <a class="active" href="nova" style="font-size: 100%">Nova Bolsa</a>

            <fieldset>
                <legend><a href="listar" style="font-size: 130%">Registro</a></legend>
                <table style="width:100%">
                    <tr>
                        <th>Marca</th>
                        <th>Cor</th>
                        <th>Tamanho</th>
                        <th>Tipo de bolsa</th>
                        <th>Material</th>
                    </tr>
                    <tr>
                        <td>${bolsa.marca}</td>
                        <td>${bolsa.cor}</td>
                        <td>${bolsa.tamanho}</td>
                        <td>${bolsa.tiposBolsa}</td>
                        <td>${bolsa.material}</td>
                    </tr>
                </table>
            </fieldset>
        </form>
    </bod
</body>
</html>
