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
                padding: 2% 4%;
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
            strong {color: white;}
            
            legend{
                padding: 5% 2%;
            }
        </style>
    </head>
    <body>
        <h1>Sistema de Bolsas</h1>

        <form action="salvar" class="topnav">
            <a class="active" href="index.html" style="font-size: 100%">Home</a>
            <fieldset>
                <legend><a href="listar" style="font-size: 130%">Registro</a></legend>
                <div>
                    <img src="bolsas.jpg" alt="Bolsas" align="right" style="width:33%;">
                    <img src="Cart.jpg" alt="Girl" align="right" style="width:30.40%;">
                </div>
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
                <div>
                    <input style="font-size: 100%" type="submit" value="Salvar" style="align-self:"  />
                </div>
            </fieldset>
            <br>
            <br>

        </form>
    </body>
</html>
