package com.ongakustore;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;
/**
 * Servlet implementation class AddMusicController
 */
@WebServlet("/addSong")
@MultipartConfig
public class AddMusicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	private HttpServletRequest servletRequest;
	
	private String getRealPath() {	
		return servletRequest.getSession().getServletContext().getRealPath("/");
	}

    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMusicController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			// Get all required parameters
			String artistId = request.getParameter("artistId");
			String title = request.getParameter("title");
			String genre = request.getParameter("genre");
			String releseDate = request.getParameter("releseDate");
			String album = request.getParameter("album");
			
			// Get file streams
			Part afilePart = request.getPart("albumArt");
			Part mfilePart = request.getPart("musicFile");
			
			InputStream albumartStream = afilePart.getInputStream();
			InputStream musicStream = mfilePart.getInputStream();
			
			MusicInfo info = saveSongToDisk(musicStream);
			Connection conn = SqlConnect.connect();
			String query = "INSERT INTO Music(artistId, title, genre, releseYear, songLength, albumArt, album, musicUUID, listenCount) VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setString(1, artistId);
			ps.setString(2, title);
			ps.setString(3, genre);
			ps.setString(4, releseDate.split("-")[0]);
			ps.setFloat(5, info.getLength());
			ps.setBinaryStream(6, albumartStream);
			ps.setString(7, album);
			ps.setString(8, info.getUuid().toString());
			ps.setInt(9, 1);
			
			System.out.println("LOL");
			System.out.println(SqlHelper.assertSuccess(ps.executeUpdate()));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private MusicInfo saveSongToDisk(InputStream musicStream) throws IOException {
		MusicInfo info = new MusicInfo();
		// Get absolute path to tomcat
		
		String srvletPath = getServletContext().getRealPath("/");
		
		System.out.println(srvletPath);
		Path mdPath = Paths.get(srvletPath,"OngakuMusic");
		Files.createDirectories(mdPath);
		
		Path mPath = Paths.get(mdPath.toString(), info.getUuid().toString() + ".mp3");
		File mFile = mPath.toFile();
		
		OutputStream os = new FileOutputStream(mFile);
		
		byte[] buffer = new byte[10240];
	    int bytesRead;
	    while ((bytesRead = musicStream.read(buffer)) != -1) {
	        os.write(buffer, 0, bytesRead);
	    }
	    
	    os.flush();
	    os.close();
	    musicStream.close();
	    
	    info.setLength(getMusicLength(mPath));
		return info;
	}
	
	private float getMusicLength(Path filePath) {
		return 0.0f;
	}
}
