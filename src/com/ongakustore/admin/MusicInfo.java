package com.ongakustore.admin;

import java.util.UUID;

public class MusicInfo {
	private float length;
	private UUID uuid;
	
	public MusicInfo() {
		this.uuid = UUID.randomUUID();
	}
	public float getLength() {
		return length;
	}
	public void setLength(float length) {
		this.length = length;
	}
	public UUID getUuid() {
		return uuid;
	}
}
