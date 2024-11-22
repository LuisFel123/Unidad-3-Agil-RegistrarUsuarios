<%-- 
    Document   : calorias
    Created on : 13 nov 2024, 4:52:11
    Author     : felip
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdn.tailwindcss.com"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String usuario = (String) request.getSession().getAttribute("usuario");
            String edad = (String) request.getSession().getAttribute("edad");
            String estatura = (String) request.getSession().getAttribute("estatura");
            String cadera = (String) request.getSession().getAttribute("cadera");
            String sexo = (String) request.getSession().getAttribute("sexo1");
            String peso = (String) request.getSession().getAttribute("peso");
            String cintura = (String) request.getSession().getAttribute("cintura");
            String fecha = (String) request.getSession().getAttribute("fecha");

            try {
                Double estaturaO = (estatura != null && !estatura.isEmpty()) ? Double.parseDouble(estatura) : null;
                Double pesoO = (peso != null && !peso.isEmpty()) ? Double.parseDouble(peso) : null;
                Double cinturaO = (cintura != null && !cintura.isEmpty()) ? Double.parseDouble(cintura) : null;
                Double caderaO = (cadera != null && !cadera.isEmpty()) ? Double.parseDouble(cadera) : null;
            } catch (NumberFormatException ex) {
                System.err.println("Error al convertir a número: " + ex.getMessage());
            }
        %>




        <nav class="bg-white border-gray-200 py-2.5 dark:bg-gray-900">
            <div class="flex flex-wrap items-center justify-between max-w-screen-xl px-4 mx-auto">
                <a href="#" class="flex items-center">
                    <i class="fa-solid fa-dumbbell fa-2x h-6 mr-3 sm:h-9"></i>
                    <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">Bienvenido <%=usuario%> </span>
                </a>
                <div class="flex items-center lg:order-2">
                    <div class="hidden mt-2 mr-4 sm:inline-block">
                        <span></span>
                    </div>
                    <form action="Acceso" method="POST">
                        <button class="text-white bg-purple-700 hover:bg-purple-800 focus:ring-4 focus:ring-purple-300 font-medium rounded-lg text-sm px-4 lg:px-5 py-2 lg:py-2.5 sm:mr-2 lg:mr-0 dark:bg-purple-600 dark:hover:bg-purple-700 focus:outline-none dark:focus:ring-purple-800">
                            Cerrar sesion
                        </button>
                    </form>
                    <button data-collapse-toggle="mobile-menu-2" type="button"
                            class="inline-flex items-center p-2 ml-1 text-sm text-gray-500 rounded-lg lg:hidden hover:bg-gray-100 focus:outline-none focus:ring-2 focus:ring-gray-200 dark:text-gray-400 dark:hover:bg-gray-700 dark:focus:ring-gray-600"
                            aria-controls="mobile-menu-2" aria-expanded="true">
                        <span class="sr-only">Open main menu</span>
                        <svg class="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                              clip-rule="evenodd"></path>
                        </svg>
                        <svg class="hidden w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                              clip-rule="evenodd"></path>
                        </svg>
                    </button>
                </div>
                <div class="items-center justify-between w-full lg:flex lg:w-auto lg:order-1" id="mobile-menu-2">
                    <ul class="flex flex-col mt-4 font-medium lg:flex-row lg:space-x-8 lg:mt-0">
                        <li>
                            <a href="home.jsp"
                               class="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-purple-700 lg:p-0 dark:text-gray-400 lg:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white lg:dark:hover:bg-transparent dark:border-gray-700">Home</a>
                        </li>
                        <li>
                            <a href="medidas.jsp"
                               class="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-purple-700 lg:p-0 dark:text-gray-400 lg:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white lg:dark:hover:bg-transparent dark:border-gray-700">Calculo</a>
                        </li>
                        <li>
                            <a href="edicion.jsp"
                               class="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-purple-700 lg:p-0 dark:text-gray-400 lg:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white lg:dark:hover:bg-transparent dark:border-gray-700">Edición</a>
                        </li>
                        <li>
                            <a href="mostrarMedidas.jsp"
                               class="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-purple-700 lg:p-0 dark:text-gray-400 lg:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white lg:dark:hover:bg-transparent dark:border-gray-700">Listar medida</a>
                        </li>

                        <li>
                            <a href="calorias.jsp"
                               class="block py-2 pl-3 pr-4 text-gray-700 border-b border-gray-100 hover:bg-gray-50 lg:hover:bg-transparent lg:border-0 lg:hover:text-purple-700 lg:p-0 dark:text-gray-400 lg:dark:hover:text-white dark:hover:bg-gray-700 dark:hover:text-white lg:dark:hover:bg-transparent dark:border-gray-700">Calcular calorias</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div
            class="login relative mx-auto w-full max-w-md bg-white px-6 pt-10 pb-8 shadow-xl ring-1 ring-gray-900/5 sm:rounded-xl sm:px-10 mt-10">
            <div class="w-full">
                <div class="text-center">
                    <h1 class="text-3xl font-semibold text-gray-900">Informacion Importante</h1>
                </div>
                <div class="mt-5">
                    <form action="caloriasca" method="post">
                        <div class="relative mt-6">
                            <input type="number" step="any" name="edado" required="true" 
                                   class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" 
                                   autocomplete="NA" value="<%=edad%>" readonly />
                            <label for="usuario1" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Edad</label>
                        </div>


                        <div class="relative mt-6">
                            <input type="number" step="any" name="estaturao" required="true" 
                                   class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" 
                                   autocomplete="NA" value="<%=estatura%>" readonly />
                            <label for="usuario1" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Estatura</label>
                        </div>



                        <div class="relative mt-6">
                            <p class="mb-2 text-gray-600">Sexo: <%=sexo%></p>

                            <input type="hidden" name="sexoo" value="<%=sexo%>">
                        </div>


                        <div class="relative mt-6">
                            <input type="number" step="any" name="pesoo" required="true" 
                                   class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" 
                                   autocomplete="NA" value="<%=peso%>" readonly />
                            <label for="usuario1" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Peso</label>
                        </div>

                        <div class="relative mt-6">
                            <input type="number" name="cinturao" required="true" 
                                   class="peer mt-1 w-full border-b-2 border-gray-300 px-0 py-1 placeholder:text-transparent focus:border-gray-500 focus:outline-none" 
                                   autocomplete="NA" value="<%=cintura%>" readonly/>
                            <label for="usuario1" class="pointer-events-none absolute top-0 left-0 origin-left -translate-y-1/2 transform text-sm text-gray-800 opacity-75 transition-all duration-100 ease-in-out peer-placeholder-shown:top-1/2 peer-placeholder-shown:text-base peer-placeholder-shown:text-gray-500 peer-focus:top-0 peer-focus:pl-0 peer-focus:text-sm peer-focus:text-gray-800">Cintura</label>
                        </div>


                        <div class="relative mt-6">
                            <label for="opciones" class="text-sm text-gray-800 opacity-75">Selecciona una opción</label>
                            <select id="opciones" name="opciones" required="true" 
                                    class="mt-1 w-full border-b-2 border-gray-300 px-0 py-1 focus:border-gray-500 focus:outline-none">
                                <option value="" disabled selected>Nivel de actividad</option>
                                <option value="opcion1">Muy ligera</option>
                                <option value="opcion2">Ligera</option>
                                <option value="opcion3">Moderada</option>
                                <option value="opcion4">Intensa</option>
                                <option value="opcion4">Excepcional</option>
                            </select>
                        </div>


                        <div class="my-6">
                            <button type="submit" value="calcularcalo" name="calorias" class="w-full rounded-md bg-black px-3 py-4 text-white focus:bg-gray-600 focus:outline-none">Calcular</button>
                        </div>
                        <%
                            String calculoEner = (String) request.getSession().getAttribute("calculoEner");

                        %>
                        <p style="color:green">Gasto energetico: <%=calculoEner%> Kcal/día  </p>

                    </form>

                </div>
            </div>
        </div>

        <script src="https://unpkg.com/flowbite@1.4.1/dist/flowbite.js"></script>
    </body>
</html>
