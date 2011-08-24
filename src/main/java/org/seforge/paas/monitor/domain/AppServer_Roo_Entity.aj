// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.seforge.paas.monitor.domain.AppServer;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AppServer_Roo_Entity {
    
    declare @type: AppServer: @Entity;
    
    @PersistenceContext
    transient EntityManager AppServer.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long AppServer.id;
    
    @Version
    @Column(name = "version")
    private Integer AppServer.version;
    
    public Long AppServer.getId() {
        return this.id;
    }
    
    public void AppServer.setId(Long id) {
        this.id = id;
    }
    
    public Integer AppServer.getVersion() {
        return this.version;
    }
    
    public void AppServer.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void AppServer.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void AppServer.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            AppServer attached = AppServer.findAppServer(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void AppServer.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void AppServer.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public AppServer AppServer.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        AppServer merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager AppServer.entityManager() {
        EntityManager em = new AppServer().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long AppServer.countAppServers() {
        return entityManager().createQuery("SELECT COUNT(o) FROM AppServer o", Long.class).getSingleResult();
    }
    
    public static List<AppServer> AppServer.findAllAppServers() {
        return entityManager().createQuery("SELECT o FROM AppServer o", AppServer.class).getResultList();
    }
    
    public static AppServer AppServer.findAppServer(Long id) {
        if (id == null) return null;
        return entityManager().find(AppServer.class, id);
    }
    
    public static List<AppServer> AppServer.findAppServerEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM AppServer o", AppServer.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
