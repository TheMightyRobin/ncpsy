<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-二维码列表" />
<body>
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
			qyid : qyid
		}
		
		//渲染表格
		table.render({
			elem: '#list',
			url: '/ncpsy/handle/qrcode/list',
			where: ncp,
			page: true,
			cols: [[
				{field: 'ncpmc', title: '农产品名称'},
				{field: 'ewmid', title: '二维码id', sort: true},
				{field: 'ewmsj', title: '二维码数据'},
				{title: "操作", fixed: 'right', align:'center', toolbar: '#bar'} //这里的toolbar值是模板元素的选择器
			]]
		});
		
		//操作列的三个按钮绑定各自的操作
		table.on('tool(list)', function(obj) {
			console.log(obj);
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event;  //获得 lay-event 对应的值
			
			if(layEvent == 'detail') {
				layer.open({
					type: 2,
					title: '二维码信息',
					area: ['60%', '60%'],
					offset: '50px',
					content: "/ncpsy/qrcode/info?ewmsj=" + data.ewmsj
				});
			}
		});
	});
	</script>
</body>
</html>