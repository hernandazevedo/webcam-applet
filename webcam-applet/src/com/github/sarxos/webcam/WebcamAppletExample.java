package com.github.sarxos.webcam;

import java.awt.BorderLayout;
import java.awt.Button;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.imageio.ImageIO;
import javax.swing.JApplet;


public class WebcamAppletExample extends JApplet implements ActionListener{

	private static final long serialVersionUID = 3517366452510566924L;
	private final String DEFAULT_SERVLET = "AppletServlet";
	private final String DEFAULT_BUTTON_CAPTURE_TITLE = "Capturar";

	private Button buttonCapture ;
	private Webcam webcam = null;
	private String servlet = null;
	private String keyTokenImagem = null;

	public WebcamAppletExample() {
		super();
	}

	@Override
	public void start() {
		webcam = Webcam.getDefault();
		add(new WebcamPanel(webcam));
		
		//FIXME pegar o Dimension dos parameters e garantir que o tamanho do applet vai ficar certo para qualquer camera.
		buttonCapture = new Button(getParameter("buttonCaptureTitle") != null ? getParameter("buttonCaptureTitle") : DEFAULT_BUTTON_CAPTURE_TITLE);
		buttonCapture.addActionListener(this);
		add(buttonCapture,BorderLayout.AFTER_LAST_LINE);
		
		servlet = getParameter("servlet") != null ? getParameter("servlet") : DEFAULT_SERVLET;
		keyTokenImagem = getParameter("keyTokenImagem");
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		URL url;
		try {
			//FIXME pegar a o protocol + server + port + contextPath abaixo dos parameters 
			url = new URL("http://localhost:8083/TesteBanco/"+servlet);
		
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);
			connection.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			connection.setRequestMethod("POST");
			
			if(keyTokenImagem != null)
				connection.setRequestProperty("keyTokenImagem", keyTokenImagem);
	
			OutputStream out = connection.getOutputStream();
			
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ImageIO.write(webcam.getImage(), "jpg", baos);
			baos.flush();
			byte[] imageInByte = baos.toByteArray();
			out.write(imageInByte,0,imageInByte.length);
			out.flush();
			out.close();
			connection.getResponseCode();
			connection.disconnect();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	@Override
	public void destroy() {
		webcam.close();
	}
}
