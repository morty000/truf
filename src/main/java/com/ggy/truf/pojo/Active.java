package com.ggy.truf.pojo;

import java.util.Date;

public class Active {
  private Integer id;
  private Integer status;
  private Integer productId;
  private Date create_time;
  private Date update_time;

  public Active(Integer id, Integer status, Integer productId, Date create_time, Date update_time) {
    this.id = id;
    this.status = status;
    this.productId = productId;
    this.create_time = create_time;
    this.update_time = update_time;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Integer getStatus() {
    return status;
  }

  public void setStatus(Integer status) {
    this.status = status;
  }

  public Integer getProductId() {
    return productId;
  }

  public void setProductId(Integer productId) {
    this.productId = productId;
  }

  public Date getCreate_time() {
    return create_time;
  }

  public void setCreate_time(Date create_time) {
    this.create_time = create_time;
  }

  public Date getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(Date update_time) {
    this.update_time = update_time;
  }
}
