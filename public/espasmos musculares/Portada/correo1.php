<?php 	
    use PHPMailer\PHPMailer\PHPMailer;
    require "vendor/autoload.php";
    function correo($direccionD, $direccionO, $asunto, $cuerpo){
        $mail = new PHPMailer();
        $mail->IsSMTP();
        // cambiar a 0 para no ver mensajes de error
        $mail->SMTPDebug  = 0; 							
        $mail->SMTPAuth   = true;
        //$mail->SMTPSecure = "tls";                 
        $mail->Host       = "smtp.mailtrap.io";    
        $mail->Port       = 2525;                 
        // introducir usuario de google
        $mail->Username   = "1d416383922a72"; 
        // introducir clave
        $mail->Password   = "9f46f6c3bc5de4";   	
        $mail->SetFrom($direccionD, 'Test');
        // asunto
        $mail->Subject    = $asunto;
        // cuerpo
        $mail->MsgHTML($cuerpo);
        // adjuntos
        //$mail->addAttachment("empleado.xsd");
        // destinatario
        $address = $direccionO;
        $mail->AddAddress($address, "Test");
        // enviar
        $resul = $mail->Send();
        if(!$resul) {
        echo "Error" . $mail->ErrorInfo;
        } else {
        echo "Enviado";
        }
    }
    function correo1($direccionD1,$direccionD,$direccionO){
        $mail = new PHPMailer();
        $mail->IsSMTP();
        // cambiar a 0 para no ver mensajes de error
        $mail->SMTPDebug  = 0; 							
        $mail->SMTPAuth   = true;
        //$mail->SMTPSecure = "tls";                 
        $mail->Host       = "smtp.mailtrap.io";    
        $mail->Port       = 2525;                 
        // introducir usuario de google
        $mail->Username   = "1d416383922a72"; 
        // introducir clave
        $mail->Password   = "9f46f6c3bc5de4";   	
        $mail->SetFrom($direccionD, 'Test');
        // asunto
        $mail->Subject    = "Nuevo usuario";
        // cuerpo
        $mail->MsgHTML($direccionO . " se ha registrado.");
        // adjuntos
        //$mail->addAttachment("empleado.xsd");
        // destinatario
        $address = $direccionD1;
        $mail->AddAddress($address, "Test");
        // enviar
        $resul = $mail->Send();
        if(!$resul) {
        echo "Error" . $mail->ErrorInfo;
        } else {
        echo "Enviado";
        }
    }
    function rol(){
        try {
			$cadena_conexion = 'mysql:dbname=empresa;host=127.0.0.1';
			$usuario = 'root';
			$clave = '';
			$nombre = $_POST['usuario'];
			$bd = new PDO($cadena_conexion, $usuario, "");
			$roles = $bd->query("select rol from usuarios where nombre = '$nombre';");
			foreach ($roles  as $usu) {
                return $usu['rol'];
            }
		} catch (PDOException $e) {
			echo 'Error con la base de datos: ' . $e->getMessage();
        }
    }
    $direccionD1 = "propietario@gmail.com";
    $direccionD = "paginaweb@gmail.com";
    $direccionO = $_POST["mail"];
    $asunto = "Correo con tu rol";
    $cuerpo = "Tu rol es: " . rol();
    correo($direccionD, $direccionO, $asunto, $cuerpo);
    echo "<br>";
    correo1($direccionD1,$direccionD,$direccionO);
?>