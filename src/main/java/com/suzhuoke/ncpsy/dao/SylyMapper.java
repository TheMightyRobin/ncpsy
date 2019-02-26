package com.suzhuoke.ncpsy.dao;

import com.suzhuoke.ncpsy.model.Syly;
import com.suzhuoke.ncpsy.model.SylyCountNcpGroupByNcpid;

import java.util.List;

import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-22
 */
public interface SylyMapper extends BaseMapper<Syly> {

	@Select("select syncpid, ncpmc, count(*) from tb_syly inner join tb_ncp on tb_syly.syncpid = tb_ncp.ncpid and tb_syly.syqyid = 'qy005' group by tb_syly.syncpid order by count(*) desc limit 4")
	@Results({
		@Result(column="syncpid",property="syncpid"),
		@Result(column="ncpmc",property="ncpmc"),
		@Result(column="count(*)",property="count")
	})
	List<SylyCountNcpGroupByNcpid> selectSylyCountNcpGroupByNcpid(String qyid);
}
