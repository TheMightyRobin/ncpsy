package com.suzhuoke.ncpsy.model;

/**
 * <p>
 * 
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-25
 */
public class EwmNcpVo {
	private static final long serialVersionUID = 1L;
	
	private String ewmid;

    private String ewmsj;
    
    private String ncpmc;
    
    public String getEwmid() {
        return ewmid;
    }

    public void setEwmid(String ewmid) {
        this.ewmid = ewmid;
    }

    public String getEwmsj() {
        return ewmsj;
    }

    public void setEwmsj(String ewmsj) {
        this.ewmsj = ewmsj;
    }
    
    public String getNcpmc() {
    	return ncpmc;
    }
    
    public void setNcpmc(String ncpmc) {
    	this.ncpmc = ncpmc;
    }
}
