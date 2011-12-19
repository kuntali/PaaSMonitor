// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.domain;

import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.seforge.paas.monitor.domain.Vim;
import org.seforge.paas.monitor.domain.VimDataOnDemand;
import org.seforge.paas.monitor.domain.VimIntegrationTest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect VimIntegrationTest_Roo_IntegrationTest {
    
    declare @type: VimIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: VimIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: VimIntegrationTest: @Transactional;
    
    @Autowired
    private VimDataOnDemand VimIntegrationTest.dod;
    
    @Test
    public void VimIntegrationTest.testCountVims() {
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", dod.getRandomVim());
        long count = Vim.countVims();
        Assert.assertTrue("Counter for 'Vim' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void VimIntegrationTest.testFindVim() {
        Vim obj = dod.getRandomVim();
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Vim' failed to provide an identifier", id);
        obj = Vim.findVim(id);
        Assert.assertNotNull("Find method for 'Vim' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Vim' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void VimIntegrationTest.testFindAllVims() {
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", dod.getRandomVim());
        long count = Vim.countVims();
        Assert.assertTrue("Too expensive to perform a find all test for 'Vim', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Vim> result = Vim.findAllVims();
        Assert.assertNotNull("Find all method for 'Vim' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Vim' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void VimIntegrationTest.testFindVimEntries() {
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", dod.getRandomVim());
        long count = Vim.countVims();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Vim> result = Vim.findVimEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Vim' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Vim' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void VimIntegrationTest.testFlush() {
        Vim obj = dod.getRandomVim();
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Vim' failed to provide an identifier", id);
        obj = Vim.findVim(id);
        Assert.assertNotNull("Find method for 'Vim' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyVim(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'Vim' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VimIntegrationTest.testMergeUpdate() {
        Vim obj = dod.getRandomVim();
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Vim' failed to provide an identifier", id);
        obj = Vim.findVim(id);
        boolean modified =  dod.modifyVim(obj);
        Integer currentVersion = obj.getVersion();
        Vim merged = obj.merge();
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'Vim' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void VimIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", dod.getRandomVim());
        Vim obj = dod.getNewTransientVim(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Vim' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Vim' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Vim' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void VimIntegrationTest.testRemove() {
        Vim obj = dod.getRandomVim();
        Assert.assertNotNull("Data on demand for 'Vim' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Vim' failed to provide an identifier", id);
        obj = Vim.findVim(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Vim' with identifier '" + id + "'", Vim.findVim(id));
    }
    
}
