package com.suzhuoke.ncpsy.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-22
 */
@TableName("tb_cjgly")
public class Cjgly extends Model<Cjgly> {

    private static final long serialVersionUID = 1L;

    private String id;

    private String zh;

    private String mm;

    private String mc;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getZh() {
        return zh;
    }

    public void setZh(String zh) {
        this.zh = zh;
    }

    public String getMm() {
        return mm;
    }

    public void setMm(String mm) {
        this.mm = mm;
    }

    public String getMc() {
        return mc;
    }

    public void setMc(String mc) {
        this.mc = mc;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "Cjgly{" +
        "id=" + id +
        ", zh=" + zh +
        ", mm=" + mm +
        ", mc=" + mc +
        "}";
    }
}
