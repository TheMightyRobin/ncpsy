package com.suzhuoke.ncpsy.dao;

import com.suzhuoke.ncpsy.model.Ewm;
import com.suzhuoke.ncpsy.model.EwmNcpVo;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-17
 */
public interface EwmMapper extends BaseMapper<Ewm> {
	
	@Select("select tb_ewm.ewmid, ewmsj, ncpmc from tb_ncp inner join tb_ewm on tb_ncp.ewmid = tb_ewm.ewmid and tb_ncp.qyid = #{qyid}")
	List<EwmNcpVo> selectEwmNcpList(String qyid);
}
