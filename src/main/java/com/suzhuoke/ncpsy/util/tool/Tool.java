package com.suzhuoke.ncpsy.util.tool;

import java.util.Calendar;
import java.util.Date;

public class Tool {
	
	/**
	 * 获取日期day前num日的时间对象
	 * @param day
	 * @param num
	 * @return
	 */
	public Date getDateBefore(Date day, int num) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(day);
		cal.set(Calendar.DATE, cal.get(Calendar.DATE) - num);
		return cal.getTime();
	}
}
