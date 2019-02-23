package com.suzhuoke.ncpsy.controller;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.suzhuoke.ncpsy.model.Cjgly;
import com.suzhuoke.ncpsy.service.ICjglyService;

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
public class CjglyController {
	
	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ICjglyService cjglyService;
	
	@RequestMapping("/admin/login")
	@ResponseBody
	public Cjgly adminLogin(@RequestBody Cjgly cjgly) {
		logger.info("/handle/admin/login===> cjgly={}", cjgly);
		QueryWrapper<Cjgly> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("zh", cjgly.getZh()).eq("mm", cjgly.getMm());
		Cjgly cjglyEntity = cjglyService.getOne(queryWrapper);
		return cjglyEntity;
	}

}

