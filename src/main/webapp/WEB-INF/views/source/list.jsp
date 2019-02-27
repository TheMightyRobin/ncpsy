<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-溯源列表" />
<body style="padding:10px">
	<div>
		<table id="list" lay-filter="list"></table>
	</div>

	<script type="text/html" id="bar">
    	<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
	</script>

	<script>
	layui.use(['table', 'laypage', 'layer'], function() {
		var table = layui.table,
		laypage = layui.laypage,
		layer = layui.layer;
		
		var qyid = localStorage.getItem('qyid');
		var ncp = {
			syqyid : qyid
		}
		
		//渲染表格
		table.render({
			elem: '#list',
			url: '/ncpsy/handle/source/list',
			where: ncp,
			page: true,
			cols: [[
				{field: 'syid', title: '溯源id', sort: true},
				{field: 'syip', title: '溯源ip'},
				{field: 'sysj', title: '溯源日期', sort: true},
				{field: 'syncpid', title: '溯源农产品id', sort: true}
			]]
		});
	});
	</script>
</body>
</html>