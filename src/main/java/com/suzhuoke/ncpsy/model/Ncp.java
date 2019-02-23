package com.suzhuoke.ncpsy.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.time.LocalDate;
import java.util.Date;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author RobinYoung10
 * @since 2019-02-17
 */
@TableName("tb_ncp")
public class Ncp extends Model<Ncp> {

    private static final long serialVersionUID = 1L;

    private String ncpid;

    private String ncpmc;

    private String cd;

    private String pz;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date ccrq;

    private String zzfs;

    private String qyid;

    private String ewmid;


    public String getNcpid() {
        return ncpid;
    }

    public void setNcpid(String ncpid) {
        this.ncpid = ncpid;
    }

    public String getNcpmc() {
        return ncpmc;
    }

    public void setNcpmc(String ncpmc) {
        this.ncpmc = ncpmc;
    }

    public String getCd() {
        return cd;
    }

    public void setCd(String cd) {
        this.cd = cd;
    }

    public String getPz() {
        return pz;
    }

    public void setPz(String pz) {
        this.pz = pz;
    }

    public Date getCcrq() {
        return ccrq;
    }

    public void setCcrq(Date ccrq) {
        this.ccrq = ccrq;
    }

    public String getZzfs() {
        return zzfs;
    }

    public void setZzfs(String zzfs) {
        this.zzfs = zzfs;
    }

    public String getQyid() {
        return qyid;
    }

    public void setQyid(String qyid) {
        this.qyid = qyid;
    }

    public String getEwmid() {
        return ewmid;
    }

    public void setEwmid(String ewmid) {
        this.ewmid = ewmid;
    }

    @Override
    protected Serializable pkVal() {
        return this.ncpid;
    }

    @Override
    public String toString() {
        return "Ncp{" +
        "ncpid=" + ncpid +
        ", ncpmc=" + ncpmc +
        ", cd=" + cd +
        ", pz=" + pz +
        ", ccrq=" + ccrq +
        ", zzfs=" + zzfs +
        ", qyid=" + qyid +
        ", ewmid=" + ewmid +
        "}";
    }
}
