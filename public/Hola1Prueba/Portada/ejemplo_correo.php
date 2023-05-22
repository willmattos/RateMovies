1 <?php 	
 	use PHPMailer\PHPMailer\PHPMailer;
 	require "vendor/autoload.php";
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
	$mail->SetFrom('user@gmail.com', 'Test');
	// asunto
	$mail->Subject    = "Correo de prueba";
	// cuerpo
	$mail->MsgHTML('Prueba');
	// adjuntos
	//$mail->addAttachment("empleado.xsd");
	// destinatario
	$address = "destino@servidor.com";
	$mail->AddAddress($address, "Test");
	// enviar
	$resul = $mail->Send();
	if(!$resul) {
	  echo "Error" . $mail->ErrorInfo;
	} else {
	  echo "Enviado";
	}