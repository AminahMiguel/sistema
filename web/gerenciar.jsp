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
        </style>
    </head>
    <body>
        <h1>Sistema de Bolsas</h1>

        <form action="salvar" class="topnav">
            <a class="active" href="index.html">Home</a>
            <fieldset>
                <legend><a href="listar"><h2>Registro</h2></a></legend>
                <img src="bolsas.jpg" alt="Bolsas" align="right" style="width:400px;">
                <img src="Cart.jpg" alt="Girl" align="right" style="width:369px;">

                <input type="hidden" name="codigo" value="${bolsa.codigo}" />
                <div><strong>Marca:</strong><br>
                    <input name="marca" value="${bolsa.marca}" size="40" /></div>
                <br>
                <div><strong>Cor:</strong><br>
                    <input name="cor" value="${bolsa.cor}" size="40" /></div>
                <br>
                <div><strong>Tamanho:</strong><br>
                    <input name="tamanho" value="${bolsa.cor}" size="40" /></div>
                <br>
                <div><strong>Tipo de bolsa:</strong><br>
                    <textarea name="tiposBolsa" cols="42">${bolsa.tiposBolsa}</textarea>
                </div>
                <br>
                <div><strong>Material: </strong><select name="material">
                        <option value="Couro" ${bolsa.material == 'Couro' || bolsa.material == null ? 'selected' : ''}>Couro</option>
                        <option value="Veludo" ${bolsa.material == 'Veludo' ? 'selected' : ''}>Veludo</option>
                    </select>
                </div>
                <br>
            </fieldset>
            <div>
                <input type="submit" value="Salvar" />
            </div>
        </form>
    </body>
</html>
