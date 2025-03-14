<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*,java.text.*" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>LOGIN</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
	<div class="container mt-3"></div>
        <h1>Poemas</h1>
        <h3>Login</h3>
        <div class="row">
                <form:form class="col-6" action="/procesa/login" method="POST" modelAttribute="usuarioLogin">
                    <div>
                        <form:label class="form-label" path="correo"> Correo: </form:label>
                        <form:input class="form-control" path="correo" />
                        <form:errors class="alert alert-danger d-block" path="correo" /> 
                    </div>
                    <div>
                        <form:label class="form-label" path="contrasenia"> Constraseña: </form:label>
                        <form:input class="form-control" path="contrasenia" type="password"/>
                        <form:errors class="alert alert-danger d-block" path="contrasenia" /> 
                    </div>
                    <button class="btn btn-primary">
                        Login
                    </button>
                </form:form>
            </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>