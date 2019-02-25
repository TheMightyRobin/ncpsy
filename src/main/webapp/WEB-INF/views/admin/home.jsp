<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tag/tag.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<mytag:head title="农产品溯源系统-超级管理员" defineJs="/ncpsy/static/js/isAdminLogin.js" />
<body>
	<div class="layui-layout layui-layout-admin">
	  <div class="layui-header">
	    <div class="layui-logo">农产品溯源系统</div>
	    <!-- 头部区域（可配合layui已有的水平导航） -->
	    <ul class="layui-nav layui-layout-left">
	      <li class="layui-nav-item"><a href="">控制台</a></li>
	      <li class="layui-nav-item"><a href="">商品管理</a></li>
	      <li class="layui-nav-item"><a href="">用户</a></li>
	      <li class="layui-nav-item">
	        <a href="javascript:;">其它系统</a>
	        <dl class="layui-nav-child">
	          <dd><a href="">邮件管理</a></dd>
	          <dd><a href="">消息管理</a></dd>
	          <dd><a href="">授权管理</a></dd>
	        </dl>
	      </li>
	    </ul>
	    <ul class="layui-nav layui-layout-right">
	      <li class="layui-nav-item">
	        <a href="javascript:;">
	          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
	          <span id="qymc">贤心</span>
	        </a>
	        <dl class="layui-nav-child">
	          <dd><a href="">基本资料</a></dd>
	          <dd><a href="">安全设置</a></dd>
	        </dl>
	      </li>
	      <li class="layui-nav-item"><a href="javascript:;" id="logout">退出登录</a></li>
	    </ul>
	  </div>
	  
	  <div class="layui-side layui-bg-black">
	    <div class="layui-side-scroll">
	      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
	      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
	        <li class="layui-nav-item layui-nav-itemed">
	          <a class="" href="javascript:;">农产品管理</a>
	          <dl class="layui-nav-child">
	            <dd><a href="javascript:;" class="tablink" id="productList" tabsrc="/ncpsy/product/list"><i class="layui-icon layui-icon-form"></i> 农产品列表</a></dd>
	            <dd><a href="javascript:;" class="tablink" id="productAdd" tabsrc="/ncpsy/product/add"><i class="layui-icon layui-icon-add-circle-fine"></i> 新增农产品</a></dd>
	          </dl>
	        </li>
	        <li class="layui-nav-item">
	          <a href="javascript:;">二维码管理</a>
	          <dl class="layui-nav-child">
	            <dd><a href="javascript:;" class="tablink" id="qrcodeList" tabsrc="/ncpsy/qrcode/list"><i class="layui-icon layui-icon-form"></i> 二维码列表</a></dd>
	          </dl>
	        </li>
	        <li class="layui-nav-item">
	          <a href="javascript:;">溯源管理</a>
	          <dl class="layui-nav-child">
	            <dd><a href="javascript:;" class="tablink" id="sourceList" tabsrc="/ncpsy/source/list"><i class="layui-icon layui-icon-form"></i> 溯源列表</a></dd>
	            <dd><a href="javascript:;" class="tablink" id="sourceChart" tabsrc="/ncpsy/source/chart"><i class="layui-icon layui-icon-chart"></i> 图表分析</a></dd>
	          </dl>
	        </li>
	        <li class="layui-nav-item">
	          <a href="javascript:;">企业管理</a>
	          <dl class="layui-nav-child">
	            <dd><a href="javascript:;" class="tablink" id="userList" tabsrc="/ncpsy/admin/user-list"><i class="layui-icon layui-icon-set-fill"></i> 企业列表</a></dd>
	          </dl>
	        </li>
	        <li class="layui-nav-item">
	          <a href="javascript:;">超级管理员</a>
	          <dl class="layui-nav-child">
	            <dd><a href="javascript:;" class="tablink" id="userSetting" tabsrc="/ncpsy/admin/setting"><i class="layui-icon layui-icon-set-fill"></i> 设置</a></dd>
	          </dl>
	        </li>
	      </ul>
	    </div>
	  </div>
	  
	  <div class="layui-body">
	    <!-- 内容主体区域 -->
	    <div class="layui-tab" lay-filter="page" lay-allowClose="true">
	    	<ul class="layui-tab-title">
	    	</ul>
	    	<div class="layui-tab-content">
	    	</div>
	    </div>
	  </div>
	  
	  <div class="layui-footer">
	    <!-- 底部固定区域 -->
	    © 苏卓可 - 底部固定区域
	  </div>
	</div>
	<script>
	layui.use('element', function(){
	  var element = layui.element;
	  
	  $("#qymc").text(localStorage.getItem("mc"));
	  
	  //用于存放tabId的数组
	  var tabList = new Array();
	  
	  $(".tablink").on("click", function() {
		  //console.log($(this).attr("id"));
		  //console.log($(this)[0].innerText);
		  var tabId = $(this).attr("id");
		  var tabSrc = $(this).attr("tabsrc");
		  var tabTitle = $(this)[0].innerText;
		  //查找现在拥有的tab里有没有相同的tabId,有返回索引，没有则返回-1
		  var flag = tabList.findIndex(function(element) {
			  return element == tabId;
		  })
		  //如果上面代码没找到tab，既返回-1,则添加tab
		  if(flag < 0) {
			  tabList.push(tabId);
			  element.tabAdd("page", {
				  title: tabTitle,
				  content: "<div><iframe src='" + tabSrc + "' width='100%' height='100%' frameborder='0'></iframe></div>",
				  id: tabId
			  });
		  }
		  //跳转到tab
		  element.tabChange('page', tabId);
	  });
	  
	  //当删除tab页时，根据tab索引删除tabList数组的元素
	  element.on('tabDelete(page)', function(data) {
		  var index = data.index;
		  //删除索引为index的元素
		  tabList.splice(index, 1);
	  });
	  
	  //退出登录
	  $("#logout").on("click", function() {
		  localStorage.clear();
		  window.location.href = "/ncpsy/admin/login";
	  });
	});
	</script>
</body>
</html>