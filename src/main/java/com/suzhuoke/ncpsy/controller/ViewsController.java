package com.suzhuoke.ncpsy.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * <p>
 *  页面控制器
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-17
 */
@Controller
public class ViewsController {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/login")
	public String login(Model model) {
		logger.info("访问user/login页面");
		return "user/login";
	}
	
	@RequestMapping("/register")
	public String register(Model model) {
		logger.info("访问user/register页面");
		return "user/register";
	}
	
	@RequestMapping("/home")
	public String home(Model model) {
		logger.info("访问user/home页面");
		return "user/home";
	}
	
	@RequestMapping("/setting")
	public String setting(Model model) {
		logger.info("访问user/setting页面");
		return "user/setting";
	}
	
	@RequestMapping("/product/list")
	public String productList(Model model) {
		logger.info("访问product/list页面");
		return "product/list";
	}
	
	@RequestMapping("/product/add")
	public String productAdd(Model model) {
		logger.info("访问product/add页面");
		return "product/add";
	}
	
	@RequestMapping("/product/modify")
	public String productModify(Model model) {
		logger.info("访问product/modify页面");
		return "product/modify";
	}
	
	@RequestMapping("/product/delete")
	public String productDelete(Model model) {
		logger.info("访问product/delete页面");
		return "product/delete";
	}
	
	@RequestMapping("/qrcode/list")
	public String qrcodeList(Model model) {
		logger.info("访问qrcode/list页面");
		return "qrcode/list";
	}
	
	@RequestMapping("/source/list")
	public String sourceList(Model model) {
		logger.info("访问source/list页面");
		return "source/list";
	}
	
	@RequestMapping("/source/chart")
	public String sourceChart(Model model) {
		logger.info("访问source/chart页面");
		return "source/chart";
	}
}
