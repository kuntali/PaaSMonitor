// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.seforge.paas.monitor.domain.PhymDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect PhymIntegrationTest_Roo_IntegrationTest {
    
    declare @type: PhymIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: PhymIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: PhymIntegrationTest: @Transactional;
    
    @Autowired
    private PhymDataOnDemand PhymIntegrationTest.dod;
    
    @Test
    public void PhymIntegrationTest.testCountPhyms() {
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", dod.getRandomPhym());
        long count = org.seforge.paas.monitor.domain.Phym.countPhyms();
        org.junit.Assert.assertTrue("Counter for 'Phym' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void PhymIntegrationTest.testFindPhym() {
        org.seforge.paas.monitor.domain.Phym obj = dod.getRandomPhym();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.Phym.findPhym(id);
        org.junit.Assert.assertNotNull("Find method for 'Phym' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Phym' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void PhymIntegrationTest.testFindAllPhyms() {
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", dod.getRandomPhym());
        long count = org.seforge.paas.monitor.domain.Phym.countPhyms();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Phym', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.seforge.paas.monitor.domain.Phym> result = org.seforge.paas.monitor.domain.Phym.findAllPhyms();
        org.junit.Assert.assertNotNull("Find all method for 'Phym' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Phym' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void PhymIntegrationTest.testFindPhymEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", dod.getRandomPhym());
        long count = org.seforge.paas.monitor.domain.Phym.countPhyms();
        if (count > 20) count = 20;
        java.util.List<org.seforge.paas.monitor.domain.Phym> result = org.seforge.paas.monitor.domain.Phym.findPhymEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Phym' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Phym' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void PhymIntegrationTest.testFlush() {
        org.seforge.paas.monitor.domain.Phym obj = dod.getRandomPhym();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.Phym.findPhym(id);
        org.junit.Assert.assertNotNull("Find method for 'Phym' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyPhym(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Phym' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PhymIntegrationTest.testMerge() {
        org.seforge.paas.monitor.domain.Phym obj = dod.getRandomPhym();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.Phym.findPhym(id);
        boolean modified =  dod.modifyPhym(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.seforge.paas.monitor.domain.Phym merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Phym' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void PhymIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", dod.getRandomPhym());
        org.seforge.paas.monitor.domain.Phym obj = dod.getNewTransientPhym(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Phym' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Phym' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void PhymIntegrationTest.testRemove() {
        org.seforge.paas.monitor.domain.Phym obj = dod.getRandomPhym();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Phym' failed to provide an identifier", id);
        obj = org.seforge.paas.monitor.domain.Phym.findPhym(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Phym' with identifier '" + id + "'", org.seforge.paas.monitor.domain.Phym.findPhym(id));
    }
    
}
