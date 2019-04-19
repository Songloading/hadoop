package edu.rosehulman.mohan;
import java.util.HashMap;

import org.joda.time.DateTime;

import backtype.storm.tuple.Tuple;
/* This class is for contaning and transfering tuple using in Hadoop project
 * Cite from sensorstorm open source project with Apache-2.0 liscence.
 * 
 * */
 
public class CVartifact implements Comparable<CVartifact>{
	private Tuple  t;
	private String name;
	private DateTime timestamp;
	private long sequence;
	private HashMap<String, Object> metadata = new HashMap<String, Object>();
	public Tuple getTuple(){
		return t;
	}
	public String getName(){
		return name;
	}
	public DateTime getTime(){
		return timestamp;
	}
	public HashMap<String, Object> getMetadata() {
		return metadata;
	}
	public long getSequence(){
		return sequence;
	}
	public int compareTo(CVartifact arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

}
