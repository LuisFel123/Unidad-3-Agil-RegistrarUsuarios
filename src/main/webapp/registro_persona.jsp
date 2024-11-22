<%-- 
    Document   : registro_persona
    Created on : 7 nov 2024, 11:41:15
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="registro_persona.jsp"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>registri </title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%
            String mensaje = (String) request.getSession().getAttribute("mensaje");
            if (mensaje == null)
                mensaje = new String();
        %>
        <div
            class="login relative mx-auto w-full max-w-md bg-white px-6 pt-10 pb-8 shadow-xl ring-1 ring-gray-900/5 sm:rounded-xl sm:px-10">
            <div class="w-full">
                <div class="text-center">
                    <h1 class="text-3xl font-semibold text-gray-900">Bienvenido</h1>
                    <p class="mt-2 text-gray-500">Ingresa tus datos</p>
                </div>
                <div class="mt-5">
                    <form name="acceso1" action="Acceso" method="POST">
                        <div class="relative mt-6">
                            <input type="text" name="usuario1" value="" required="true" class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" autocomplete="NA" />
                            <label for="usuario1" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Nombre de usuario</label>
                        </div>
                        <div class="relative mt-6">
                            <input type="password" name="password1" value="" required="true"  class="peer peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" />

                            <label for="password1" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Contraseña</label>
                        </div>
                        <div class="relative mt-6">
                            <input type="number" name="edad" value="" required="true"  class="peer peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" />
                            <label for="edad" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Edad</label>
                        </div>
                        <div class="relative mt-6">
                            <input type="number" step="any" name="estatura" value="" required="true"  class="peer peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" />
                            <label for="estatura" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Estatura</label>
                        </div>
                        <div class="relative mt-6">
                            <select name="sexo" required class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 focus:border-gray-500 focus:outline-none">
                                <option value="" disabled selected hidden>Seleccione...</option>
                                <option value="M">M</option>
                                <option value="F">F</option>
                            </select>
                            <label for="sexo" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Género</label>
                        </div>
                        <div class="relative mt-6">
                            <input type="number" name="cadera" value="" required="true"  class="peer peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" />
                            <label for="cadera" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Cadera</label>
                        </div>
                        <div class="relative mt-6">
                            <input type="date" name="fechaNacimiento" required="true" class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" />
                            <label for="fechaNacimiento" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Fecha de Nacimiento</label>
                        </div>
                        <div class="my-6">
                            <button type="submit" value="registrar" name="registrar" class="w-full rounded-md bg-black px-3 py-4 text-white focus:bg-gray-600 focus:outline-none">Registrar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

