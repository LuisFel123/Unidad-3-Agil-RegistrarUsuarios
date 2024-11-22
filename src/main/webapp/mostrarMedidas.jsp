<%@page import="java.util.ArrayList"%>
<%@page import="datos.Medida"%>
<%@page import="datos.Medidas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Medidas</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <%
            String usuario1 = (String) request.getSession().getAttribute("usuario");

            Medidas medidasObj = (Medidas) request.getSession().getAttribute("listaM");
            ArrayList<Medida> listaMedidas = null;

            if (medidasObj != null) {
                listaMedidas = medidasObj.getMedidas();
            }
        %>
        <nav class="bg-white border-gray-200 py-2.5 dark:bg-gray-900">
            <div class="flex flex-wrap items-center justify-between max-w-screen-xl px-4 mx-auto">
                <a href="#" class="flex items-center">
                    <i class="fa-solid fa-dumbbell fa-2x h-6 mr-3 sm:h-9"></i>
                    <span class="self-center text-xl font-semibold whitespace-nowrap dark:text-white">Bienvenido <%=usuario1%> </span>
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
        <div class="shadow-lg rounded-lg overflow-hidden mx-4 md:mx-10">
            <table class="w-full table-fixed">
                <thead>
                    <tr class="bg-gray-100">
                        <th class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Usuario</th>
                        <th class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Fecha</th>
                        <th class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Peso</th>
                        <th class="w-1/4 py-4 px-6 text-left text-gray-600 font-bold uppercase">Cintura</th>
                    </tr>
                </thead>
                <tbody class="bg-white">
                    <%
                        if (listaMedidas != null) {
                            for (Medida medida : listaMedidas) {
                                if (medida.getPersona().equals(usuario1)) {
                    %>
                    <tr>
                        <td class="py-4 px-6 border-b border-gray-200"><%= medida.getPersona()%></td>
                        <%
                            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
                            String fechaFormateada = sdf.format(medida.getFecha());
                        %>
                        <td class="py-4 px-6 border-b border-gray-200"><%= fechaFormateada%></td>
                        <td class="py-4 px-6 border-b border-gray-200"><%= medida.getPeso()%></td>
                        <td class="py-4 px-6 border-b border-gray-200"><%= medida.getCintura()%></td>
                    </tr>
                    <%
                            }
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="4" class="py-4 px-6 border-b border-gray-200 text-center">No hay medidas registradas.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </body>
</html>






