// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import org.seforge.paas.monitor.domain.MBeanType;

privileged aspect MBeanType_Roo_Jpa_Entity {
    
    declare @type: MBeanType: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long MBeanType.id;
    
    @Version
    @Column(name = "version")
    private Integer MBeanType.version;
    
    public Long MBeanType.getId() {
        return this.id;
    }
    
    public void MBeanType.setId(Long id) {
        this.id = id;
    }
    
    public Integer MBeanType.getVersion() {
        return this.version;
    }
    
    public void MBeanType.setVersion(Integer version) {
        this.version = version;
    }
    
}
