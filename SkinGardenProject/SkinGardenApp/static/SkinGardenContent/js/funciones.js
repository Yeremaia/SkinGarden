// querySelector = es lo mismo que getElementBy.. solo que este en los parametros se ponen los selectores iguales al css y es mas conveniente.

// Al darle click al buscador ancha la barra del buscador
function agrandarBuscador(){
    document.querySelector('.busqueda input').style.zIndex = '1';
    document.querySelector('.busqueda input').style.width = '490px';
    document.querySelector('.busqueda input').style.paddingLeft = '20px';
    document.querySelector('.busqueda input').setAttribute('placeholder',"Buscar todo sobre el cuidado de la piel y más");

    // Esto es para que se active lo de escribir en la caja de texto del buscador
    document.getElementById('buscar').focus();
    
    // Esto es una condicion que dice. si el navegador/ventana tiene un ancho menor o igual a 600 haz esto:
    if (window.innerWidth <= 600){
        document.querySelector('.busqueda input').style.display = 'flex';
        document.querySelector('.responsive-busqueda').style.display = 'flex';
        document.querySelector('.responsive-main').style.paddingTop = '150px';
        document.querySelector('.responsive-inicio').style.paddingTop = '500px';
        document.querySelector('.responsive-producto').style.paddingTop = '90px';
        
        // Esto es para que se active lo de escribir en la caja de texto del buscador
        document.getElementById('buscar').focus();
    } else if (window.innerWidth >= 510 && window.innerWidth <= 834){
        document.querySelector('.busqueda input').style.display = 'flex';
        document.querySelector('.responsive-busqueda').style.display = 'flex';
        document.querySelector('.responsive-main').style.paddingTop = '50px';

        // Esto es para que se active lo de escribir en la caja de texto del buscador
        document.getElementById('buscar').focus();
    }
}

// Al darle click al buscador (despues de estar ancho) encoje la barra del buscador 
function encojerBuscador(){
    document.querySelector('.busqueda input').style.width = '200px';
     document.querySelector('.busqueda input').style.paddingLeft = '20px';
     document.querySelector('.busqueda input').setAttribute('placeholder',"Buscar...");

    // Esto es una condicion que dice. si el navegador/ventana tiene un ancho menor o igual a 600 haz esto:
     if (window.innerWidth <= 600) {
        document.querySelector('.busqueda input').style.display = 'none';

        // sirve para refrescar/actualizar la pagina (esto lo puse ya que al agrandar la pagina desaparecia el input)
        window.location.reload();
    } else if (window.innerWidth >= 510 && window.innerWidth <= 834) {
        document.querySelector('.busqueda input').style.display = 'none';

        // sirve para refrescar/actualizar la pagina (esto lo puse ya que al agrandar la pagina desaparecia el input)
        window.location.reload();
    }
}

function procesarBusquedaUsuario(event) {
    event.preventDefault();

    // toLowerCase convierte todas las letras en minusculas y trim elimina los espacios.
    const query = document.getElementById('buscar').value.toLowerCase().trim();

    const urls = {
        cremaAdmin: "cremaUsuario",
        hidratacionCuerpoAdmin: "hidratacionCuerpoUsuario",
        hidratacionRostroAdmin: "hidratacionRostroUsuario",
        limpiadoresAdmin: "limpiadoresUsuario",
        newNovedadesAdmin: "newNovedadesUsuario",
        novedadesAdmin: "novedadesUsuario",
    };

    // Redirecciones
    if (query === 'hidratación rostro' || query === 'rostro' || query === 'hidratacion rostro') {
        window.location.href = urlsUsuario.hidratacionRostroAdmin;
    } else if (query === 'anti-imperfecciones' || query === 'antiimperfecciones' || query === 'anti imperfecciones' || query === 'imperfecciones' || query === 'anti') {
        window.location.href = urlsUsuario.cremaAdmin;
    } else if (query === 'limpiador' || query === 'limpiadores') {
        window.location.href = urlsUsuario.limpiadoresAdmin;
    } else if (query === 'cuerpo' || query === 'hidratación cuerpo' || query === 'hidratacion cuerpo') {
        window.location.href = urlsUsuario.hidratacionCuerpoAdmin;
    } else if (query === 'novedad' || query === 'novedades') {
        window.location.href = urlsUsuario.novedadesAdmin;
    } else if (query === 'new' || query === 'nuevo') {
        window.location.href = urls.newNovedadesAdmin;
    } else {
        mostrarMensajeError('Página no encontrada');
    }
}

// Esto es AutoCompletado del buscador de admin
function procesarBusquedaAdmin(event) {
    event.preventDefault();

    // toLowerCase convierte todas las letras en minusculas y trim elimina los espacios.
    const query = document.getElementById('buscar').value.toLowerCase().trim();

    const urls = {
        cremaAdmin: "cremaAdmin",
        hidratacionCuerpoAdmin: "hidratacionCuerpoAdmin",
        hidratacionRostroAdmin: "hidratacionRostroAdmin",
        limpiadoresAdmin: "limpiadoresAdmin",
        newNovedadesAdmin: "newNovedadesAdmin",
        novedadesAdmin: "novedadesAdmin",
    };

    // Redirecciones
    if (query === 'hidratación rostro' || query === 'rostro' || query === 'hidratacion rostro') {
        window.location.href = urls.hidratacionRostroAdmin;
    } else if (query === 'anti-imperfecciones' || query === 'antiimperfecciones' || query === 'anti imperfecciones' || query === 'imperfecciones' || query === 'anti') {
        window.location.href = urls.cremaAdmin;
    } else if (query === 'limpiador' || query === 'limpiadores') {
        window.location.href = urls.limpiadoresAdmin;
    } else if (query === 'cuerpo' || query === 'hidratación cuerpo' || query === 'hidratacion cuerpo') {
        window.location.href = urls.hidratacionCuerpoAdmin;
    } else if (query === 'novedad' || query === 'novedades') {
        window.location.href = urls.novedadesAdmin;
    } else if (query === 'new' || query === 'nuevo') {
        window.location.href = urls.newNovedadesAdmin;
    } else {
        mostrarMensajeError('Página no encontrada');
    }
}

// Esto es AutoCompletado del buscador de invitado
function procesarBusquedaInvitado(event) {
    event.preventDefault();

    // toLowerCase convierte todas las letras en minusculas y trim elimina los espacios.
    const query = document.getElementById('buscar').value.toLowerCase().trim();

    const urls = {
        cremaAdmin: "cremaInvitado",
        hidratacionCuerpoAdmin: "hidratacionCuerpoInvitado",
        hidratacionRostroAdmin: "hidratacionRostroInvitado",
        limpiadoresAdmin: "limpiadoresInvitado",
        newNovedadesAdmin: "newNovedadesInvitado",
        novedadesAdmin: "novedadesInvitado",
    };

    if (query === 'hidratación rostro' || query === 'rostro' || query === 'hidratacion rostro') {
        window.location.href = urls.hidratacionRostroAdmin;
    } else if (query === 'anti-imperfecciones' || query === 'antiimperfecciones' || query === 'anti imperfecciones' || query === 'imperfecciones' || query === 'anti') {
        window.location.href = urls.cremaAdmin;
    } else if (query === 'limpiador' || query === 'limpiadores') {
        window.location.href = urls.limpiadoresAdmin;
    } else if (query === 'cuerpo' || query === 'hidratación cuerpo' || query === 'hidratacion cuerpo') {
        window.location.href = urls.hidratacionCuerpoAdmin;
    } else if (query === 'novedad' || query === 'novedades') {
        window.location.href = urls.novedadesAdmin;
    } else if (query === 'new' || query === 'nuevo') {
        window.location.href = urls.newNovedadesAdmin;
    } else {
        mostrarMensajeError('Página no encontrada');
    }
}

// Muestra un mensaje
function mostrarMensajeError(mensaje) {
    const mensajeError = document.createElement('div');
    mensajeError.id = 'mensaje-error';
    mensajeError.innerText = mensaje;
    document.body.appendChild(mensajeError);

    // Mostrar el mensaje por 3 segundos
    mensajeError.style.display = 'block';
    setTimeout(() => {
        mensajeError.style.display = 'none';
        mensajeError.remove(); // Eliminar el elemento después de ocultarlo
    }, 3000);
}

// Al darle click a la imagen del menu (cuando esta abierto) para que se cierre el menu y oculte el contenido
function cerrarMenuAbierto(){
    document.querySelector('.menu-abierto').style.display = "none";
}

// Al darle click a la imagen del menu (cuando esta cerrado) para que se abra el menu y se pueda visualizar su contenido
function abrirMenu(){
    document.querySelector('.menu-abierto').style.display = "flex";
}

// Al darle click a comprar ahora (en la pagina productos) o comprar (del carrito de compras) mostrara el contenido de metodo de pago
function metodoPago(){
    document.querySelector(".metodo-pago-abierto").style.display = "flex";
    document.querySelector(".metodo-pago-abierto").style.position = "fixed";
}

// Al darle click a la imagen del menu de desarrollador (El martillo) se abrira
function abrirMenuDesarrollador() {
    document.querySelector('.menu-desarrollador-abierto').style.display = 'flex';
    document.querySelector('.informacion-superior-producto').style.zIndex ='0';
}

// Al darle click a la X o en el main, se cerrara el menu de desarrollador (El martillo)
function cerrarMenuDesarrollador() {
    document.querySelector('.menu-desarrollador-abierto').style.display = 'none';
}

// Al darle click a la imagen (el carrito) o costo del carrito de compras se abrira
function abrirCarritoCompra() {
    document.querySelector('.carrito-abierto').style.display = 'flex';
    document.querySelector('.informacion-superior-producto').style.zIndex ='0';
}

// Al darle click "fuera" del elemento se cerrara
function cerrarCarritoCompra() {
    document.querySelector('.carrito-abierto').style.display = 'none';
}


// Esto es para que salga una ventana (igual al alert) donde decidiras si confirmar o cancelar la accion
function eliminarProducto(productoId) {
    var eliminar = confirm("¿Desea eliminar este producto?");
    
    // En caso de que le dé a confirmar, hacemos la solicitud para eliminar el producto
    if (eliminar == true) {
        // Realizamos la solicitud para eliminar el producto
        fetch(`/eliminar_producto/${productoId}/`, {
            method: 'GET',  // O POST si prefieres, dependiendo de la vista
        })
        .then(response => {
            if (response.ok) {
                alert("Se ha eliminado correctamente");
                window.location.href = "/visualizarProducto/";
            } else {
                alert("Hubo un error al eliminar el producto.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Hubo un error al eliminar el producto.');
        });
    }
}

// Funcion para que se vaya incrementando la casilla de cantidad
function Añadir() {
    var input = document.getElementById('count');
    var value = parseInt(input.value);
    input.value = value + 1;
}

// Funcion para que se vaya incrementando la casilla de cantidad
function AñadirCantidad2() {
    var input = document.getElementById('count2');
    var value = parseInt(input.value);
    input.value = value + 1;
}

// Funcion para que se vaya decrementando la casilla de cantidad
function EliminarCantidad2() {
    var input = document.getElementById('count2');
    var value = parseInt(input.value);
    if (value > 1) {
        input.value = value - 1;
    }
}

// Funcion para que se vaya incrementando la casilla de cantidad
function AñadirCantidad1() {
    var input = document.getElementById('count1');
    var value = parseInt(input.value);
    input.value = value + 1;
}

// Funcion para que se vaya decrementando la casilla de cantidad
function EliminarCantidad1() {
    var input = document.getElementById('count1');
    var value = parseInt(input.value);
    if (value > 1) {
        input.value = value - 1;
    }
}

// Funcion para que se vaya decrementando la casilla de cantidad
function Eliminar() {
    var input = document.getElementById('count');
    var value = parseInt(input.value);
    if (value > 1) {
        input.value = value - 1;
    }
}

function agregarAlCarrito() {
    // Crear el elemento de notificación
    const notification = document.createElement('div');
    notification.classList.add('notification');
    notification.innerText = 'Se agregó al carrito';

    // Añadir la notificación al cuerpo del documento
    document.body.appendChild(notification);

    // Mostrar la notificación
    setTimeout(() => {
        notification.classList.add('show');
        document.querySelector('.derecha-header figure figcaption').style.color = 'green';
        document.querySelector('header').style.boxShadow = '2px 5px 3px #15ad075e';
        document.querySelector('.cantidad-carrito-compras, .cantidad-carrito-compras-admin').style.border = '2px solid green';
    }, 10);

    // Ocultar la notificación después de 3 segundos
    setTimeout(() => {
        notification.classList.remove('show');
        setTimeout(() => {
            document.body.removeChild(notification);
            document.querySelector('.derecha-header figure figcaption').style.color = 'black';
            document.querySelector('header').style.boxShadow = '2px 5px 3px #dedede';
            document.querySelector('.cantidad-carrito-compras, .cantidad-carrito-compras-admin').style.border = '2px solid rgb(255, 3, 3)';
        }, 500);
    }, 1000);
}


// Funcion Boton deslizar inicio de productos
function desplazarIzquierda() {
    var productosContainers = document.getElementsByClassName('productos-inicio');
    for (var i = 0; i < productosContainers.length; i++) {
        var container = productosContainers[i];
        container.scrollTo({
            left: container.scrollLeft - 320, 
            behavior: 'smooth'
            // behavior: 'smooth' es para desplazar(scroll) de forma suave y no frisado
        });
        if(window.innerWidth <= 509){
            container.scrollTo({
                left: container.scrollLeft - 200, 
                behavior: 'smooth'
                // behavior: 'smooth' es para desplazar(scroll) de forma suave y no frisado
             });
        }
    }
}

function desplazarDerecha() {
    var productosContainers = document.getElementsByClassName('productos-inicio');
    for (var i = 0; i < productosContainers.length; i++) {
        var container = productosContainers[i];
        container.scrollTo({
            left: container.scrollLeft + 320, // Ajusta el valor según sea necesario
            behavior: 'smooth'
        });
        if(window.innerWidth <= 509){
            container.scrollTo({
                left: container.scrollLeft + 200, // Ajusta el valor según sea necesario
                behavior: 'smooth'
             });
        }
    }
}

// Boton de mover el contenido de productos
function Derecha() {
    var container = document.getElementById('filas-Producto');
     // El scrollTo() es para indicarle al navegador que queremos desplazamiento suave acompanado de behavior: 'smooth' 
    container.scrollTo({
        // El scrollLeft(), establece el número de píxeles que desplaza el contenido de un elemento hacia la izquierda.
        left: container.scrollLeft + 310, behavior: 'smooth'
    });
}

function Izquierda() {
    var container = document.getElementById('filas-Producto');
    // El scrollTo() es para indicarle al navegador que queremos desplazamiento suave acompanado de behavior: 'smooth' 
    container.scrollTo({
         // El scrollLeft(), establece el número de píxeles que desplaza el contenido de un elemento hacia la izquierda.
        left: container.scrollLeft - 310, behavior: 'smooth' 
    })
}

// Funcion para que regrese (es como darle a la flechas que estan en la parte superior izquierdo)
function regresarAtras() {
    // Aqui indica que regrese 1 vez hacia atras
    history.back('-1');
}

// Mostrar y Ocultar Descripcion del producto 

function descripcion() {
    const descriptionContent = document.querySelector('.description');
    const botonDescripcion = document.querySelector(".boton-descripcion");
    const botonDescripcion2 = document.querySelector(".boton-descripcion2");
  
    if (descriptionContent.style.display="none") {
      descriptionContent.style.display="flex"
      botonDescripcion.style.display="none"
      botonDescripcion2.style.display="inline"
    } 
}
  
  
function Ocultardescripcion() {
    const descriptionContent = document.querySelector('.description');
    const botonDescripcion = document.querySelector(".boton-descripcion");
    const botonDescripcion2 = document.querySelector(".boton-descripcion2");
    if (descriptionContent.style.display="inline") {
       descriptionContent.style.display="none"
      botonDescripcion.style.display="inline"
      botonDescripcion2.style.display="none"
    } 
}

function Aviso() {
    var preguntaIniciarSesion = confirm("Para realizar esta acción necesita iniciar sesión. ¿Desea iniciar sesión?");
    if (preguntaIniciarSesion == true) {
        var inicio = {
            redirigir: "/"
        };
        window.location.href = inicio.redirigir;
    }
}


// clasificacion

// La funcion de esto es que al elegir la estrella se visualizara en producto dependiendo el porcentaje. osea si le damos a 3 estrellas y luego a 1. sacara un porcentaje entre esos dos.
const stars = document.querySelectorAll('.star');
const averageRatingDisplay = document.getElementById('average-rating');
let ratings = [];

function Rating() {
    const totalRating = ratings.reduce((a, b) => a + b, 0);
    const averageRating = (totalRating / ratings.length).toFixed(1);
    const fullStars = Math.floor(averageRating);
    const halfStar = averageRating % 1 !== 0;

    averageRatingDisplay.innerHTML = '';

    for (let i = 0; i < 5; i++) {
        if (i < fullStars) {
            averageRatingDisplay.innerHTML += '&#9733;'; // Estrella llena
        } else if (i === fullStars && halfStar) {
            averageRatingDisplay.innerHTML += '&#9734;'; 
        } else {
            averageRatingDisplay.innerHTML += '&#9734;'; // Estrella vacía
        }
    }
}

stars.forEach(star => {
    star.addEventListener('click', () => {
        const ratingValue = star.getAttribute('data-value');
        stars.forEach(s => s.classList.remove('selected'));
        for (let i = 0; i < ratingValue; i++) {
            stars[i].classList.add('selected');
        }
        ratings.push(parseInt(ratingValue));
        Rating();
    });
});

// Boton de clasificar
var clasificacion = document.querySelector('.rating-container');
function clasificar() {
    
    if (clasificacion.style.display="none") {
        clasificacion.style.display="flex"
    }
}

function FinalizarCalificacion() {
    if (clasificacion.style.display="flex") {
        clasificacion.style.display="none"
    }
}

// Al darle click a la flecha se cerrara
function cerrarMetodoPago(){
    document.querySelector(".metodo-pago-abierto").style.display = "none";
}

function pagoEfectivo() {
    // Caja del pago en efectivo
    document.querySelector(".cojunto-pago-efectivo").style.background = 'linear-gradient(to right, #65c77c, #39a839)';
    document.querySelector(".cojunto-pago-efectivo").style.border = '2px solid #00630098';
    document.getElementById('efectivo').style.border = '2px solid #004b00';
    
    // Caja del pago en tarjeta
    document.querySelector('.conjunto-pago-tarjeta').style.background = 'white';
    document.querySelector('.conjunto-pago-tarjeta').style.border = '2px solid rgba(206, 206, 206, 0.5)';
    document.getElementById('mastercard').style.border = '2px solid rgb(117, 117, 117)';

    // Contenido a mostrar y ocultar
    document.querySelector(".conjunto-formulario-pago").style.display = 'none';
    document.querySelector(".conjunto-formulario-pago-efectivo").style.display = 'flex';
}

function pagoTarjeta() {
    // Caja del pago en tarjeta
    document.querySelector(".conjunto-pago-tarjeta").style.background = 'linear-gradient(to right, #65c77c, #39a839)';
    document.querySelector(".conjunto-pago-tarjeta").style.border = '2px solid #00630098';
    document.getElementById('mastercard').style.border = '2px solid #004b00';
    
    // Caja del pago en efectivo
    document.querySelector('.cojunto-pago-efectivo').style.background = 'white';
    document.querySelector('.cojunto-pago-efectivo').style.border = '2px solid rgba(206, 206, 206, 0.5)';
    document.getElementById('efectivo').style.border = '2px solid rgb(117, 117, 117)';

    // Contenido a mostrar y ocultar
    document.querySelector(".conjunto-formulario-pago").style.display = 'flex';
    document.querySelector(".conjunto-formulario-pago-efectivo").style.display = 'none';
}

// Esto es al darle comprar saldra una ventana de confirmacion 
function comprobarCompra() {
    // Crear constantes para la comprobacion
    const emailtarjeta = document.getElementById("email-tarjeta").value;
    const pais = document.getElementById("pais").value;
    const titulartarjeta = document.getElementById("titular-tarjeta").value;
    const numerotarjeta = document.getElementById("numero-tarjeta").value;
    const mestarjeta = document.getElementById("mes-tarjeta").value;
    const codigotarjeta = document.getElementById("codigo-tarjeta").value;

    // Condicion para ver si estan vacios
    if (emailtarjeta == "" || pais == "" || titulartarjeta == "" || numerotarjeta == "" || mestarjeta == "" || codigotarjeta == "") {
        // Esto esta asi porque saldra el icono de aviso por el required
    } else {
        var comprobar = confirm("¿Desea comprar estos articulos?");

        // al darle a aceptar saldra esto, se lo contrario no mostrara nada
        if (comprobar === true){
            alert('Se ha comprado correctamente');
            document.querySelector(".metodo-pago-abierto").style.display = "none";
        }
    }
}

function comprobarMonto() {
     // Crear constantes para la comprobacion
    const monto = document.getElementById("monto-pago").value;
    const titular = document.getElementById("nombre-pago-efectivo").value;

    // Condicion para ver si estan vacios
    if (monto == "" || titular == "") {
        // Esto esta asi porque saldra el icono de aviso por el required
    } else {
        var comprobar = confirm("¿Seguro que desea realizar esta acción?");

        // al darle a aceptar saldra esto, se lo contrario no mostrara nada
        if (comprobar === true){
            alert('La acción se ha realizado correctamente');
            document.querySelector(".metodo-pago-abierto").style.display = "none";
        }
    }
}


/* ============================================================*/
/* ===================  INICIAR SESION ========================*/
/* ============================================================*/
// Ocultar o mostrar contraseña
function Mostrar() {
    const clave = document.getElementById("contraseña");
    if (clave.type == 'password') {
        clave.type = 'text'
    } else {
        clave.type = 'password'
    }
}

function Mostrar_cambiarContraseña() {
    const clave2 = document.getElementById("nueva_contraseña");
    if (clave2.type == 'password') {
        clave2.type = 'text'
    } else {
        clave2.type = 'password'
    }
}
