package edu.rosehulman.mohan;
import java.io.IOException;

import com.esotericsoftware.kryo.Kryo;
import com.esotericsoftware.kryo.Serializer;
import com.esotericsoftware.kryo.io.Input;
import com.esotericsoftware.kryo.io.Output;
import backtype.storm.tuple.Fields;
import backtype.storm.tuple.Tuple;
import backtype.storm.tuple.Values;

public abstract class ASerializer<Type extends CVartifact> extends Serializer<Type> {
	public static final String name = "NAME";
	public static final String time = "TIME";
	public static final String mat =  "MAT";
	
	@Override
	public void write(Kryo kryo, Output output, Type object) {

		
	}
	@Override
	public Type read(Kryo kryo, Input input, Class<Type> type) {

		return null;
	}
	public Type parseTuple(Tuple tuple) throws IOException{
		Type type = createObject(tuple);
		return type;
	}
	
	public Values buildTuple(CVartifact object) throws IOException{
		Values values = new Values(object.getName(), object.getTime(),  object.getSequence(), object.getMetadata());
		values.addAll(getValues(object));
		return values;
	}
	abstract protected Values getValues(CVartifact object) throws IOException;
	abstract protected Type createObject(Tuple tuple) throws IOException;
	
}
