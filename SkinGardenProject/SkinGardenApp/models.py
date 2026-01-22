from django.db import models
from django.utils import timezone
from datetime import timedelta

# Create your models here.
class Admin(models.Model):
    id_admin = models.AutoField(primary_key=True)
    nom_admin = models.CharField(max_length=20)
    ape_admin = models.CharField(max_length=40)
    dir_admin = models.CharField(max_length=60)
    correo_admin = models.CharField(max_length=30)
    tel_admin = models.IntegerField()
    user_admin = models.CharField(max_length=30)
    pwd_admin = models.CharField(max_length=30)
    
    def __str__(self):
        return self.id_admin, self.nom_admin, self.ape_admin, self.dir_admin, self.correo_admin, self.tel_admin, self.user_admin, self.pwd_admin

    class Meta:
        managed = False
        db_table = 'admin'


class Categorias(models.Model):
    id_categoria = models.AutoField(primary_key=True)
    nom_categoria = models.CharField(max_length=20)
    
    def __str__(self):
        return f"id de categoria: {self.id_categoria}\nNombre de categoria: {self.nom_categoria}"

    class Meta:
        managed = False
        db_table = 'categorias'


class Facturas(models.Model):
    id_factura = models.AutoField(primary_key=True)
    id_producto = models.ForeignKey('Productos', models.DO_NOTHING, db_column='id_producto')
    id_usuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='id_usuario')
    fecha = models.DateTimeField()
    
    def __str__(self):
        return self.id_factura

    class Meta:
        managed = False
        db_table = 'facturas'


class Productos(models.Model):
    id_productos = models.AutoField(primary_key=True)
    nom_producto = models.CharField(max_length=200)
    descripcion = models.CharField(max_length=400)
    precio = models.FloatField()
    # id_categoria = models.ForeignKey(Categorias, models.DO_NOTHING, db_column='id_categoria')
    id_categoria = models.ForeignKey(Categorias, on_delete=models.CASCADE, db_column='id_categoria')
    calificacion = models.CharField(max_length=6)
    estado = models.CharField(max_length=6)
    descuento = models.IntegerField()
    fecha_pub = models.DateField()
    imagen = models.ImageField(upload_to='productos_imagenes/', blank=True, null=True)  # Campo para almacenar la ruta de la imagen
    
    @property
    def ofertas(self):
        return self.descuento > 0
    
    # El property convierte un def en un atributo de lectura (en string). te permite acceder a otro atributo de la clase sin tener que hacer otra funcion.
    @property
    def totalDescuento(self):
        # Este calculo es para sacar el descuento ya calculado
        return self.precio - self.descuento
    
    # Esto es para calcular si fecha_pub ya paso de un mes, entonces estado se convierte en old, de lo contrario se convierte en new
    @property
    def estadoCalculando(self):
        # timezone.now() obtiene la fecha y hora actual
        fecha = timezone.now().date()
        # Calculamos la diferencia de dias entre la fecha actual y la fecha de publicacion
        diferencia = fecha - self.fecha_pub  # Resta la fecha de publicacion con la fecha actual

        # Verificamos si la diferencia es menor o igual a 30 dias
        if diferencia <= timedelta(days=30):
            return 'new'
        else:
            return 'old'
    
    # Esto es para que se pueda mostrar la clave y valor correctamente. para que no salga por ejemplo <Productos: Productos object (9)>
    def __str__(self):
        
        # Esto es para obtener los datos de categoria. Y la condicion es que si no hay categoria no lo deje vacio/null ya que da error.
        categoria = self.id_categoria.nom_categoria if self.id_categoria else "Sin categoría"
        
        # Esto devuelve una cadena (String), ya que al no ponerlo como cadena el __str__ devolvera una tupla (ejemplo: return self.nombre, self.precio), al ser una tupla da error.
        return f"{self.nom_producto} - ${self.precio}\nDescripción: {self.descripcion[:50]}...\nCategoría: {categoria}\nCalificación: {self.calificacion}\nEstado: {self.estadoCalculando}\nDescuento: {self.descuento}%\nFecha de publicación: {self.fecha_pub}, {self.ofertas}"
    
    class Meta:
        managed = False
        db_table = 'productos'


class Usuario(models.Model):
    id_usuario = models.AutoField(primary_key=True)
    nom_usuario = models.CharField(max_length=20)
    ape_usuario = models.CharField(max_length=40)
    dir_usuario = models.CharField(max_length=60)
    correo_usuario = models.CharField(max_length=20)
    tel_usuario = models.IntegerField()
    user_usuario = models.CharField(max_length=21)
    pwd_usuario = models.CharField(max_length=21)
    
    def __str__(self):
        return self.id_usuario, self.nom_usuario, self.ape_usuario, self.dir_usuario, self.correo_usuario, self.tel_usuario, self.user_usuario, self.pwd_usuario

    class Meta:
        managed = False
        db_table = 'usuario'
        
    
class Carritocompra(models.Model):
    id_carritocompras = models.AutoField(db_column='id_carritoCompras', primary_key=True)  # Field name made lowercase.
    id_producto = models.ForeignKey('Productos', on_delete=models.CASCADE, db_column='id_producto')
    id_usuario = models.ForeignKey('Usuario', on_delete=models.CASCADE, db_column='id_usuario')
    cantidad = models.IntegerField()
    
    
    def __str__(self):
        return f"{self.id_carritocompras}, {self.id_producto}, {self.id_usuario}"

    class Meta:
        managed = False
        db_table = 'carritocompra'