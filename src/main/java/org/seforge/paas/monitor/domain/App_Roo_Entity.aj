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
import org.seforge.paas.monitor.domain.App;
import org.springframework.transaction.annotation.Transactional;

privileged aspect App_Roo_Entity {
    
    declare @type: App: @Entity;
    
    @PersistenceContext
    transient EntityManager App.entityManager;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long App.id;
    
    @Version
    @Column(name = "version")
    private Integer App.version;
    
    public Long App.getId() {
        return this.id;
    }
    
    public void App.setId(Long id) {
        this.id = id;
    }
    
    public Integer App.getVersion() {
        return this.version;
    }
    
    public void App.setVersion(Integer version) {
        this.version = version;
    }
    
    @Transactional
    public void App.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void App.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            App attached = App.findApp(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void App.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void App.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public App App.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        App merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
    public static final EntityManager App.entityManager() {
        EntityManager em = new App().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long App.countApps() {
        return entityManager().createQuery("SELECT COUNT(o) FROM App o", Long.class).getSingleResult();
    }
    
    public static List<App> App.findAllApps() {
        return entityManager().createQuery("SELECT o FROM App o", App.class).getResultList();
    }
    
    public static App App.findApp(Long id) {
        if (id == null) return null;
        return entityManager().find(App.class, id);
    }
    
    public static List<App> App.findAppEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM App o", App.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
}
