from django.contrib import admin
from .models import Admin, Carritocompra, Categorias, Facturas, Productos, Usuario

# Register your models here.

admin.site.register(Admin)
admin.site.register(Carritocompra)
admin.site.register(Categorias)
admin.site.register(Facturas)
admin.site.register(Productos)
admin.site.register(Usuario)