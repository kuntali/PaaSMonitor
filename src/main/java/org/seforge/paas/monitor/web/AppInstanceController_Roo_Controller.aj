// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.seforge.paas.monitor.domain.App;
import org.seforge.paas.monitor.domain.AppInstance;
import org.seforge.paas.monitor.domain.AppInstanceSnap;
import org.seforge.paas.monitor.domain.AppServer;
import org.seforge.paas.monitor.web.AppInstanceController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AppInstanceController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AppInstanceController.create(@Valid AppInstance appInstance, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, appInstance);
            return "appinstances/create";
        }
        uiModel.asMap().clear();
        appInstance.persist();
        return "redirect:/appinstances/" + encodeUrlPathSegment(appInstance.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AppInstanceController.createForm(Model uiModel) {
        populateEditForm(uiModel, new AppInstance());
        return "appinstances/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AppInstanceController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("appinstance", AppInstance.findAppInstance(id));
        uiModel.addAttribute("itemId", id);
        return "appinstances/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AppInstanceController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("appinstances", AppInstance.findAppInstanceEntries(firstResult, sizeNo));
            float nrOfPages = (float) AppInstance.countAppInstances() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("appinstances", AppInstance.findAllAppInstances());
        }
        return "appinstances/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AppInstanceController.update(@Valid AppInstance appInstance, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, appInstance);
            return "appinstances/update";
        }
        uiModel.asMap().clear();
        appInstance.merge();
        return "redirect:/appinstances/" + encodeUrlPathSegment(appInstance.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AppInstanceController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, AppInstance.findAppInstance(id));
        return "appinstances/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AppInstanceController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        AppInstance appInstance = AppInstance.findAppInstance(id);
        appInstance.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/appinstances";
    }
    
    void AppInstanceController.populateEditForm(Model uiModel, AppInstance appInstance) {
        uiModel.addAttribute("appInstance", appInstance);
        uiModel.addAttribute("apps", App.findAllApps());
        uiModel.addAttribute("appinstancesnaps", AppInstanceSnap.findAllAppInstanceSnaps());
        uiModel.addAttribute("appservers", AppServer.findAllAppServers());
    }
    
    String AppInstanceController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
