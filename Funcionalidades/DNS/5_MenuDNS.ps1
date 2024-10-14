Add-Type @"
public class Funciones
{
    public string Texto(string txt)
    {
        return txt;
    }
}
"@
# Función para crear una instancia y usar el método
function Console.WriteLineSimulado {
    param (
        [string]$Name
    )
    #Creo una instancia en Powershell
    $funciones = New-Object Funciones
    # Llamo al método ipv4 a través de la instancia
    $cadena = $funciones.ipv4($Name)
    return $cadena
}
Console.WriteLineSimulado -Name "Noel"
# Función para crear una instancia y usar el método
function creacionDeZonaDirecta {
    # Crear una instancia de la clase
    $calculadora = New-Object CalculadoraIP
    # Llamar al método ipv4 a través de la instancia
    $cadena = $calculadora.ipv4("Frijoles")
    return $cadena
}
function creacionDeZonaInversa{

}
function verZonasDirectas{

}
function verZonasInversas{

}
function creacionDePunteroDirecto{

}
function creacionDePunteroInverso{

}
function asignacionDeForwardersIPV4{

}
function asignacionDeForwardersIPV6{

}