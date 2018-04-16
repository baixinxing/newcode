package com.platform.entity;

import java.io.Serializable;
import java.util.Date;


/**
 * 实体
 * 表名 nideshop_store_configure
 *
 * @author Position
 * @email 7797638@qq.com
 * @date 2018-02-02 18:07:48
 */
public class StoreConfigureEntity implements Serializable {
    private static final long serialVersionUID = 1L;

    //店铺ID（主键唯一）
    private Long storeId;
    //店铺名称（一般为部门一级名称）
    private String storeName;
    //存放部门（店铺/公司）一级ID
    private Long deptParentId;
    //小程序APPID
    private String appId;
    //小程序AppSecret
    private String appSecret;
    //微信支付商户号
    private String muchId;
    //微信支付秘钥
    private String paySingKey;
    //状态 （0 营业   1 休息  2 冻结 ）
    private Integer status;
    //逻辑删除（0 正常  1 删除）
    private Integer isDelete;
    //客服电话
    private String ph;
    //纬度
    private String latitude;
    //经度
    private String longitude;
    //地址信息
    private String address;
    //创建者
    private String createBy;
    //创建时间
    private Date createTime;
    //更新者
    private String updateBy;
    //更新时间
    private Date updateTime;
    //备注
    private String remark;


    /**
     * 设置：店铺ID（主键唯一）
     */
    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    /**
     * 获取：店铺ID（主键唯一）
     */
    public Long getStoreId() {
        return storeId;
    }
    /**
     * 设置：店铺名称（一般为部门一级名称）
     */
    public void setStoreName(String storeName) {
        this.storeName = storeName;
    }

    /**
     * 获取：店铺名称（一般为部门一级名称）
     */
    public String getStoreName() {
        return storeName;
    }
    /**
     * 设置：存放部门（店铺/公司）一级ID
     */
    public void setDeptParentId(Long deptParentId) {
        this.deptParentId = deptParentId;
    }

    /**
     * 获取：存放部门（店铺/公司）一级ID
     */
    public Long getDeptParentId() {
        return deptParentId;
    }
    /**
     * 设置：小程序APPID
     */
    public void setAppId(String appId) {
        this.appId = appId;
    }

    /**
     * 获取：小程序APPID
     */
    public String getAppId() {
        return appId;
    }
    /**
     * 设置：小程序AppSecret
     */
    public void setAppSecret(String appSecret) {
        this.appSecret = appSecret;
    }

    /**
     * 获取：小程序AppSecret
     */
    public String getAppSecret() {
        return appSecret;
    }
    /**
     * 设置：微信支付商户号
     */
    public void setMuchId(String muchId) {
        this.muchId = muchId;
    }

    /**
     * 获取：微信支付商户号
     */
    public String getMuchId() {
        return muchId;
    }
    /**
     * 设置：微信支付秘钥
     */
    public void setPaySingKey(String paySingKey) {
        this.paySingKey = paySingKey;
    }

    /**
     * 获取：微信支付秘钥
     */
    public String getPaySingKey() {
        return paySingKey;
    }
    /**
     * 设置：状态 （0 营业   1 休息  2 冻结 ）
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取：状态 （0 营业   1 休息  2 冻结 ）
     */
    public Integer getStatus() {
        return status;
    }
    /**
     * 设置：逻辑删除（0 正常  1 删除）
     */
    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    /**
     * 获取：逻辑删除（0 正常  1 删除）
     */
    public Integer getIsDelete() {
        return isDelete;
    }

    /**
     * 设置：客服电话
     */
    public void setPh(String ph) {
        this.ph = ph;
    }
    /**
     * 获取：客服电话
     */
    public String getPh() {
        return ph;
    }
    /**
     * 设置：纬度
     */
    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }
    /**
     * 获取：纬度
     */
    public String getLatitude() {
        return latitude;
    }
    /**
     * 设置：经度
     */
    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }
    /**
     * 获取：经度
     */
    public String getLongitude() {
        return longitude;
    }
    /**
     * 设置：地址信息
     */
    public void setAddress(String address) {
        this.address = address;
    }
    /**
     * 获取：地址信息
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置：创建者
     */
    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    /**
     * 获取：创建者
     */
    public String getCreateBy() {
        return createBy;
    }
    /**
     * 设置：创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取：创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }
    /**
     * 设置：更新者
     */
    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    /**
     * 获取：更新者
     */
    public String getUpdateBy() {
        return updateBy;
    }
    /**
     * 设置：更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取：更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }
    /**
     * 设置：备注
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * 获取：备注
     */
    public String getRemark() {
        return remark;
    }
}
