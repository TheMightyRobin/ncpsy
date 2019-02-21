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
@TableName("tb_qy")
public class Qy extends Model<Qy> {

    private static final long serialVersionUID = 1L;

    private String qyid;

    private String zh;

    private String mm;

    private String qymc;

    private String dz;

    private String fzr;

    private String dh;

    private String yx;

    private String bz;


    public String getQyid() {
        return qyid;
    }

    public void setQyid(String qyid) {
        this.qyid = qyid;
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

    public String getQymc() {
        return qymc;
    }

    public void setQymc(String qymc) {
        this.qymc = qymc;
    }

    public String getDz() {
        return dz;
    }

    public void setDz(String dz) {
        this.dz = dz;
    }

    public String getFzr() {
        return fzr;
    }

    public void setFzr(String fzr) {
        this.fzr = fzr;
    }

    public String getDh() {
        return dh;
    }

    public void setDh(String dh) {
        this.dh = dh;
    }

    public String getYx() {
        return yx;
    }

    public void setYx(String yx) {
        this.yx = yx;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    @Override
    protected Serializable pkVal() {
        return this.qyid;
    }

    @Override
    public String toString() {
        return "Qy{" +
        "qyid=" + qyid +
        ", zh=" + zh +
        ", mm=" + mm +
        ", qymc=" + qymc +
        ", dz=" + dz +
        ", fzr=" + fzr +
        ", dh=" + dh +
        ", yx=" + yx +
        ", bz=" + bz +
        "}";
    }
}
