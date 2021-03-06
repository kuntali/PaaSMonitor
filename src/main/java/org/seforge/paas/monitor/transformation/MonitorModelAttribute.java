package org.seforge.paas.monitor.transformation;

public class MonitorModelAttribute {
	private String name;
	private String type;	
	private boolean inherited;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public boolean getInherited(){
		return inherited;
	}
	
	public void setInherited(boolean inherited){
		this.inherited = inherited;
	}
	@Override
	public int hashCode(){
		return name.hashCode();		
	}
	
	@Override
	public boolean equals(Object obj){
		 if(obj instanceof MonitorModelAttribute)
		    {
		     if(((MonitorModelAttribute)obj).name == name)
		        return true;
		    }
		    return false;
	}
}
