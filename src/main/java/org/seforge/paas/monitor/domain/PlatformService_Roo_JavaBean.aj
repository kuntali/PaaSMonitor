// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import org.seforge.paas.monitor.domain.PlatformService;
import org.seforge.paas.monitor.domain.Vim;

privileged aspect PlatformService_Roo_JavaBean {
    
    public String PlatformService.getIp() {
        return this.ip;
    }
    
    public void PlatformService.setIp(String ip) {
        this.ip = ip;
    }
    
    public String PlatformService.getPort() {
        return this.port;
    }
    
    public void PlatformService.setPort(String port) {
        this.port = port;
    }
    
    public Vim PlatformService.getVim() {
        return this.vim;
    }
    
    public void PlatformService.setVim(Vim vim) {
        this.vim = vim;
    }
    
}
