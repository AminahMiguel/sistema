<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                width: 50%;
            }
        </style>
    </head>
    <body>
        <h1>Bolsas Registradas</h1>
        <form  class="topnav">

            <c:if test="${empty lista}">
                <div>Nenhuma bolsa foi encontrada, clique 
                    <a href="nova">aqui</a>  
                    para registrar uma</div>
                </c:if>

            <c:if test="${not empty lista}">
                <fieldset>
                    <legend><a class="active" href="nova"><h3>Nova Bolsa</h3></a></legend>
                    <table>
                        <tr>
                            <th><strong> Marca </strong></th>
                            <th><strong>Material</strong></th>
                        </tr>
                        <c:forEach var="r" items="${lista}">
                            <tr>
                                <td>${r.marca}</td>
                                <td>${r.material}</td>

                                <td><a href="excluir?codigo=${r.codigo}">excluir</a></td>
                                <td><a href="editar?codigo=${r.codigo}">editar</a></td>
                                <td><a href="consultar?codigo=${r.codigo}">consultar</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </fieldset>
            </c:if>
        </form>
    </body>
</html>
