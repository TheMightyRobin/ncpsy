<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-农产品列表" />
<body>
	<div>
		<table id="list" lay-filter="list"></table>
	</div>

	<script type="text/html" id="bar">
    	<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
    	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
			url: '/ncpsy/handle/product/list',
			where: ncp,
			page: true,
			cols: [[
				{field: 'ncpid', title: '农产品id', sort: true, fixed: 'left'},
				{field: 'ncpmc', title: '农产品名称'},
				{field: 'cd', title: '产地'},
				{field: 'pz', title: '品种'},
				{field: 'ccrq', title: '出厂日期', sort: true},
				{field: 'zzfs', title: '种植方式'},
				{field: 'ewmid', title: '二维码id', sort: true},
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
					title: '农产品信息',
					area: ['60%', '60%'],
					offset: '50px',
					content: "/ncpsy/product/info?ncpid=" + data.ncpid 
				});
			} else if(layEvent == 'edit') {
				var url = "/ncpsy/product/modify?ncpid=" + data.ncpid
						+ "&ncpmc=" + data.ncpmc
						+ "&cd=" + data.cd
						+ "&pz=" + data.pz
						+ "&ccrq=" + data.ccrq
						+ "&zzfs=" + data.zzfs;
				layer.open({
					type: 2,
					title: '农产品编辑',
					area: ['60%', '60%'],
					offset: '50px',
					content: url
				});
			} else if(layEvent == 'del') {
				layer.confirm('确定删除吗?', {icon: 3, title:'提示'}, function(index){
					console.log(index);
					var loadIndex = layer.load();
					$.ajax({
						url: "/ncpsy/handle/product/delete",
						type: "post",
						contentType: "application/json;charset=UTF-8",
						data: JSON.stringify(data),
						dataType: 'json',
						timeout: 20000,
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
			}
		});
	});
	</script>
</body>
</html>