<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-修改农产品" />
<body>
	<div style="padding:20px 20%">
		<form class="layui-form">
			<div class="layui-form-item">
				<label class="layui-form-label">农产品名称</label>
				<div class="layui-input-block">
					<input type="text" name="ncpmc" required  lay-verify="required" placeholder="请输入农产品名称" autocomplete="off" class="layui-input" maxlength="20" value="${ param.ncpmc }">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">产地</label>
				<div class="layui-input-block">
					<input type="text" name="cd" required  lay-verify="required" placeholder="请输入产地" autocomplete="off" class="layui-input" maxlength="30" value="${ param.cd }">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">品种</label>
				<div class="layui-input-block">
					<input type="text" name="pz" required  lay-verify="required" placeholder="请输入品种" autocomplete="off" class="layui-input" maxlength="15" value="${ param.pz }">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">出厂日期</label>
				<div class="layui-input-block">
					<input type="text" name="ccrq" placeholder="yyyy-MM-dd" id="ccrq" class="layui-input" value="${ param.ccrq }">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">种植方式</label>
				<div class="layui-input-block">
					<textarea name="zzfs" required lay-verify="required" placeholder="请输入种植方式" class="layui-textarea" maxlength="100">${ param.zzfs }</textarea>
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn" lay-submit lay-filter="save">提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
				</div>
			</div>
			<div class="layui-form-item" style="visibility:hidden">
				<label class="layui-form-label">农产品id</label>
				<div class="layui-input-block">
					<input type="text" name="ncpid" required  lay-verify="required" placeholder="请输入农产品id" autocomplete="off" class="layui-input" maxlength="20" value="${ param.ncpid }">
				</div>
			</div>
		</form>
	</div>
	 
	<script>
	//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
	layui.use(['form', 'laydate'], function(){
	  var form = layui.form,
	  laydate = layui.laydate;
	  
	  laydate.render({
		  elem: "#ccrq"
	  });
	  
	  //监听提交
	  form.on("submit(save)", function(data) {
		  console.log(JSON.stringify(data.field));
		  var index = layer.load();
		  $.ajax({
			  url: "/ncpsy/handle/product/modify",
			  type: "post",
			  contentType: "application/json;charset=UTF-8",
			  data: JSON.stringify(data.field),
			  dataType: 'json',
			  timeout: 20000,
			  success: function(response) {
				  console.log(response);
				  layer.close(index);
				  if(response) {
					  layer.msg("保存成功！");
				  } else {
					  layer.msg("保存失败，请重试！");
				  }
			  },
			  error: function(response) {
				  console.log(response);
				  layer.close(index);
				  layer.msg("请求出错，请重试!");
			  }
		  });
		  return false;
	  });
	});
	</script>
</body>
</html>