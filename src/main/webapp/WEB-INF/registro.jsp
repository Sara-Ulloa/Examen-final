<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container mt-3">
        <div>
            <h1>Poemas</h1>
        </div>
        <div>
            <h3>Registro</h3>
        </div>
        <div class="row">
            <form:form class="col-6" action="/procesa/registro" method="POST" modelAttribute="usuario">
                <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
                    <a href="/login" type="button" class="btn btn-light">Login</a>
                </div>
                <div>
                    <form:label class="form-label" path="nombre">Nombre:</form:label>
                    <form:input class="form-control" path="nombre"/>
                    <form:errors class="alert alert-danger d-block" path="nombre"/>
                </div>
                <div>
                    <form:label class="form-label" path="apellido">Apellido:</form:label>
                    <form:input class="form-control" path="apellido"/>
                    <form:errors class="alert alert-danger d-block" path="apellido"/>
                </div>
                <div>
                    <form:label class="form-label" path="correo">Correo:</form:label>
                    <form:input class="form-control" path="correo" type="email"/>
                    <form:errors class="alert alert-danger d-block" path="correo"/>
                </div>
                <div>
                    <form:label class="form-label" path="contrasenia">Contraseña:</form:label>
                    <form:input class="form-control" path="contrasenia" type="password"/>
                    <form:errors class="alert alert-danger d-block" path="contrasenia"/>
                </div>
                <div>
                    <form:label class="form-label" path="confirmacionContrasenia">Confirmar Contraseña:</form:label>
                    <form:input class="form-control" path="confirmacionContrasenia" type="password"/>
                    <form:errors class="alert alert-danger d-block" path="confirmacionContrasenia"/>
                </div>
                <div class="d-grid gap-2 col-6 mt-3">
                    <button type="submit" class="btn btn-primary btn-lg">Registrarse</button>
                </div>
            </form:form>
        </div>
    </div>
</body>
</html>