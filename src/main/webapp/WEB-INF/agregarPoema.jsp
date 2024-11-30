<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title> Agregar Poemas </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-3">
        <h1>Poemas</h1>
        <h3>Agregar poema</h3>
        <div class="col-8 d-flex justify-content-end align-items-center">
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
        <div>
            <form:form class="col-3" action="/agregar/poema" method="POST" modelAttribute="poema">
                <div>
                    <form:label class="form-label" path="titulo"> Título: </form:label>
                    <form:input class="form-control" path="titulo" />
                    <form:errors class="alert alert-danger d-block" path="titulo" /> 
                </div>
                <div>
                    <form:label class="form-label" path="autor"> Autor: </form:label>
                    <form:input class="form-control" path="autor" />
                    <form:errors class="alert alert-danger d-block" path="autor" /> 
                </div>
                <div>
                    <form:label class="form-label" path="año"> año: </form:label>
                    <form:input class="form-control" path="año" />
                    <form:errors class="alert alert-danger d-block" path="año" /> 
                </div>
                <div>
                    <form:label class="form-label" path="letra"> Letra: </form:label>
                    <form:input class="form-control" path="letra" />
                    <form:errors class="alert alert-danger d-block" path="letra" /> 
                </div>
                <div>
                    <button class="btn btn-primary mt-3">Agregar</button>
                </div>
            </form:form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>