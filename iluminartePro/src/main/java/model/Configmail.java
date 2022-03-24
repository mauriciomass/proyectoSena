package model;



import java.util.Date;
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

}





