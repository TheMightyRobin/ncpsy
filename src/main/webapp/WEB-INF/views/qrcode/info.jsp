<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-修改农产品" defineJs="https://cdn.bootcss.com/jquery.qrcode/1.0/jquery.qrcode.min.js" />
<body>
	<div style="padding:20px 20%;text-align:center">
		<div id="qrcode"></div>
	</div>
	<p id="ewmsj" style="visibility:hidden">${ param.ewmsj }</p>
	 
	<script>
	//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
	layui.use(['form', 'laydate'], function(){
	  var form = layui.form,
	  laydate = layui.laydate;
	  
	  var ewmsj = $("#ewmsj").text();
	  $("#qrcode").qrcode(ewmsj);
	});
	</script>
</body>
</html>