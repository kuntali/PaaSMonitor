// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;
import org.seforge.paas.monitor.domain.AppServerSnap;

privileged aspect AppServerSnap_Roo_Jpa_Entity {
    
    declare @type: AppServerSnap: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long AppServerSnap.id;
    
    @Version
    @Column(name = "version")
    private Integer AppServerSnap.version;
    
    public Long AppServerSnap.getId() {
        return this.id;
    }
    
    public void AppServerSnap.setId(Long id) {
        this.id = id;
    }
    
    public Integer AppServerSnap.getVersion() {
        return this.version;
    }
    
    public void AppServerSnap.setVersion(Integer version) {
        this.version = version;
    }
    
}
