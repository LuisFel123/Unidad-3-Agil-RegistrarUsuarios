/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function mostrarAlerta() {
    const alerta = document.getElementById('alertaMensaje');
    alerta.classList.remove('hidden');

    setTimeout(() => {
        alerta.classList.add('hidden');
    }, 2000); // 5000 ms = 5 segundos
}


function ocultarAlerta() {
    document.getElementById('alertaMensaje').classList.add('hidden');
}
