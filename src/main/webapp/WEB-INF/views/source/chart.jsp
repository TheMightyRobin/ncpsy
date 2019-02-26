<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-图表分析" defineJs="https://cdn.bootcss.com/Chart.js/2.7.3/Chart.js;/ncpsy/static/js/util.js" />
<body>
	<div style="position: relative;width:50%;height:400px">
		<canvas id="myChart"></canvas>
	</div>
	
	<script>
	layui.use(['layer'], function() {
		var layer = layui.layer;
		
		var ctx = $("#myChart");
		
		var data = {
				syqyid: localStorage.getItem('qyid')
		}
		
		var counts = new Array();
		var sysjList = new Array();
		
		
		
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
				console.log(nowDate);
				if(nowDate > sysjList[sysjList.length-1]) {
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
							label: '近期溯源人数',
							data: counts,
							borderColor: "#009688",
							pointBackgroundColor: "#fff",
							pointBorderWidth: "2",
							backgroundColor: "rgba(0,150,136,0.5)"
						}]
					}
				}
				var myChart = new Chart(ctx, chartData);
			},
			error: function(response) {
				layer.msg("请求出错，请重试！");
			}
		});
			
		
	});
	</script>
</body>
</html>