<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-新增农产品"/>
<body>
	<div class="layui-tab"  lay-filter="demo" lay-allowClose="true">
	  <ul class="layui-tab-title">
	    <li class="layui-this">网站设置</li>
	    <li>用户管理</li>
	    <li>权限分配</li>
	    <li>商品管理</li>
	    <li>订单管理</li>
	  </ul>
	  <div class="layui-tab-content">
	    <div class="layui-tab-item layui-show">内容1</div>
	    <div class="layui-tab-item">内容2</div>
	    <div class="layui-tab-item">内容3</div>
	    <div class="layui-tab-item">内容4</div>
	    <div class="layui-tab-item">内容5</div>
	  </div>
	</div>
	 
	<script>
	//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
	layui.use('element', function(){
	  var element = layui.element;
	  
	  element.tabAdd('demo', {
		  title: '选项卡的标题'
		  ,content: '<iframe src="/ncpsy/product/delete" width="100%" height="100%" frameborder="0"></iframe>' //支持传入html
		  ,id: 'id1'
		});
	});
	</script>
</body>
</html>