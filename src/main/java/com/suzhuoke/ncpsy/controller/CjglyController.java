package com.suzhuoke.ncpsy.controller;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.suzhuoke.ncpsy.dao.CjglyMapper;
import com.suzhuoke.ncpsy.model.Cjgly;
import com.suzhuoke.ncpsy.model.Ewm;
import com.suzhuoke.ncpsy.model.EwmNcpVo;
import com.suzhuoke.ncpsy.model.Ncp;
import com.suzhuoke.ncpsy.service.ICjglyService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * <p>
 * 前端控制器
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

	/**
	 * 删除超级管理员
	 * 
	 * @param cjgly
	 * @return
	 */
	@RequestMapping("/admin/delete")
	@ResponseBody
	public boolean adminDelete(@RequestBody Cjgly cjgly) {
		logger.info("/handle/admin/delete===> cjgly={}", cjgly);
		QueryWrapper<Cjgly> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("id", cjgly.getId());

		return cjglyService.remove(queryWrapper);
	}

	/**
	 * 删除超级管理员
	 * 
	 * @param cjgly
	 * @return
	 */
	@RequestMapping("/admin/select")
	@ResponseBody
	public boolean adminSelect(@RequestBody Cjgly cjgly) {
		logger.info("/handle/admin/delete===> cjgly={}", cjgly);
		QueryWrapper<Cjgly> queryWrapper = new QueryWrapper<>();
		queryWrapper.eq("id", cjgly.getId());

		return cjglyService.remove(queryWrapper);
	}

	@RequestMapping("/admin/add")
	@ResponseBody
	public boolean adminAdd(@RequestBody Cjgly cjgly) {
		logger.info("/handle/admin/add===> cjgly={}", cjgly);
		// QueryWrapper<Cjgly> queryWrapper = new QueryWrapper<>();
		// queryWrapper.eq("id",cjgly.getId());
		if (cjgly.getId() == null || "".equals(cjgly.getId()) || cjgly.getMc() == null || "".equals(cjgly.getMc())
				|| cjgly.getMm() == null || "".equals(cjgly.getMm()) || cjgly.getZh() == null
				|| "".equals(cjgly.getZh())) {
			return false;
		}
		return cjglyService.save(cjgly);
	}

	/**
	 * 查询超级管理员列表
	 * 
	 * @param page
	 * @param limit
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/admin/list")
	@ResponseBody
	public Map adminList(@RequestParam int page, @RequestParam int limit) throws Exception {
		// QueryWrapper<Cjgly> ncpQueryWrapper = new QueryWrapper<>();
		List<Cjgly> dataList = cjglyService.list(null);
		logger.info("=========={}", dataList);
		// 查询到的总量，返回数据要用
		int count = dataList.size();
		// list截取分页的索引
		int fromIndex = (page - 1) * limit;
		int toIndex = page * limit;
		// 截取分页数据
		if (page * limit > count) {
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
