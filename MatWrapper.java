package edu.rosehulman.mohan;

import java.util.List;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



import backtype.storm.tuple.Tuple;

public class MatWrapper extends CVartifact{
	public final static String NO_IMAGE = "none";
	public final static String JPG_IMAGE = "jpg";
	public final static String PNG_IMAGE = "png";
	
	private long timeStamp;
//	private Mat mat;
	private String imageType = JPG_IMAGE;
	private byte[] imageBytes;
	private BufferedImage image;
	private Rectangle boundingBox;

	
	public MatWrapper(long sequence, String imageType, BufferedImage image, long timeStamp, Rectangle boundingBox) throws IOException {
		

	}
}
