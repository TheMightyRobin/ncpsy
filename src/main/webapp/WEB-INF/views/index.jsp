<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-首页" defineJs="/ncpsy/static/js/jquery.particleground.min.js" />
<body>
	<ul class="layui-nav layui-bg-green" lay-filter="">
		<li class="layui-nav-item">农产品溯源系统</li>
		<li class="layui-nav-item" style="float:right"><a href="/ncpsy/login">企业登录</a></li>
	</ul>
	<img src="/ncpsy/static/img/banner.jpg" style="width:100%">	
	<div class="layui-container">
		<div class="layui-row" style="margin-top:30px">
			<div class="layui-col-md4">&nbsp</div>
			<div class="layui-col-md4">
				<form class="layui-form">
					<input type="text" name="ncpid" required  lay-verify="required" placeholder="请输入农产品id" autocomplete="off" class="layui-input" maxlength="20" id="ncpid">
				</form>
			</div>
			<div class="layui-col-md2">
				<button class="layui-btn" id="search">溯源</button>
			</div>
		</div>
		<div class="layui-row">
			<img src="/ncpsy/static/img/content.png" style="width:100%">
		</div>
	</div>
	
	<div class="footer layui-bg-gray" style="text-align:center;height:100px">
		<p style="line-height:100px">© 2019 苏卓可 </p>
	</div>
	
	<script>
		layui.use('element', function() {
			var element = layui.element;
			
			$("#search").on("click", function() {
				window.location.href="/ncpsy/info/product-info?ncpid=" + $("#ncpid").val();
			});
		});
	</script>
</body>
</html>