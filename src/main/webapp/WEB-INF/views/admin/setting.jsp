</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-超级管理员设置" />
<body style="padding:10px">
	<div>
		<table id="list" lay-filter="list"></table>
	</div>

	<script type="text/html" id="bar">
    	<a class="layui-btn layui-btn-xs" lay-event="delete">删除</a>
	</script>

	<script>
	layui.use(['table', 'laypage', 'layer'], function() {
		var table = layui.table,
		laypage = layui.laypage,
		layer = layui.layer;
		
		var qyid = localStorage.getItem('qyid');
		var ncp = {
			qyid : qyid
		}
		
		//渲染表格
		table.render({
			elem: '#list',
			url: '/ncpsy/handle/admin/list',
			where: ncp,
			page: true,
			cols: [[
				{field: 'id', title: '管理员id'},
				{field: 'zh', title: '账号'},
				{field: 'mm', title: '密码'},
				{field: 'mc', title: '名称'},
				{title: "操作", fixed: 'right', align:'center', toolbar: '#bar'} //这里的toolbar值是模板元素的选择器
			]]
		});
		
		//操作列的三个按钮绑定各自的操作
		table.on('tool(list)', function(obj){
			var data = obj.data;
			layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
				console.log(index);
				var loadIndex = layer.load();
				$.ajax({
					url: "/ncpsy/handle/admin/delete",
					type: "post",
					contentType: "application/json;charset=UTF-8",
					data: JSON.stringify(data),
					dataType: 'json',
					timeout: 2000,
					success: function(response) {
						layer.close(loadIndex);
						if(response) {
							layer.msg("删除成功！");
							window.location.reload();
						} else {
							layer.msg("删除失败！");
						}
					},
					error: function(response) {
						layer.close(loadIndex);
						layer.msg("请求出错，请重试！");
					}
				});
				layer.close(index);
			});
		});
	});
	</script>
</body>
</html>