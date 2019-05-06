<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-添加管理员"
	defineJs="/ncpsy/static/js/isQyLogin.js"
	defineCss="/ncpsy/static/css/tab-style.css" />
<body>
	<form class="layui-form" lay-filter="formTest">
		<div class="layui-row">
			<div class="layui-row">
				<div class="layui-inline">
					<label class="layui-form-label">管理员ID</label>
					<div class="layui-input-inline">
						<input name="id" class="layui-input">
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-inline">
						<label class="layui-form-label">账号</label>
						<div class="layui-input-inline">
							<input name="zh" class="layui-input">
						</div>
					</div>
					<div class="layui-row">
						<div class="layui-inline">
							<label class="layui-form-label">密码</label>
							<div class="layui-input-inline">
								<input name="mm" class="layui-input">
							</div>
						</div>
						<div class="layui-row">
							<div class="layui-inline">
								<label class="layui-form-label">名称</label>
								<div class="layui-input-inline">
									<input name="mc" class="layui-input">
								</div>
							</div>

							<div class="layui-row">
								<div class="layui-col-md2 layui-col-md-offset1">
									<button class="layui-btn layui-btn-warm submit-btn" lay-submit
										lay-filter="add">添加</button>
								</div>


							</div>
	</form>


	<script>

		layui.use('form', function() {
			
 			var form = layui.form;
			 
			form.on('submit(add)', function(data) {
				console.log(data.field);
				var index = layer.load();
				$.ajax({
					url : '/ncpsy/handle/admin/add',
					type : 'post',
					contentType : "application/json;charset=UTF-8",
					data : JSON.stringify(data.field),
					dataType : 'json',
					timeout : 2000,
					success : function(response) {
						form.val("formTest", {
							"id" : "",
							"zh" : "",
							"mm" : "",
							"mc" : "",
						}); 
						console.log(response);
						//console.log(data.field.bz);
						layer.msg("添加成功");
						//将返回的企业信息储存在localStorage
					},
					error : function(response) {
						console.log(response);
						layer.close(index);
						layer.msg("请求出错，请重试!");
					}
				});
				return false;
			})
		});
	</script>
</body>
</html>