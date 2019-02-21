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
 * @since 2019-02-17
 */
@TableName("tb_ewm")
public class Ewm extends Model<Ewm> {

    private static final long serialVersionUID = 1L;

    private String ewmid;

    private String ewmsj;


    public String getEwmid() {
        return ewmid;
    }

    public void setEwmid(String ewmid) {
        this.ewmid = ewmid;
    }

    public String getEwmsj() {
        return ewmsj;
    }

    public void setEwmsj(String ewmsj) {
        this.ewmsj = ewmsj;
    }

    @Override
    protected Serializable pkVal() {
        return this.ewmid;
    }

    @Override
    public String toString() {
        return "Ewm{" +
        "ewmid=" + ewmid +
        ", ewmsj=" + ewmsj +
        "}";
    }
}
