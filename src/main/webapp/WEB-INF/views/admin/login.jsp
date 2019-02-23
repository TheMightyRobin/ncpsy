<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-超级管理员登录" defineCss="/ncpsy/static/css/login.css" />
<body class="layui-bg-green">
	<div class="layui-container">
	  <div class="layui-row form-container">
	    <div class="layui-col-lg4 layui-col-lg-offset4 layui-bg-gray form-block">
	      <h1>农产品溯源系统</h1><br>
	      <h4>超级管理员登录</h4><br>
	      <form class="layui-form" id="loginForm">
	        <div class="layui-form-item">
	          <input type="text" name="zh" required  lay-verify="required" placeholder="帐号" autocomplete="off" class="layui-input"><br>
	          <input type="password" name="mm" required lay-verify="required" placeholder="密码" autocomplete="off" class="layui-input"><br>
	          <button class="layui-btn submit-btn" lay-submit lay-filter="login">登录</button>
	          <a class="layui-form-mid jump-register" href="register">还未有账号？请注册</a>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	<script>
	layui.use(['form', 'layer'], function() {
		var form = layui.form,
		layer = layui.layer;
		
		form.on('submit(login)', function(data) {
			console.log(data.field);
			var index = layer.load();
			$.ajax({
				url: '/ncpsy/handle/admin/login',
				type: 'post',
				contentType: "application/json;charset=UTF-8",
				data: JSON.stringify(data.field),
				dataType: 'json',
				timeout: 20000,
				success: function(response) {
					console.log(response);
					layer.close(index);
					layer.msg("登录成功");
					//localStorage.setItem("qyid", response.qyid);
					//将返回的企业信息储存在localStorage
					for(var prop in response) {
						localStorage.setItem("" + prop, response[prop]);
					}
					window.location.href="/ncpsy/admin/home";
				},
				error: function(response) {
					console.log(response);
					layer.close(index);
					layer.msg("请求出错，请重试!");
				}
			});
			return false;
		})
	})
	</script>
</body>
</html>