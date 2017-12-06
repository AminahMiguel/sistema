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
                padding: 4% 2%;
                text-decoration: none;
                font-size: 7%;
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

                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <h1>Bolsas Registradas</h1>

        <c:if test="${empty lista}">
            <div>Nenhuma bolsa foi encontrada, clique 
                <a href="nova">aqui</a>  
                para registrar uma</div>
            </c:if>
        <form  class="topnav">
            <c:if test="${not empty lista}">
                <fieldset>
                    <legend><a class="active" href="nova" style="font-size: 130%">Nova Bolsa</a></legend>
                   <br>
                    <table style="width:70%">
                        <tr>
                            <th><strong> Marca </strong></th>
                            <th><strong>Material</strong></th>
                        </tr>
                        <c:forEach var="r" items="${lista}">
                            <tr>
                                <td>${r.marca}</td>
                                <td>${r.material}</td>
                                <td><a href="excluir?codigo=${r.codigo}" style="font-size: 100%">excluir</a></td>
                                <td><a href="editar?codigo=${r.codigo}" style="font-size: 100%">editar</a></td>
                                <td><a href="consultar?codigo=${r.codigo}" style="font-size: 100%">consultar</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                </fieldset>
            </c:if>
        </form>
    </body>
</html>
