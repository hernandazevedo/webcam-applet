package com.prova1java.servlet;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class AppletServlet
 */
public class AppletServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static Logger log = Logger.getLogger(AppletServlet.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppletServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	private void processRequest(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		log.info("Iniciando requisicao. IP:" + req.getRemoteAddr());

		Enumeration<?> e = req.getHeaderNames();
		String keyTokenImagem = req.getHeader("keyTokenImagem");
		int total = 10000;
		while (e.hasMoreElements()) {
			String key = (String) e.nextElement();
			String val = req.getHeader(key);
			if (key.toLowerCase().equals("content-length")) {
				total = (new Integer(val)).intValue();
			}
		}

		byte[] buf = new byte[8192];
		ServletInputStream s = req.getInputStream();
		int read = 0;
		ByteArrayOutputStream bOut = new ByteArrayOutputStream(total);
		try {
			while ((read = s.read(buf, 0, buf.length)) != -1) {
				bOut.write(buf, 0, read);
			}
		} catch (Exception e1) {
			log.error("Read timeout. Ultimo read:" + read,e1);
		}

		byte[] request = bOut.toByteArray();
		gravarDoBancoNoDisco(request,keyTokenImagem);
		log.info(request);
	}
	
	public void gravarDoBancoNoDisco(byte[] imageInByte,String fileName) throws IOException{
		
			InputStream in = new ByteArrayInputStream(imageInByte);
			BufferedImage bImageFromConvert = ImageIO.read(in);
			
			File f = new File(fileName+".jpg");
			log.info("Gravando o arquivo " +f.getName() + " em: "+f.getAbsolutePath());
			ImageIO.write(bImageFromConvert, "JPEG", f);
			
	}
	

}
