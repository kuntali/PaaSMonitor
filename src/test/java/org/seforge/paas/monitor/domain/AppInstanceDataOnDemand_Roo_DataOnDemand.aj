// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import java.lang.Boolean;
import java.lang.String;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.seforge.paas.monitor.domain.App;
import org.seforge.paas.monitor.domain.AppDataOnDemand;
import org.seforge.paas.monitor.domain.AppInstance;
import org.seforge.paas.monitor.domain.AppServer;
import org.seforge.paas.monitor.domain.AppServerDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect AppInstanceDataOnDemand_Roo_DataOnDemand {
    
    declare @type: AppInstanceDataOnDemand: @Component;
    
    private Random AppInstanceDataOnDemand.rnd = new SecureRandom();
    
    private List<AppInstance> AppInstanceDataOnDemand.data;
    
    @Autowired
    private AppDataOnDemand AppInstanceDataOnDemand.appDataOnDemand;
    
    @Autowired
    private AppServerDataOnDemand AppInstanceDataOnDemand.appServerDataOnDemand;
    
    public AppInstance AppInstanceDataOnDemand.getNewTransientAppInstance(int index) {
        AppInstance obj = new AppInstance();
        setApp(obj, index);
        setAppServer(obj, index);
        setIsMonitee(obj, index);
        setName(obj, index);
        return obj;
    }
    
    public void AppInstanceDataOnDemand.setApp(AppInstance obj, int index) {
        App app = appDataOnDemand.getRandomApp();
        obj.setApp(app);
    }
    
    public void AppInstanceDataOnDemand.setAppServer(AppInstance obj, int index) {
        AppServer appServer = appServerDataOnDemand.getRandomAppServer();
        obj.setAppServer(appServer);
    }
    
    public void AppInstanceDataOnDemand.setIsMonitee(AppInstance obj, int index) {
        Boolean isMonitee = Boolean.TRUE;
        obj.setIsMonitee(isMonitee);
    }
    
    public void AppInstanceDataOnDemand.setName(AppInstance obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public AppInstance AppInstanceDataOnDemand.getSpecificAppInstance(int index) {
        init();
        if (index < 0) index = 0;
        if (index > (data.size() - 1)) index = data.size() - 1;
        AppInstance obj = data.get(index);
        return AppInstance.findAppInstance(obj.getId());
    }
    
    public AppInstance AppInstanceDataOnDemand.getRandomAppInstance() {
        init();
        AppInstance obj = data.get(rnd.nextInt(data.size()));
        return AppInstance.findAppInstance(obj.getId());
    }
    
    public boolean AppInstanceDataOnDemand.modifyAppInstance(AppInstance obj) {
        return false;
    }
    
    public void AppInstanceDataOnDemand.init() {
        data = AppInstance.findAppInstanceEntries(0, 10);
        if (data == null) throw new IllegalStateException("Find entries implementation for 'AppInstance' illegally returned null");
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<org.seforge.paas.monitor.domain.AppInstance>();
        for (int i = 0; i < 10; i++) {
            AppInstance obj = getNewTransientAppInstance(i);
            try {
                obj.persist();
            } catch (ConstraintViolationException e) {
                StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> it = e.getConstraintViolations().iterator(); it.hasNext();) {
                    ConstraintViolation<?> cv = it.next();
                    msg.append("[").append(cv.getConstraintDescriptor()).append(":").append(cv.getMessage()).append("=").append(cv.getInvalidValue()).append("]");
                }
                throw new RuntimeException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
