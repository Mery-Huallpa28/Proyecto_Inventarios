<%
    if (session.getAttribute("logueado") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="styles.css" />
        <style>
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://www.impulsonegocios.com/wp-content/uploads/2021/04/SUPERMERCADOS-Y-PROVEDORES.jpg'); /* URL de la imagen de fondo */
            background-size: cover; /* Cubre toda la pantalla */
            background-position: center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita repetir la imagen */
        }
        .container-hero {
            background-color: #343a40;
            color: white;
            padding: 10px 0;
        }
        .container-logo h1 {
            margin: 0;
            padding: 0;
            text-align: center;
            color: #343a40; /* Color del título de la empresa */
            font-size: 28px;
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        .container-logo h1 a {
            color: #343a40; /* Color del título de la empresa */
            text-decoration: none;
        }
        .container-user {
            text-align: right;
            padding-right: 20px;
        }
        header {
            background-color: #007bff;
            padding: 10px 0;
            color: white;
        }
        .container {
            padding: 20px;
            background-color: white;
            margin: 20px auto;
            max-width: 600px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .container h1 {
            text-align: center;
            color: #343a40; /* Color del título */
            font-size: 24px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #343a40; /* Color del texto */
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-family: Arial, sans-serif; /* Fuente sans-serif para los campos de formulario */
        }
        .btn {
            text-decoration: none;
            padding: 10px 20px;
            color: white;
            background-color: #007bff;
            border-radius: 5px;
            display: inline-block;
            border: none;
            cursor: pointer;
            font-size: 16px;
            font-family: 'Times New Roman', Times, serif; /* Fuente serif para un estilo más clásico */
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
        <title>Categoria</title>
    </head>
    <body>
        <div class="container-hero">
            <div class="container hero">
                <div class="customer-support">

                    <div class="">

                    </div>
                </div>

                <div class="container-logo">
                    <i class=""></i>
                    <h1 class=""><a href="/">Bodega de Inventarios</a></h1>
                </div>

                <div class="container-user">
                    <i class=""></i>
                    <i class=""></i>

                </div>
            </div>
        </div>
        <jsp:include page="WEB-INF/menu.jsp" >
            <jsp:param name="opcion" value="usuarios" />
        </jsp:include>
        <div class="container">
            <h1>Formulario de Usuarios</h1>   

            < <br>
            <form action="UsuarioController" method="post">
                <input type="hidden" name="id" value="${usuario.id}">

                <div class="form-group">
                    <label for="" class="form-label">Nombres</label>
                    <input type="text" class="form-control" name="nombres" value="${usuarios.nombres}" placeholder="Escriba su Nombre">

                </div>
                    <div class="form-group">
                    <label for="" class="form-label">Apellidos</label>
                    <input type="text" class="form-control" name="apellidos" value="${usuarios.apellidos}" placeholder="Escriba su Apellido">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Correo Electronico</label>
                    <input type="email" class="form-control" name="correo" value="${usuario.correo}" placeholder="Escriba su correo Electronico">

                </div>
                <div class="form-group">
                    <label for="" class="form-label">Password</label>
                    <input type="password" class="form-control" name="password" value="${usuario.password}" placeholder="Escriba su Password">

                </div>
                <button type="submit" class="btn btn-primary">Enviar</button>
            </form>   






        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    </body>
</html>