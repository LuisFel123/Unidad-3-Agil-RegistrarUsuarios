<%-- 
    Document   : home
    Created on : 9 nov 2024, 16:37:27
    Author     : felip
--%>

<%@page import="datos.Medidas"%>
<%@page import="datos.Medida"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

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
                // Verificar y convertir estatura, peso, cintura y cadera
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
        <div class="container relative flex flex-col justify-between h-full max-w-6xl px-10 mx-auto xl:px-0 mt-5">
            <div class="w-full">
                <div class="flex flex-col w-full mb-10 sm:flex-row">
                    <div class="w-full mb-10 sm:mb-0 sm:w-1/2">
                        <div class="relative h-full ml-0 mr-0 sm:mr-10">
                            <span class="absolute top-0 left-0 w-full h-full mt-1 ml-1 bg-indigo-500 rounded-lg"></span>
                            <div class="relative h-full p-5 bg-white border-2 border-indigo-500 rounded-lg">
                                <div class="flex items-center -mt-1">
                                    <h3 class="my-2 ml-3 text-lg font-bold text-gray-800">Informacion de <%=usuario%></h3>
                                </div>
                                <p class="mb-2 text-gray-600">Edad: <%=edad%></p>
                                <p class="mb-2 text-gray-600">Estatura: <%=estatura%></p>
                                <p class="mb-2 text-gray-600">Cadera: <%=cadera%></p>
                                <p class="mb-2 text-gray-600">Sexo: <%=sexo%></p>


                            </div>
                        </div>
                    </div>
                    <div class="w-full sm:w-1/2">
                        <div class="relative h-full ml-0 md:mr-10">
                            <span class="absolute top-0 left-0 w-full h-full mt-1 ml-1 bg-purple-500 rounded-lg"></span>
                            <div class="relative h-full p-5 bg-white border-2 border-purple-500 rounded-lg">
                                <div class="flex items-center -mt-1">
                                    <h3 class="my-2 ml-3 text-lg font-bold text-gray-800">Adicional</h3>
                                </div>
                                <%
                                    double pesoD = 0.0;
                                    int cinturaE = 0;
                                    try {
                                        if (peso != null && cintura != null) {
                                            pesoD = Double.parseDouble(peso);
                                            cinturaE = Integer.parseInt(cintura);
                                        }

                                    } catch (Exception ex) {
                                        System.err.print("Error 1");
                                    }
                                %>
                                <%
                                    try {

                                %>    
                                <p class="mb-2 text-gray-600" >Peso: <%= ((pesoD > 39.0) && (pesoD < 151.0)) ? peso : 0%></p>
                                <p class="mb-2 text-gray-600">Cintura: <%=((cinturaE > 50) && (cinturaE < 101)) ? cintura : 0%></p>
                                <%
                                    } catch (Exception ex) {
                                        System.err.println("Eroor 2");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://unpkg.com/flowbite@1.4.1/dist/flowbite.js"></script>
    </body>
</html>
