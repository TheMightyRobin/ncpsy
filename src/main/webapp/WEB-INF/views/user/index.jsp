<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-主页" defineCss="/ncpsy/static/css/user-index.css" defineJs="https://cdn.bootcss.com/Chart.js/2.7.3/Chart.js;/ncpsy/static/js/util.js" />
<body class="layui-bg-gray" style="padding:10px">
	<div class="layui-fluid">
		<div class="layui-row layui-col-space10">
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">总溯源数</div>
					<div class="layui-card-body">
						<h1 id="total">0</h1>
						<p>&nbsp</p>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">今日溯源数 <i class="layui-icon layui-icon-refresh-1" style="float:right;cursor:pointer"></i></div>
					<div class="layui-card-body">
						<h1 id="today">0</h1>
						<p>同比增长：<span id="todayGrow"></span></p>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">7天溯源人数</div>
					<div class="layui-card-body">
						<h1 id="week">0</h1>
						<p>同比增长：<span id="weekGrow"></span></p>
					</div>
				</div>
			</div>
			<div class="layui-col-md3">
				<div class="layui-card">
					<div class="layui-card-header">月溯源人数</div>
					<div class="layui-card-body">
						<h1 id="month">0</h1>
						<p>同比增长：<span id="monthGrow"></span></p>
					</div>
				</div>
			</div>
		</div>
		<div class="layui-row layui-col-space10">
			<div class="layui-col-md8">
				<div class="layui-card" id="lineCard">
					<div class="layui-card-header">7天溯源图表</div>
					<div class="layui-card-body">
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>
			<div class="layui-col-md4">
				<div class="layui-card" id="pieCard">
					<div class="layui-card-header">溯源分布图表</div>
					<div class="layui-card-body">
						<canvas id="myChart2"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	layui.use(['layer'], function() {
		var layer = layui.layer;
		
		var ctx = $("#myChart");
		var ctx2 = $("#myChart2");
		
		var data = {
				syqyid: localStorage.getItem('qyid')
		}
		
		var counts = new Array();
		var sysjList = new Array();
		
		
		//ajax请求7天溯源人数数据
		$.ajax({
			url: "/ncpsy/handle/source/line",
			type: "post",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify(data),
			dataType: 'json',
			timeout: 20000,
			success: function(response) {
				console.log(response);
				counts = response.counts;
				sysjList = response.sysjList;
				//判断当前日期是否大于返回数据的最大日期
				var nowDate = nowDateToString();
				if(nowDate > sysjList[6]) {
					for(var i = 0; i < sysjList.length; i++) {
						counts[i] = counts[i+1];
						sysjList[i] = sysjList[i+1];
					}
					counts.push(0);
					sysjList.push(nowDate);
				}
				var chartData = {
					type: 'line',
					data: {
						labels: sysjList,
						datasets: [{
							label: '溯源人数',
							data: counts,
							borderColor: "#009688",
							pointBackgroundColor: "#fff",
							pointBorderWidth: "2",
							backgroundColor: "rgba(0,150,136,0.5)"
						}]
					}
				}
				var myChart = new Chart(ctx, chartData);
				setLineAndPieHeight();
			},
			error: function(response) {
				layer.msg("请求出错，请重试！");
			}
		});
			
		//ajax请求溯源分布数据
		$.ajax({
			url: "/ncpsy/handle/source/pie",
			type: "post",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify(data),
			dataType: 'json',
			timeout: 20000,
			success: function(response) {
				console.log(response);
				var countList = response.countList;
				var ncpmcList = response.ncpmcList;
				var chart2Data = {
					type: 'pie',
					data: {
						datasets: [{
					        data: countList,
					        backgroundColor: ['#FF5722', '#FFB800', '#1E9FFF', '#5FB878', '#009688']
					    }],

					    // These labels appear in the legend and in the tooltips when hovering different arcs
					    labels: ncpmcList
					}
				};
				var myChart2 = new Chart(ctx2, chart2Data);
			},
			error: function(response) {
				console.log(response);
			}
		});
		
		$.ajax({
			url: "/ncpsy/handle/source/total",
			type: "post",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify(data),
			dataType: 'json',
			timeout: 20000,
			success: function(response) {
				console.log(response);
				$("#total").text(response[0]);
			},
			error: function(response) {
				console.log(resonse);
			}
		});
		
		$.ajax({
			url: "/ncpsy/handle/source/today",
			type: "post",
			contentType: "application/json;charset=UTF-8",
			data: JSON.stringify(data),
			dataType: 'json',
			timeout: 20000,
			success: function(response) {
				console.log(response);
				$("#today").text(response[0]);
				$("#todayGrow").text(response[1]);
			},
			error: function(response) {
				console.log(resonse);
			}
		});
	});
	
	function setLineAndPieHeight() {
		var lineCardHeight = $("#lineCard").css("height");
		var pieCardHeight = $("#pieCard").css("height");
		if(lineCardHeight > pieCardHeight) {
			$("#pieCard").css("height", lineCardHeight);
		}
	}
	</script>
</body>
</html>