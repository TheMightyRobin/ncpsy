package com.suzhuoke.ncpsy.controller;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.suzhuoke.ncpsy.model.Syly;
import com.suzhuoke.ncpsy.service.ISylyService;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-22
 */
@Controller
@RequestMapping("/handle")
public class SylyController {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ISylyService sylyService;
	
	@RequestMapping("/source/count")
	@ResponseBody
	public boolean sourceCount(@RequestBody Syly syly, HttpServletRequest request) {
		logger.info("/handle/source/count===> syly={}", syly);
		
		//查询syly总数,即溯源总数
		QueryWrapper<Syly> countQueryWrapper = new QueryWrapper<>();
		countQueryWrapper.eq("syqyid", syly.getSyqyid());
		int count = sylyService.count(countQueryWrapper) + 1;
		//获取当前日期，设置溯源时间
		Date now = new Date();
		syly.setSysj(now);
		//设置溯源id
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newNo = df.format(now);
		String syid = "syly-" + newNo + "-" + count;
		syly.setSyid(syid);
		//设置溯源ip
		String syip = request.getRemoteAddr();
		syly.setSyip(syip);
		
		boolean flag = sylyService.save(syly);
		return flag;
	}

}

