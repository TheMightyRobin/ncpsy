<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-设置" defineJs="/ncpsy/static/js/isQyLogin.js"
	defineCss="/ncpsy/static/css/tab-style.css" />
<body>
	<form class="layui-form" lay-filter="formTest">
	<div class="layui-row">
			<div class="layui-inline">
				<label class="layui-form-label">企业ID</label>
				<div class="layui-input-inline">
					<input name="qyid" class="layui-input" disabled="disabled">
				</div>
			</div>
		<div class="layui-row">
			<div class="layui-inline">
				<label class="layui-form-label">企业名称</label>
				<div class="layui-input-inline">
					<input name="qymc" class="layui-input">
				</div>
			</div>
			<div class="layui-row">
				<div class="layui-inline">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-inline">
						<input name="yx" class="layui-input">
					</div>
				</div>
				<div class="layui-row">
					<div class="layui-inline">
						<label class="layui-form-label">地址</label>
						<div class="layui-input-inline">
							<input name="dz" class="layui-input">
						</div>
					</div>
					<div class="layui-row">
						<div class="layui-inline">
							<label class="layui-form-label">负责人</label>
							<div class="layui-input-inline">
								<input name="fzr" class="layui-input">
							</div>
						</div>
						<div class="layui-row">
							<div class="layui-inline">
								<label class="layui-form-label">电话</label>
								<div class="layui-input-inline">
									<input name="dh" class="layui-input">
								</div>
							</div>
							<div class="layui-row">
							<div class="layui-inline">
								<label class="layui-form-label">备注</label>
								<div class="layui-input-inline">
									<input name="bz" class="layui-input">
								</div>
							</div>
							 <div class="layui-row">
							 	 <div class="layui-col-md2 layui-col-md-offset1">
								<button class="layui-btn layui-btn-warm submit-btn" lay-submit lay-filter="update">修改</button>
								</div>
								  
     
							</div>
							

	</form>

							   

							
							<script>
								var qyid = localStorage.getItem('qyid');
								
								layui.use('form', function() {
									var form = layui.form;
									var qyid = localStorage.getItem('qyid');
									var qymc = localStorage.getItem('qymc');
									var Yx = localStorage.getItem('yx');
									var Fzr = localStorage.getItem('fzr');
									var Dh = localStorage.getItem('dh');
									var Dz = localStorage.getItem('dz');
									var Bz = localStorage.getItem('bz');
									//console.log(qyid + qymc + Fzr + Yx);
									//console.log(localStorage);

									form.val("formTest", {
										"qyid" : qyid,
										"qymc" : qymc,
										"yx" : Yx,
										"fzr" : Fzr,
										"dh" : Dh,
										"dz" : Dz,
										"bz" :Bz
									});
									form.on('submit(update)',function(data) {
										console.log(data.field);
										var index = layer.load();
										$.ajax({
											url: '/ncpsy/handle/user/stqy',
											type: 'post',
											contentType: "application/json;charset=UTF-8",
											data: JSON.stringify(data.field),
											dataType: 'json',
											timeout: 2000,
											success: function(response) {
												console.log(response);
												//console.log(data.field.bz);
												layer.msg("修改成功");
												//将返回的企业信息储存在localStorage
												localStorage.setItem("qymc", data.field.qymc);
												localStorage.setItem("yx", data.field.yx);
												localStorage.setItem("fzr", data.field.fzr);
												localStorage.setItem("dh", data.field.dh);
												localStorage.setItem("dz", data.field.dz);
												localStorage.setItem("bz", data.field.bz);
											},
											error: function(response) {
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