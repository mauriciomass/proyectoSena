package model;

import java.security.Security;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import model.encoder;

public class Configmail {
	
	public static void enviarCorreo(String host,String puerto,
			final String remitente,final String password,String destinatario,
			String asunto,String cuerpo) throws AddressException, MessagingException {
		
		Properties propiedades=new Properties();
		
		propiedades.put("mail.smtp.host", host);
		propiedades.put("mail.smtp.port", puerto);
		propiedades.put("mail.smtp.auth", "true");
		propiedades.put("mail.smtp.starttls.enable","true");
		
		Authenticator autenticar=new Authenticator() {
			
			public PasswordAuthentication getPasswordAuthentication() {
				
				if((remitente!=null)&& (remitente.length()>0)&& (password!=null)&& (password.length()>0)) {
					return  new PasswordAuthentication(remitente,password);
				}
				
				return null;
			}
		};
		
		
		Session sesion=Session.getDefaultInstance(propiedades, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(remitente,password);
			}
		});
		
		Message msg=new MimeMessage(Session.getDefaultInstance(propiedades,autenticar));
		
		msg.setFrom(new InternetAddress(remitente));
		
		InternetAddress[]direcciones= {new InternetAddress(destinatario)};
		
		msg.setRecipients(Message.RecipientType.TO, direcciones);
		msg.setSubject(asunto);
		msg.setSentDate(new Date());
		msg.setContent(cuerpo,"text/html; charset=utf-8");
		
		Transport.send(msg);
	}


/*public Boolean sendMail(String userEmail) {
	Boolean flag = false;
	try {
		 // Obtener la hora actual del sistema
		Date now = new Date();
		String currentTime = "" + now.getTime();
		
		String urlString = "http://localhost:8080/EVM/forgetPasswordAction?method=resetPassword&key=";
		encoder cEncryption = new encoder();
		String secretKey = "SomosAgarez";
		String encryptedCode = cEncryption.encryptCode(secretKey,currentTime + "@" + userEmail);
		String link = urlString + encryptedCode;
		String adminMailAddress = "agarez2022@gmail.com";
		String contents = userEmail + link + adminMailAddress;
		 // Configuración del buzón
		String serverHost = "mail.smtp.host";
		String serverPort = "mail.smtp.port";
		Boolean isValidate = true;
		String userName = "blablalbablabla@163.com";
		String password = "blablabla";
		String toMailAddress = userEmail;
		 String subtitle = "Recupere la contraseña de la cuenta registrada de la plataforma de gestión de datos de investigación científica";
		this.setMail(serverHost, serverPort, isValidate, userName, password, toMailAddress, subtitle, contents);
		
		flag = true;
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	return flag;
}

public void setMail(String serverHost, String serverPort,
		Boolean isValidate, String userName, String password,
		String toMailAddress, String subtitle, String contents) {
	 // Esta clase es principalmente para configurar el correo
	MailSenderInfo mailInfo = new MailSenderInfo();
	mailInfo.setMailServerHost(serverHost);
	mailInfo.setMailServerPort(serverPort);
	mailInfo.setValidate(isValidate);
	mailInfo.setUserName(userName);
	 mailInfo.setPassword (contraseña); // La contraseña de su buzón
	mailInfo.setFromAddress(userName);
	mailInfo.setToAddress(toMailAddress);
	mailInfo.setSubject(subtitle);
	mailInfo.setContent(contents);
	 // Esta clase principalmente envía correo
	SimpleMailSender sms = new SimpleMailSender();
// sms.sendTextMail (mailInfo); // Enviar formato de estilo
	 SimpleMailSender.sendHtmlMail (mailInfo); // Enviar formato HTML
}*/

}





