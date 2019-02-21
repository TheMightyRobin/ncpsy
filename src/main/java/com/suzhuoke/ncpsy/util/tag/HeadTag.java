package com.suzhuoke.ncpsy.util.tag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class HeadTag extends TagSupport {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private String defineJs, defineCss, title;
	
	public int doStartTag() throws JspException {
		System.out.println(defineJs);
		//从超类获取JspWriter输出对象
		JspWriter out = super.pageContext.getOut();
		String outData = "<head>\r\n" + 
				"	<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n" + 
				"	<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1\">\r\n" + 
				"	<title>" + title + "</title>\r\n" + 
				"	<link rel=\"stylesheet\" href=\"/ncpsy/static/layui/css/layui.css\">\r\n" +
				"	<script src=\"https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js\"></script>\r\n" + 
				"	<script src=\"/ncpsy/static/layui/layui.js\"></script>\r\n";
		if(defineJs != null) {
			//outData = outData.concat("<script src=\"" + defineJs + "\"></script>\r\n");
			String[] jsList = defineJs.split(";");
			for(String jsItem : jsList) {
				outData = outData.concat("<script src=\"" + jsItem + "\"></script>\r\n");
			}
		}
		if(defineCss != null) {
			//outData = outData.concat("<link rel=\"stylesheet\" href=\"" + defineCss + "\">\r\n");
			String[] cssList = defineCss.split(";");
			for(String cssItem : cssList) {
				outData = outData.concat("<link rel=\"stylesheet\" href=\"" + cssItem + "\">\r\n");
			}
		}
		
		try {
			//输出
			out.write(outData);
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return TagSupport.SKIP_BODY;
	}
	
	public int doEndTag() throws JspException {
		JspWriter out = super.pageContext.getOut();
		try {
			out.write("</head>");
		} catch(IOException e) {
			e.printStackTrace();
		}
		return TagSupport.SKIP_BODY;
	}
	
	public String getDefineJs() {
		return defineJs;
	}
	
	public void setDefineJs(String defineJs) {
		this.defineJs = defineJs;
	}
	
	public String getDefineCss() {
		return defineCss;
	}
	
	public void setDefineCss(String defineCss) {
		this.defineCss = defineCss;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}

}
