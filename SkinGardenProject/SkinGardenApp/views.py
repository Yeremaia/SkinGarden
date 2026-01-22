from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .models import Productos, Categorias, Carritocompra, Admin, Usuario, Facturas
from datetime import datetime
from django.utils import timezone

# =======================================================
# Inicio de Sesión
def inicio_sesion(request):
    if request.method == "POST":
        usuario = request.POST['usuario']
        contraseña = request.POST['contraseña']

        # Primero, buscar al usuario como un administrador
        try:
            admin_encontrado = Admin.objects.get(user_admin=usuario)
            if str(admin_encontrado.pwd_admin) == contraseña:
                request.session['id_admin'] = admin_encontrado.id_admin
                return redirect('inicio/admin')
            else:
                messages.error(request, "Usuario o contraseña incorrecta.")
                return redirect('inicio_sesion')

        except Admin.DoesNotExist:
            # Si no es un admin, buscamos al usuario normal
            try:
                usuario_encontrado = Usuario.objects.get(user_usuario=usuario)
                if usuario_encontrado.pwd_usuario == contraseña:
                    # Si la autenticación es correcta, se inicia sesión
                    request.session['usuario_id'] = usuario_encontrado.id_usuario
                    return redirect('inicio/usuario')
                else:
                    messages.error(request, "Usuario o contraseña incorrecta.")
                    return redirect('/')

            except Usuario.DoesNotExist:
                messages.error(request, "Usuario no encontrado.")
                return redirect('/')

    return render(request, 'SkinGardenContent/index.html')

# Cerrar sesion
def cerrar_sesion(request):
    logout(request)  # Cierra la sesión del usuario
    return redirect('inicio_sesion')  # Redirige a la página de inicio de sesión

# =======================================================
# Crear Cuenta
def crear_cuenta(request):
    if request.method == 'POST':
        nombre = request.POST.get('nom_usuario')
        apellido = request.POST.get('ape_usuario')
        correo = request.POST.get('correo_usuario')
        telefono = request.POST.get('tel_usuario')
        nombre_usuario = request.POST.get('user_usuario')
        contrasena = request.POST.get('pwd_usuario')
        confirmar_contrasena = request.POST.get('confirmarContraseña')
        direccion = request.POST.get('dir_usuario')

        if contrasena != confirmar_contrasena:
            messages.error(request, "Las contraseñas no coinciden.")
            return redirect('crear_cuenta')

        if Usuario.objects.filter(correo_usuario=correo).exists():
            messages.error(request, "El correo electrónico ya está registrado.")
            return redirect('crear_cuenta')

        Usuario.objects.create(
            nom_usuario=nombre,
            ape_usuario=apellido,
            correo_usuario=correo,
            tel_usuario=telefono,
            user_usuario=nombre_usuario,
            pwd_usuario=contrasena,
            dir_usuario=direccion
        )

        messages.success(request, "Cuenta creada con éxito.")
        return redirect('inicio_sesion')

    return render(request, 'SkinGardenContent/crearCuenta.html')


# =======================================================
# Agregar Producto
def agregar_producto(request):
    if request.method == 'POST':
        # Capturar datos del formulario
        nom_producto = request.POST.get('nom_producto')
        precio = request.POST.get('precio')
        descripcion = request.POST.get('descripcion')
        descuento = request.POST.get('descuento')
        fecha_pub = request.POST.get('fecha_pub')
        id_categoria = request.POST.get('id_categoria')  # Capturar ID de la categoría
        calificacion = request.POST.get('calificacion', 0.00)  # Valor predeterminado
        imagen = request.FILES.get('imagen')  # Capturar archivo de imagen (cambio aquí)

        # Validar que el ID de categoría es válido
        try:
            categoria = Categorias.objects.get(pk=id_categoria)  # Verificar si existe la categoría
        except Categorias.DoesNotExist:
            mensaje = messages.error(request, "La categoría seleccionada no existe.")
            return redirect('agregarProducto/admin', mensaje)  # Redirige al formulario

        # Validar campos obligatorios
        if not nom_producto or not precio or not descripcion or not fecha_pub or not imagen:
            messages.error(request, "Todos los campos son obligatorios.")
            return redirect('agregarProducto/admin')

        # Convertir `fecha_pub` de string a objeto datetime.date
        try:
            fecha_pub_date = datetime.strptime(fecha_pub, '%Y-%m-%d').date()
        except ValueError:
            messages.error(request, "La fecha de publicación no tiene un formato válido (YYYY-MM-DD).")
            return redirect('agregarProducto/admin')

        # Cálculo de `estado` basado en la diferencia de fechas
        fecha_actual = timezone.now().date()  # Obtener la fecha actual
        diferencia = (fecha_actual - fecha_pub_date).days  # Diferencia en días

        estado = 'new' if diferencia <= 30 else 'old'
                
        # Intentar guardar el producto
        try:
            print(f"Estado asignado: {estado}") 
            producto = Productos(
                nom_producto=nom_producto,
                precio=precio,
                descripcion=descripcion,
                descuento=descuento,
                fecha_pub=fecha_pub,
                id_categoria=categoria,  # Usar el objeto de categoría válido
                calificacion=calificacion,
                estado=estado,  # Asignar estado calculado
                imagen=imagen  # Guardar la imagen (cambio aquí)
            )
            producto.save()
            # messages.success(request, "Producto agregado con éxito.")
            return redirect('visualizarProducto/admin')  # Redirigir a la página de visualización
        except Exception as e:
            messages.error(request, f"Error al guardar el producto: {str(e)}")
            return redirect('agregarProducto/admin')

    return render(request, 'SkinGardenContent/admin/agregarProductos.html')


# =======================================================
# Visualizar Productos
def visualizar_productos(request):
    productos = Productos.objects.all()
    return render(request, 'SkinGardenContent/admin/visualizarProductos.html', {'visualizar': productos})


# =======================================================
# Verificar Correo
def verificar_correo(request):
    if request.method == 'POST':
        correo = request.POST.get('correo')

        try:
            usuario = Usuario.objects.get(correo_usuario=correo)
            request.session['correo_usuario'] = correo
            return redirect('verificar_codigo')
        except Usuario.DoesNotExist:
            messages.error(request, "No se encontró un usuario con ese correo electrónico.")
            return redirect('verificar_correo')

    return render(request, 'SkinGardenContent/OlvidoSuContraseña.html')


# =======================================================
# Verificar Código
def verificar_codigo(request):
    if request.method == "POST":
        codigo_recibido = request.POST.get('codigo')
        correo_usuario = request.session.get('correo_usuario')

        if codigo_recibido == "1234":
            messages.success(request, "Código verificado correctamente.")
            return redirect('cambiar_contraseña')
        else:
            messages.error(request, "El código ingresado es incorrecto.")
            return redirect('verificar_codigo')

    return render(request, 'SkinGardenContent/recuperacion.html')


# =======================================================
# Cambiar Contraseña
def cambiar_contraseña(request):
    correo_usuario = request.session.get('correo_usuario')

    if request.method == 'POST':
        nueva_contraseña = request.POST.get('nueva_contraseña')
        confirmar_contraseña = request.POST.get('confirmar_contraseña')

        if nueva_contraseña == confirmar_contraseña:
            usuario = Usuario.objects.get(correo_usuario=correo_usuario)
            usuario.pwd_usuario = nueva_contraseña
            usuario.save()
            messages.success(request, "Contraseña actualizada correctamente.")
            return redirect('inicio_sesion')
        else:
            messages.error(request, "Las contraseñas no coinciden.")

    return render(request, 'SkinGardenContent/cambiarContraseña.html')


# Invitado
# ===========================================================================
def inicioInvitado(request):
    productos = Productos.objects.all().filter(estado="new")
    return render(request, 'SkinGardenContent/invitado/inicioInvitado.html', {'inicio': productos})

def cremaInvitado(request):
    producto = Productos.objects.all().filter(id_categoria=2)
    return render(request, 'SkinGardenContent/invitado/cremaInvitado.html', {'crema':producto})

def hidratacionCuerpoInvitado(request):
    producto = Productos.objects.all().filter(id_categoria=3)
    return render(request, 'SkinGardenContent/invitado/hidratacionCuerpoInvitado.html', {'cuerpo':producto})

def hidratacionRostroInvitado(request):
    producto = Productos.objects.all().filter(id_categoria=4)
    return render(request, 'SkinGardenContent/invitado/hidratacionRostroInvitado.html', {'rostro':producto})

def limpiadoresInvitado(request):
    producto = Productos.objects.all().filter(id_categoria=1)
    return render(request, 'SkinGardenContent/invitado/limpiadoresInvitado.html', {'limpiadores':producto})

def newNovedadesInvitado(request):
    producto = Productos.objects.all().filter(estado="new")
    return render(request, 'SkinGardenContent/invitado/new-novedadesInvitado.html', {'newnovedades':producto})

def novedadesInvitado(request):
    # El [:3] solo muestra 3 productos
    producto = Productos.objects.all().filter(estado="new")[:3]
    return render(request, 'SkinGardenContent/invitado/novedadesInvitado.html', {'novedades':producto})

def productoInvitado(request, producto_id):
    producto = get_object_or_404(Productos, pk=producto_id)
    relacionado = Productos.objects.filter(id_categoria=producto.id_categoria).exclude(id_productos=producto.id_productos)
    return render(request, 'SkinGardenContent/invitado/productoInvitado.html', {'obtener':producto,'relacionando':relacionado})   

# Usuario
# =============================================================================
def inicioUsuario(request):
    productos = Productos.objects.all().filter(estado="new")
    return render(request, 'SkinGardenContent/usuario/inicioUsuario.html', {'inicio': productos})

def cremaUsuario(request):
    # filter sirve para que solo muestre x cosa, en este caso solo mostrara todos los productos que tengan id_categoria 2, objects.all es para obtener todos los datos de la tabla Productos
    producto = Productos.objects.all().filter(id_categoria=2)
    
     # el print es para imprimir en la terminal, esto es para comprobar si realmente hay productos por eso esta comentado
    # print(productos)
     
    # en {'crema':productos} esto es un diccionario, 'crema' es la clave (se puede poner otro nombre, esto se utilizara en el for del html) y productos vendria siendo la variable que almacena los datos de todos los productos de la bd.
    
    return render(request, 'SkinGardenContent/usuario/cremaUsuario.html', {'crema':producto})

def hidratacionCuerpoUsuario(request):
    producto = Productos.objects.all().filter(id_categoria=3)
    return render(request, 'SkinGardenContent/usuario/hidratacionCuerpoUsuario.html', {'cuerpo':producto})


def hidratacionRostroUsuario(request):
    producto = Productos.objects.all().filter(id_categoria=4)
    return render(request, 'SkinGardenContent/usuario/hidratacionRostroUsuario.html', {'rostro':producto})

def limpiadoresUsuario(request):
    producto = Productos.objects.all().filter(id_categoria=1)
    return render(request, 'SkinGardenContent/usuario/limpiadoresUsuario.html', {'limpiadores':producto})

def newNovedadesUsuario(request):
    producto = Productos.objects.all().filter(estado="new")
    return render(request, 'SkinGardenContent/usuario/new-novedades.html', {'newnovedades':producto})

def novedadesUsuario(request):
    # El [:3] solo muestra 3 productos
    producto = Productos.objects.all().filter(estado="new")[:3]
    return render(request, 'SkinGardenContent/usuario/novedadesUsuario.html', {'novedades':producto})

def productoUsuario(request, producto_id):
    # el pk quiere decir primary key (clave primaria)
    producto = get_object_or_404(Productos, pk=producto_id)
    # Esto es para que se visualice los productos relacionados al producto seleccionado (se relaciona a travez de la categoria)
    relacionado = Productos.objects.filter(id_categoria=producto.id_categoria).exclude(id_productos=producto.id_productos)
    return render(request, 'SkinGardenContent/usuario/productoUsuario.html', {'obtener':producto,'relacionando':relacionado})

def encabezado(request):
    categoria = Categorias.objects.all()
    print(categoria)
    if request.user.is_authenticated:
        usuario_id = request.user.id
        
        # Obtener todos los productos en el carrito para este usuario
        productos_carrito = Carritocompra.objects.filter(id_usuario=usuario_id)
        
        # Contar la cantidad de productos en el carrito
        cantidad_productos = productos_carrito.count()
        
        if cantidad_productos <= 0 or cantidad_productos == None:
            cantidad_productos = 0
        
        # Obtener los detalles completos de los productos
        productos = []
        for carrito_producto in productos_carrito:
            producto = carrito_producto.id_producto  # Acceder al producto relacionado con el carrito de compras
            productos.append(producto)  # Agregar el producto entero, no solo el ID

        # Calcular el total del carrito
        total = sum([producto.precio for producto in productos])
        
        return render(request, 'SkinGardenContent/usuario/encabezado.html', {
            'articulos': productos,  # Pasamos la lista de productos completos
            'total': total,
            'cantidad_productos': cantidad_productos
        })
    else:
        return redirect('inicio_sesion')

# Admin
# =====================================================================================
def inicioAdmin(request):
    productos = Productos.objects.all().filter(estado="new")
    return render(request, 'SkinGardenContent/admin/inicioAdmin.html', {'inicio': productos})

def agregarProducto(request):
    return render(request, 'SkinGardenContent/admin/agregarProductos.html')

def cremaAdmin(request):
    producto = Productos.objects.all().filter(id_categoria=2)
    return render(request, 'SkinGardenContent/admin/cremaAdmin.html', {'crema':producto})

def editarProducto(request, producto_id):
    producto = get_object_or_404(Productos, pk=producto_id)
    
    if request.method == 'POST':
        # Actualizar datos del producto con los valores enviados desde el formulario
        producto.nom_producto = request.POST.get('nombreProducto', producto.nom_producto)
        producto.descripcion = request.POST.get('descripcion', producto.descripcion)
        producto.precio = request.POST.get('precio', producto.precio)
        producto.descuento = request.POST.get('descuento', producto.descuento)
        producto.fecha_pub = request.POST.get('fechapub', producto.fecha_pub)
        producto.id_categoria_id = request.POST.get('categorias', producto.id_categoria_id)  # ForeignKey
        
        # Manejo de la imagen
        nueva_imagen = request.FILES.get('imagen')  # Capturar la nueva imagen, si existe
        if nueva_imagen:
            producto.imagen = nueva_imagen  # Actualizar la imagen si se ha subido una nueva
        
        producto.save()  # Guardar los cambios en la base de datos
        return redirect('visualizarProducto/admin')  # Redirigir a la página de visualización
    
    return render(request, 'SkinGardenContent/admin/editarProductos.html', {'producto': producto})

def eliminarProducto(request, producto_id):
    producto = get_object_or_404(Productos, pk=producto_id)
    
    # Eliminar las facturas asociadas al producto
    Facturas.objects.filter(id_producto=producto).delete()
    
    # Elimina el producto de la base de datos
    producto.delete()
    
    return redirect('visualizarProducto/admin')

def hidratacionCuerpoAdmin(request):
    producto = Productos.objects.all().filter(id_categoria=3)
    return render(request, 'SkinGardenContent/admin/hidratacionCuerpoAdmin.html', {'cuerpo':producto})

def hidratacionRostroAdmin(request):
    producto = Productos.objects.all().filter(id_categoria=4)
    return render(request, 'SkinGardenContent/admin/hidratacionRostroAdmin.html', {'rostro':producto})

def limpiadoresAdmin(request):
    producto = Productos.objects.all().filter(id_categoria=1)
    return render(request, 'SkinGardenContent/admin/limpiadoresAdmin.html', {'limpiadores':producto})

def newNovedadesAdmin(request):
    producto = Productos.objects.all().filter(estado="new")
    return render(request, 'SkinGardenContent/admin/new-novedadesAdmin.html', {'newnovedades':producto})

def novedadesAdmin(request):
    producto = Productos.objects.all().filter(estado="new")[:3]
    return render(request, 'SkinGardenContent/admin/novedadesAdmin.html', {'novedades':producto})

def productoAdmin(request, producto_id):
    producto = get_object_or_404(Productos, pk=producto_id)
    relacionado = Productos.objects.filter(id_categoria=producto.id_categoria).exclude(id_productos=producto.id_productos)
    return render(request, 'SkinGardenContent/admin/productoAdmin.html', {'obtener':producto,'relacionando':relacionado}) 

def visualizarProducto(request):
    producto = Productos.objects.all().order_by('id_productos')
    return render(request, 'SkinGardenContent/admin/visualizarProductos.html', {'visualizar':producto})

#  ===================================

def actualizar_cantidad(request, producto_id):
    user_id = request.session.get('usuario_id')
    if user_id and request.method == 'POST':
        cantidad = request.POST.get('cantidad')
        if cantidad:
            # Actualizar la cantidad del producto
            producto = Carritocompra.objects.filter(id_usuario=user_id, id_producto__id_productos=producto_id).first()
            if producto:  # Verificar si el producto existe en el carrito
                producto.cantidad = int(cantidad)
                producto.save()
            else:
                # Si el producto no está en el carrito, manejar el error
                return redirect('carrito')
    return redirect('carrito')


def eliminar_producto(request, producto_id):
    # Asegúrate de que el usuario esté autenticado
    user_id = request.session.get('usuario_id')
    if user_id:
        # Eliminar el producto del carrito
        Carritocompra.objects.filter(id_usuario=user_id, id_producto__id_productos=producto_id).delete()
    return redirect('carrito')  


def carrito_view(request):
    user_id = request.session.get('usuario_id')

    if user_id:
        try:
            usuario = Usuario.objects.get(id_usuario=user_id)
            carrito = Carritocompra.objects.filter(id_usuario=usuario)
            
            productos = []
            cantidad_productos = 0  # Variable para almacenar la cantidad total de productos en el carrito
            
            for item in carrito:
                productos.append({
                    'nombre': item.id_producto.nom_producto,
                    #'imagen': item.id_producto.imagen.url,
                    'precio': item.id_producto.precio,
                    'imagen': item.id_producto.imagen,
                    'cantidad': item.cantidad,
                    'id_producto': item.id_producto.id_productos
                })
                cantidad_productos += item.cantidad  # Sumar la cantidad total de productos
            
            total = sum(item.id_producto.precio * item.cantidad for item in carrito)
            
            return render(request, 'SkinGardenContent/usuario/carrito.html', {'productos': productos, 'total': total, 'cantidad_productos': cantidad_productos})

        except Usuario.DoesNotExist:
            return redirect('inicio_sesion')

    else:
        return redirect('inicio_sesion')
   
   
def agregar_al_carrito(request, producto_id):
    if 'usuario_id' in request.session:  # Verificar si el usuario está autenticado
        usuario_id = request.session['usuario_id']

        if request.method == 'POST':
            cantidad = int(request.POST.get('cantidad', 1))  # Obtener la cantidad, por defecto será 1
            producto = get_object_or_404(Productos, id_productos=producto_id)

            # Intentar obtener el producto en el carrito para ese usuario
            carrito_item = Carritocompra.objects.filter(id_producto=producto, id_usuario_id=usuario_id).first()

            if carrito_item:
                # Si el producto ya existe en el carrito, solo actualizamos la cantidad
                carrito_item.cantidad += cantidad
                carrito_item.save()
                message = "Cantidad del producto actualizada en el carrito."
            else:
                # Si el producto no existe en el carrito, lo creamos con la cantidad proporcionada
                carrito_item = Carritocompra(id_producto=producto, id_usuario_id=usuario_id, cantidad=cantidad)
                carrito_item.save()
                message = "Producto agregado al carrito exitosamente."

            # Retornar un JSON con el mensaje
            messages.success(request, message)
            return redirect(request.META.get('HTTP_REFERER', 'productoUsuario'))  # Recargar la misma página
            
    else:
        messages.error(request, "Debes iniciar sesión para agregar productos al carrito.")
        return redirect('inicio_sesion')


