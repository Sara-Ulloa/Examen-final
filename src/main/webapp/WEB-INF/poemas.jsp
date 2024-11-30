<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>POEMAS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/css/estilos.css" rel="stylesheet"/>
</head>
<body>
<div class="container mt-3">
    <nav>
        <div class="row">
            <div class="col-8">
                <h1>Poemas</h1>
                <h3>Bienvenid@ de vuelta ${nombre_usuario}</h3>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <form action="/poemas" method="GET" class="me-2">
                    <button class="btn btn-light">Todos los poemas</button>
                </form>
                <form action="/formulario/poema" method="GET" class="me-2">
                    <button class="btn btn-light">Agregar poema</button>
                </form>
                <form action="/logout" method="GET">
                    <button class="btn btn-light">Logout</button>
                </form>
            </div>
        </div>
    </nav>

    <c:forEach var="poema" items="${poemas}">
        <a href="/detalles/poema/${poema.id}" class="text-decoration-none">
            <div class="tarjeta-poema">
                <div class="titulo-poema">${poema.titulo}</div>
                <div class="junke">
                    <div class="autor-container">
                        <h6>Autor</h6>
                        <div class="autor-poema">${poema.autor}</div>
                    </div>
                    <a href="/editar/poema/${poema.id}" class="boton-poema">
                        <img src="/img/lapiz.jpg" alt="Editar" class="icono-poema"/>
                    </a>
                </div>
            </div>
        </a>
    </c:forEach>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>