package com.platform.entity;

import java.io.Serializable;


public class Gs implements Serializable {
    private static final long serialVersionUID = 1L;

    //店铺ID
    private Long storeId;
    //身份标识（店铺/公司）一级ID
    private Long deptParentId;
    //客服电话
    private String ph;
    //纬度
    private String latitude;
    //经度
    private String longitude;
    //地址信息
    private String address;


    public Long getStoreId() {
        return storeId;
    }

    public void setStoreId(Long storeId) {
        this.storeId = storeId;
    }

    public Long getDeptParentId() {
        return deptParentId;
    }

    public void setDeptParentId(Long deptParentId) {
        this.deptParentId = deptParentId;
    }

    public String getPh() {
        return ph;
    }

    public void setPh(String ph) {
        this.ph = ph;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
