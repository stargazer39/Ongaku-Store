package com.ongakustore;

public class Music {
	public int getSongId() {
		return songId;
	}
	public void setSongId(int songId) {
		this.songId = songId;
	}
	public int getArtistId() {
		return artistId;
	}
	public void setArtistId(int artistId) {
		this.artistId = artistId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getReleseYear() {
		return releseYear;
	}
	public void setReleseYear(int releseYear) {
		this.releseYear = releseYear;
	}
	public float getSongLength() {
		return songLength;
	}
	public void setSongLength(float songLength) {
		this.songLength = songLength;
	}
	public int getListenCount() {
		return listenCount;
	}
	public void setListenCount(int listenCount) {
		this.listenCount = listenCount;
	}
	private int songId;
	private int artistId;
	private String title;
	private String genre;
	private int releseYear;
	private float songLength;
	private int listenCount;
	
}
