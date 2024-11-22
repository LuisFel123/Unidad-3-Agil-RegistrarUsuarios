<%-- 
    Document   : index
    Created on : 7 nov 2024, 11:08:53
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="js/script.js"></script>
        <link rel="stylesheet" href="css/style.css">

    </head>
    <body>
        <%

            String mensaje = (String) request.getSession().getAttribute("mensaje");
            if (mensaje == null) {
                mensaje = new String();
            }

        %>

        <div
            class="login relative mx-auto w-full max-w-md bg-white px-6 pt-10 pb-8 shadow-xl ring-1 ring-gray-900/5 sm:rounded-xl sm:px-10">
            <div class="w-full">
                <div class="text-center">
                    <h1 class="text-3xl font-semibold text-gray-900">Bienvenido</h1>
                    <p class="mt-2 text-gray-500">Ingresa tus datos</p>
                </div>
                <div class="mt-5">
                    <form name="acceso" action="Acceso" method="post">
                        <div class="relative mt-6">
                            <input type="text" name="usuario" value="" required="true" class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" autocomplete="NA" />
                            <label for="email" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Usuario</label>
                        </div>
                        <div class="relative mt-6">
                            <input type="password" name="password" value="" required="true"  class="peer peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" />
                            <label for="password" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Contraseña</label>
                        </div>
                        <div class="my-6">
                            <button type="submit" value="Ingresar" name="ingreso" class="w-full rounded-md bg-black px-3 py-4 text-white focus:bg-gray-600 focus:outline-none">Ingresar</button>
                        </div>
                    </form>
                </div>
                <form action="Acceso" method="post">
                    <p class="text-center text-sm text-gray-500">¿Aún no tienes una cuenta?
                        <button type="submit" value="Registrarse" name="registro" class="font-semibold text-gray-600 hover:underline focus:text-gray-800 focus:outline-none">Registrate
                        </button>
                    </p>
                </form>
            </div>
            <label style="color:green"><%=mensaje%> </label>
        </div>
    </body>
</html>