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
                padding: 14px 16px;
                text-decoration: none;
                font-size: 17px;
            }
            .topnav a:hover {
                background-color: #ddd;
                color: black;
            }
            .topnav a.active {
                background-color: #4CAF50;
                color: white;
            }
            strong {color: white;}
            table, th, td {
                color: #ddd;
                border-style: solid;
                border-width: thin;
                width: 850px;
            }
        </style>
    </head>
    <body>
        <h1>Bolsa</h1>

        <form  class="topnav">
            <a class="active" href="nova">Nova Bolsa</a>

            <fieldset>
       <!-- <div><img height="30" src="${bolsa.material}.jpg"></div> -->
                <legend><a href="listar"><h2>Registro</h2></a></legend>
                <table>
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
                <!-- <div>Marca: <br>
                ${bolsa.marca} </div>
            <div>Cor: <br>
                ${bolsa.cor}
            </div>
            <div>Tamanho: <br>
                ${bolsa.tamanho}
            </div>
            <div>Tipo de bolsa: <br>
                <i>${bolsa.tiposBolsa}</i>
            </div>
            <div>Material: <br>
                ${bolsa.material}</div> 
                -->
            </fieldset>
        </form>
    </bod
</body>
</html>
