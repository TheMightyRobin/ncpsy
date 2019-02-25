package com.suzhuoke.ncpsy.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-22
 */
@TableName("tb_syly")
public class Syly extends Model<Syly> {

    private static final long serialVersionUID = 1L;

    private String syid;

    private String syip;

    @JsonFormat(pattern = "yyyy-MM-dd", timezone="GMT+8")
    private Date sysj;

    private String syncpid;

    private String syqyid;


    public String getSyid() {
        return syid;
    }

    public void setSyid(String syid) {
        this.syid = syid;
    }

    public String getSyip() {
        return syip;
    }

    public void setSyip(String syip) {
        this.syip = syip;
    }

    public Date getSysj() {
        return sysj;
    }

    public void setSysj(Date sysj) {
        this.sysj = sysj;
    }

    public String getSyncpid() {
        return syncpid;
    }

    public void setSyncpid(String syncpid) {
        this.syncpid = syncpid;
    }

    public String getSyqyid() {
        return syqyid;
    }

    public void setSyqyid(String syqyid) {
        this.syqyid = syqyid;
    }

    @Override
    protected Serializable pkVal() {
        return this.syid;
    }

    @Override
    public String toString() {
        return "Syly{" +
        "syid=" + syid +
        ", syip=" + syip +
        ", sysj=" + sysj +
        ", syncpid=" + syncpid +
        ", syqyid=" + syqyid +
        "}";
    }
}
