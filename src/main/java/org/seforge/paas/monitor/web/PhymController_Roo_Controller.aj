// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.seforge.paas.monitor.web;

import java.io.UnsupportedEncodingException;
import java.lang.Integer;
import java.lang.Long;
import java.lang.String;
import java.util.Collection;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.seforge.paas.monitor.domain.Phym;
import org.seforge.paas.monitor.domain.Vim;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect PhymController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST)
    public String PhymController.create(@Valid Phym phym, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("phym", phym);
            return "phyms/create";
        }
        uiModel.asMap().clear();
        phym.persist();
        return "redirect:/phyms/" + encodeUrlPathSegment(phym.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", method = RequestMethod.GET)
    public String PhymController.createForm(Model uiModel) {
        uiModel.addAttribute("phym", new Phym());
        return "phyms/create";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String PhymController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("phym", Phym.findPhym(id));
        uiModel.addAttribute("itemId", id);
        return "phyms/show";
    }
    
    @RequestMapping(method = RequestMethod.GET)
    public String PhymController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            uiModel.addAttribute("phyms", Phym.findPhymEntries(page == null ? 0 : (page.intValue() - 1) * sizeNo, sizeNo));
            float nrOfPages = (float) Phym.countPhyms() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("phyms", Phym.findAllPhyms());
        }
        return "phyms/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT)
    public String PhymController.update(@Valid Phym phym, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            uiModel.addAttribute("phym", phym);
            return "phyms/update";
        }
        uiModel.asMap().clear();
        phym.merge();
        return "redirect:/phyms/" + encodeUrlPathSegment(phym.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", method = RequestMethod.GET)
    public String PhymController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("phym", Phym.findPhym(id));
        return "phyms/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String PhymController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Phym.findPhym(id).remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/phyms";
    }
    
    @ModelAttribute("phyms")
    public Collection<Phym> PhymController.populatePhyms() {
        return Phym.findAllPhyms();
    }
    
    @ModelAttribute("vims")
    public Collection<Vim> PhymController.populateVims() {
        return Vim.findAllVims();
    }
    
    String PhymController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        }
        catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
