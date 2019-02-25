package com.suzhuoke.ncpsy.controller;


import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.suzhuoke.ncpsy.dao.EwmMapper;
import com.suzhuoke.ncpsy.model.EwmNcpVo;
import com.suzhuoke.ncpsy.model.Ncp;
import com.suzhuoke.ncpsy.service.IEwmService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
 * @since 2019-02-17
 */
@Controller
@RequestMapping("/handle")
public class EwmController {

	protected Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IEwmService ewmService;
	
	@Autowired
	private EwmMapper ewmMapper;
	
	@RequestMapping("/qrcode/list")
	@ResponseBody
	public Map qrcodeList(Ncp ncp, @RequestParam int page, @RequestParam int limit) throws Exception {
		logger.info("/handle/qrcode/list===> ncp={}", ncp);
		QueryWrapper<Ncp> ncpQueryWrapper = new QueryWrapper<>();
		List<EwmNcpVo> dataList = ewmMapper.selectEwmNcpList(ncp.getQyid());
		logger.info("=========={}", dataList);
		//查询到的总量，返回数据要用
		int count = dataList.size();
		//list截取分页的索引
		int fromIndex = (page-1)*limit;
		int toIndex = page * limit;
		//截取分页数据
		if(page*limit > count) {
			toIndex = count;
		}
		dataList = dataList.subList(fromIndex, toIndex);
		
		Map response = new HashMap();
		response.put("code", 0);
		response.put("msg", "");
		response.put("count", count);
		response.put("data", dataList);
		return response;
	}
}

