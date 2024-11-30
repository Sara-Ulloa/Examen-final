<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Detalle del poema</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="/css/detalles.css" rel="stylesheet"/>
</head>
<body>
    <div class="container mt-3">
        <h1>Poemas</h1>

        <div class="col-6 d-flex justify-content-end align-items-center mb-3">
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
        
        <div class="row">
            <div class="col-md-6 col-sm-8 d-flex flex-column">
            <div class="cuadradito">
            <fieldset>
                        <h3>${detallePoema.titulo}</h3>
                    <div class="card-body">
                        <div class="categoria-container">
                        
                            <div class="lista"><strong>Agregado por</strong>
                            <p>${nombre_usuario}</p>
                            </div>
                            
                           	<div class="lista"><strong>Autor</strong>
                           	<p>${detallePoema.autor}</p>
                           	</div>
                           	
                           	<div class="lista"><strong>Año</strong>
                           	<p>${detallePoema.año}</p>
                           	</div>
                           	
                        </div>
                        <div class="lista"><strong>Letra</strong>
                        <p>${detallePoema.letra}</p>
                        </div>
                    </div>
               </fieldset>
                </div>
                <form action="/eliminar/poema/${detallePoema.id}" method="POST">
                    <input type="hidden" name="_method" value="DELETE"/>
                    <button class="btn btn-danger btn-block">Eliminar poema</button>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>