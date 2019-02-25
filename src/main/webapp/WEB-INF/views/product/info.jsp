<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-农产品信息" />
<body>
	<p id="ncpidParam" style="visibility: hidden">${ param.ncpid }</p>
	<div>
		<table class="layui-table">
			<colgroup>
				<col width="30%">
				<col width="70%">
			</colgroup>
			<tbody>
				<tr>
					<th>农产品id</th>
					<th id="ncpid"></th>
				</tr>
				<tr>
					<th>农产品名称</th>
					<th id="ncpmc"></th>
				</tr>
				<tr>
					<th>产地</th>
					<th id="cd"></th>
				</tr>
				<tr>
					<th>品种</th>
					<th id="pz"></th>
				</tr>
				<tr>
					<th>出厂日期</th>
					<th id="ccrq"></th>
				</tr>
				<tr>
					<th>种植方式</th>
					<th id="zzfs"></th>
				</tr>
				<tr>
					<th>企业名称</th>
					<th id="qymc"></th>
				</tr>
				<tr>
					<th>地址</th>
					<th id="dz"></th>
				</tr>
				<tr>
					<th>负责人</th>
					<th id="fzr"></th>
				</tr>
				<tr>
					<th>电话</th>
					<th id="dh"></th>
				</tr>
				<tr>
					<th>邮箱</th>
					<th id="yx"></th>
				</tr>
				<tr>
					<th>备注</th>
					<th id="bz"></th>
				</tr>
			</tbody>
		</table>
	</div>
	
	<script>
		layui.use(['table', 'layer'], function() {
			var table = layui.table,
			layer = layui.layer;
			
			//加载
			var index = layer.load();
			
			//获取ncpid
			var ncpidParam = $("#ncpidParam").text();
			var ncpData = {
					ncpid: ncpidParam
			}
			
			//初始化表格
			//查询农产品信息
			$.ajax({
				url: "/ncpsy/handle/product/getone",
				type: "post",
				contentType: "application/json;charset=UTF-8",
				data: JSON.stringify(ncpData),
				dataType: "json",
				timeout: 20000,
				success: function(response) {
					console.log(response);
					if(response) {
						//循环每个属性，并设置到页面中
						for(var prop in response) {
							$("#"+prop).text(response[prop]);
						}
						var qyData = {
								qyid: response.qyid
						}
						//查询企业信息
						$.ajax({
							url: "/ncpsy/handle/user/get",
							type: "post",
							contentType: "application/json;charset=UTF-8",
							data: JSON.stringify(qyData),
							dataType: "json",
							timeout: 20000,
							success: function(response) {
								console.log(response);
								layer.close(index);
								//循环每个属性，并设置到页面中
								for(var prop in response) {
									$("#"+prop).text(response[prop]);
								}
							},
							error: function(response) {
								console.log(response);
								layer.close(index);
								layer.msg("请求错误！");
							}
						});
					}
				},
				error: function(response) {
					console.log(response);
					layer.close(index);
					layer.msg("请求错误！");
				}
			});
		});
	</script>
</body>
</html>