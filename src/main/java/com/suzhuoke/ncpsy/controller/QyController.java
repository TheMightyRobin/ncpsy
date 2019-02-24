package com.suzhuoke.ncpsy.controller;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suzhuoke.ncpsy.model.Qy;
import com.suzhuoke.ncpsy.service.IQyService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-17
 */
@Controller
@RequestMapping("/handle")
public class QyController {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IQyService qyService;
	
	/**
	 * 注册
	 * @param qy
	 * @return
	 */
	@RequestMapping("/register")
	@ResponseBody
	public boolean register(@RequestBody Qy qy) {
		logger.info("/handle/register===> Qy={}", qy);
		//获取企业表里企业数量，+1
		QueryWrapper<Qy> queryWrapper = new QueryWrapper<>();
		int num = qyService.count(queryWrapper) + 1;
		//拼接企业id("qy" + 0的个数 + num)
		String qyid = "qy";
		if(num /10 == 0) {
			qyid = qyid.concat("00" + num);
		} else if(num / 10 >= 1 && num / 10 < 10) {
			qyid = qyid.concat("0" + num);
		} else {
			qyid = qyid.concat("" + num);
		}
		//将企业信息保存到数据库
		qy.setQyid(qyid);
		boolean flag = qyService.save(qy);
		return flag;
	}
	
	/**
	 * 登录
	 * @param qy
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public Qy login(@RequestBody Qy qy) {
		logger.info("/handle/login===> Qy={}", qy);
		QueryWrapper<Qy> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("zh", qy.getZh()).eq("mm", qy.getMm());
		Qy qyEntity = qyService.getOne(queryWrapper);
		return qyEntity;
	}
	
	@RequestMapping("/user/get")
	@ResponseBody
	public Qy get(@RequestBody Qy qy) {
		logger.info("/handle/user/get===> Qy={}", qy);
		QueryWrapper<Qy> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("qyid", qy.getQyid());
		qy = qyService.getOne(queryWrapper);
		return qy;
	}

}

