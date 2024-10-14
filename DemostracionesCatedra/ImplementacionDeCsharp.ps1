# Practicamente hace un using a nivel de Sesion de Powershell
Add-Type -AssemblyName System.Windows.Forms #Nombre del Ensamblado .dll 
                                            #De la libreria .NET

# Por si quiero Crear mis propias funciones en c# se crea en la carpeta TEMP
# Lo recomendable es Compilar el codigo de una Biblioteca de Clases o Clase de .NET
# y Importar el dll con el Add-Type pero por fines mas vistosos se hara de esta manera
Add-Type @"
public class Funciones
{
    public string Texto(string txt)
    {
        return txt;
    }
}
"@

# Funcion para mostrar un mensaje
function Mostrar-MessageBox {
    param (
        [string]$mensaje
    )
    #Parametros que recibo (Contenido del Mensaje)
    #Esto solamente funciona gracias a la Importacion del DLL (Archivo compilado) (Linea 2)
    [System.Windows.Forms.MessageBox]::Show($mensaje)
}

# Funcion para crear una instancia y usar el método
function WriteLine {
    param (
        [string]$Name
    )#Funcion con parametros de PS
    
    # Creo una instancia de la clase
    $funciones = New-Object Funciones
    # Llamo al metodo Texto a través de la instancia
    $cadena = $funciones.Texto($Name)
    
    # Mostrar el mensaje usando la clase de C# De la Biblioteca Forms,
    #Equivalente a JAVA SWING (Cafe columpio)
    Mostrar-MessageBox $cadena

    #Cuando se retorna un String por medio de un Metodo 
    return $cadena
}

# Llamar a la funcion
$resultado = WriteLine -Name "Noel"
Write-Output $resultado  # Debería mostrar "Noel"
