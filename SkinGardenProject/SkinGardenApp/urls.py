
from django.urls import path
from SkinGardenApp import views
from django.conf import settings
from django.conf.urls.static import static

# from django.contrib import admin
from . import views

urlpatterns = [
    # Apartado de administrador de django
    # path('administrador/', admin.site.urls),
    
    # Cerrar Sesión
    path('cerrar_sesion/', views.cerrar_sesion, name='cerrar_sesion'),
    
    # Inicio de Sesión
    path('', views.inicio_sesion, name='inicio_sesion'),  
    path('crear-cuenta/', views.crear_cuenta, name='crear_cuenta'),
    path('cambiar-contraseña/', views.cambiar_contraseña, name='cambiar_contraseña'),
    path('verificar_correo/', views.verificar_correo, name='verificar_correo'),
    path('verificar_codigo/', views.verificar_codigo, name='verificar_codigo'),
    
    # Invitado
    path('inicioInvitado', views.inicioInvitado, name='inicio/invitado'),
    path('cremaInvitado', views.cremaInvitado, name='crema/invitado'),
    path('hidratacionCuerpoInvitado', views.hidratacionCuerpoInvitado, name='hidratacionCuerpo/invitado'),
    path('hidratacionRostroInvitado', views.hidratacionRostroInvitado, name='hidratacionRostro/invitado'),
    path('newNovedadesInvitado', views.newNovedadesInvitado, name='newNovedades/invitado'),
    path('novedadesInvitado', views.novedadesInvitado, name='novedades/invitado'),
    path('productoInvitado/<int:producto_id>/', views.productoInvitado, name='producto/invitado'),
    path('limpiadoresInvitado', views.limpiadoresInvitado, name='limpiadores/invitado'),
    
    # Usuario
    path('inicioUsuario', views.inicioUsuario, name='inicio/usuario'),
    path('cremaUsuario', views.cremaUsuario, name='crema/usuario'),
    path('hidratacionCuerpoUsuario', views.hidratacionCuerpoUsuario, name='hidratacionCuerpo/usuario'),
    path('hidratacionRostroUsuario', views.hidratacionRostroUsuario, name='hidratacionRostro/usuario'),
    path('limpiadoresUsuario', views.limpiadoresUsuario, name='limpiadores/usuario'),
    path('newNovedadesUsuario', views.newNovedadesUsuario, name='newNovedades/usuario'),
    path('novedadesUsuario', views.novedadesUsuario, name='novedades/usuario'),
    path('productoUsuario/<int:producto_id>/', views.productoUsuario, name='producto/usuario'),
    
    # Admin
    path('inicioAdmin', views.inicioAdmin, name='inicio/admin'),
    path('agregarProducto/', views.agregar_producto, name='agregarProducto/admin'),
    path('cremaAdmin', views.cremaAdmin, name='cremaAdmin/admin'),
    path('editarProducto/<int:producto_id>/', views.editarProducto, name='editarProducto/admin'),
    path('hidratacionCuerpoAdmin', views.hidratacionCuerpoAdmin, name='hidratacionCuerpoAdmin/admin'),
    path('hidratacionRostroAdmin', views.hidratacionRostroAdmin, name='hidratacionRostroAdmin/admin'),
    path('limpiadoresAdmin', views.limpiadoresAdmin, name='limpiadoresAdmin/admin'),
    path('newNovedadesAdmin', views.newNovedadesAdmin, name='newNovedadesAdmin/admin'),
    path('novedadesAdmin', views.novedadesAdmin, name='novedadesAdmin/admin'),
    path('productoAdmin/<int:producto_id>/', views.productoAdmin, name='productoAdmin/admin'),
    path('visualizarProducto/', views.visualizar_productos, name='visualizarProducto/admin'),
    path('eliminarProducto/<int:producto_id>/', views.eliminarProducto, name='eliminarProducto'),
    
    path('carrito/', views.carrito_view, name='carrito'),
    path('agregar_al_carrito/<int:producto_id>/', views.agregar_al_carrito, name='agregar_al_carrito'),
    path('eliminar_producto/<int:producto_id>/', views.eliminar_producto, name='eliminar_producto'),
    path('actualizar_cantidad/<int:producto_id>/', views.actualizar_cantidad, name='actualizar_cantidad'),
    
]

# Añadir URL para servir archivos multimedia en desarrollo
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)