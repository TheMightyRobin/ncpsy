package com.suzhuoke.ncpsy.model;

public class SylyCountNcpGroupByNcpid {

	private static final long serialVersionUID = 1L;
	
	private String syncpid;
	
	private String ncpmc;
	
	private int count;
	
	public String getSyncpid() {
        return syncpid;
    }

    public void setSyncpid(String syncpid) {
        this.syncpid = syncpid;
    }
    
    public String getNcpmc() {
    	return ncpmc;
    }
    
    public void setNcpmc(String ncpmc) {
    	this.ncpmc = ncpmc;
    }
    
    public int getCount() {
    	return count;
    }
    
    public void setCount(int count) {
    	this.count = count;
    }
}
