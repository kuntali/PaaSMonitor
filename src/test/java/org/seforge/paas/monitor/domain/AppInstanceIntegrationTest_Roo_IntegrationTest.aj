// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seforge.paas.monitor.domain.AppInstanceDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect AppInstanceIntegrationTest_Roo_IntegrationTest {
    
    declare @type: AppInstanceIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: AppInstanceIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: AppInstanceIntegrationTest: @Transactional;
    
    @Autowired
    private AppInstanceDataOnDemand AppInstanceIntegrationTest.dod;
    
    @Test
    public void AppInstanceIntegrationTest.testCountAppInstances() {
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", dod.getRandomAppInstance());
        long count = org.seforge.paas.monitor.domain.AppInstance.countAppInstances();
        org.junit.Assert.assertTrue("Counter for 'AppInstance' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void AppInstanceIntegrationTest.testFindAppInstance() {
        org.seforge.paas.monitor.domain.AppInstance obj = dod.getRandomAppInstance();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.AppInstance.findAppInstance(id);
        org.junit.Assert.assertNotNull("Find method for 'AppInstance' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'AppInstance' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void AppInstanceIntegrationTest.testFindAllAppInstances() {
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", dod.getRandomAppInstance());
        long count = org.seforge.paas.monitor.domain.AppInstance.countAppInstances();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'AppInstance', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.seforge.paas.monitor.domain.AppInstance> result = org.seforge.paas.monitor.domain.AppInstance.findAllAppInstances();
        org.junit.Assert.assertNotNull("Find all method for 'AppInstance' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'AppInstance' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void AppInstanceIntegrationTest.testFindAppInstanceEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", dod.getRandomAppInstance());
        long count = org.seforge.paas.monitor.domain.AppInstance.countAppInstances();
        if (count > 20) count = 20;
        java.util.List<org.seforge.paas.monitor.domain.AppInstance> result = org.seforge.paas.monitor.domain.AppInstance.findAppInstanceEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'AppInstance' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'AppInstance' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void AppInstanceIntegrationTest.testFlush() {
        org.seforge.paas.monitor.domain.AppInstance obj = dod.getRandomAppInstance();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.AppInstance.findAppInstance(id);
        org.junit.Assert.assertNotNull("Find method for 'AppInstance' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyAppInstance(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'AppInstance' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AppInstanceIntegrationTest.testMerge() {
        org.seforge.paas.monitor.domain.AppInstance obj = dod.getRandomAppInstance();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.AppInstance.findAppInstance(id);
        boolean modified =  dod.modifyAppInstance(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.seforge.paas.monitor.domain.AppInstance merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'AppInstance' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void AppInstanceIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", dod.getRandomAppInstance());
        org.seforge.paas.monitor.domain.AppInstance obj = dod.getNewTransientAppInstance(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'AppInstance' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'AppInstance' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void AppInstanceIntegrationTest.testRemove() {
        org.seforge.paas.monitor.domain.AppInstance obj = dod.getRandomAppInstance();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'AppInstance' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.AppInstance.findAppInstance(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'AppInstance' with identifier '" + id + "'", org.seforge.paas.monitor.domain.AppInstance.findAppInstance(id));
    }
    
}
