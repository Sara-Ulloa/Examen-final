<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Editar poema</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
		<link href="/css/peliculas.css" rel="stylesheet"/>
	</head>
	<body>
		<div class="container mt-3">
			<div class="row">
				<h1 class="col-10">Poemas</h1>
				<h3>Editar poema</h3>
			<div class="col-6 d-flex justify-content-end align-items-center">
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
			<div class="row">
				<form:form class="col-6" action="/actualizar/poema/${poema.id}" method="POST" modelAttribute="poema">
				<div>
					  <input type="hidden" name="_method" value="PUT" />
                    <form:label class="form-label" path="titulo">Título</form:label>
                    <form:input class="form-control" path="titulo"/>
                    <form:errors class="alert alert-danger d-block" path="titulo"/>
                </div>
                <div>
                    <form:label class="form-label" path="autor">Autor</form:label>
                    <form:input class="form-control" path="autor"/>
                    <form:errors class="alert alert-danger d-block" path="autor"/>
                </div>
                <div>
                    <form:label class="form-label" path="año">año</form:label>
                    <form:input class="form-control" path="año"/>
                    <form:errors class="alert alert-danger d-block" path="año"/>
                </div>
                <div>
                    <form:label class="form-label" path="letra">Letra</form:label>
                    <form:input class="form-control" path="letra"/>
                    <form:errors class="alert alert-danger d-block" path="letra"/>
                </div>
   							 <button type="submit" class="btn btn-primary">
        							Editar
   							 </button>
				</form:form>
			</div>
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</body>
</html>