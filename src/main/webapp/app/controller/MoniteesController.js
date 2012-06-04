/*
 * File: app/controller/MoniteesController.js
 *
 * This file was generated by Sencha Architect version 2.0.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 4.0.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 4.0.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('PaaSMonitor.controller.MoniteesController', {
    extend: 'Ext.app.Controller',

    models: [
        'Phym',
        'Vim',
        'AppServer'
    ],
    stores: [
        'Vim',
        'Phym',
        'AppInstance'
    ],
    views: [
        'Monitee.Add',
        'Monitee.Choose'
    ],

    refs: [
        {
            ref: 'moniteesView',
            selector: 'choosemonitee dataview'
        },
        {
            ref: 'moniteeWindow',
            selector: 'addmonitee'
        },
        {
            ref: 'phymForm',
            selector: 'addmonitee phymform'
        },
        {
            ref: 'vimGrid',
            selector: 'addmonitee vimgrid'
        }
    ],

    init: function(application) {
        Ext.create('PaaSMonitor.view.Monitee.Add');
        this.control({
            'choosemonitee dataview': {
                itemclick: this.showAddMoniteeWindow
            },
            '#save_phym_button': {
                click: this.savePhym
            },
            '#save_vim_button': {
                click: this.saveVim
            },
            '#save_selected_vims_button': {
                click: this.saveSelectedVims
            },
            '#save_appserver_button': {
                click: this.saveAppServer
            },
            '#save_selected_app_instances_button': {
                click: this.saveSelectedAppInstances
            }
        });
    },

    showAddMoniteeWindow: function(view,record) {
        var window = this.getMoniteeWindow();
        var index = record.data.index;
        window.layout.setActiveItem(index);
        window.show();
        window.setTitle('Add a New ' + record.data.name);
    },

    saveSelectedVims: function() {
        var grid = this.getVimGrid();
        var selection = grid.getSelectionModel().getSelection();
        var count  = selection.length;
        if (count > 0){
            var loadMask = new Ext.LoadMask(grid.up('window'), {msg:"Loading"});
            loadMask.show();
        }
        var successNum = 0, failNum = 0, added=0, requestCounter = 0;
        var succeed = function(){
            successNum ++;
            added ++;
            if(added == count){
                loadMask.hide();
                Ext.MessageBox.alert('提示', '共添加了'+ count + '个虚拟机，成功：' + successNum +'个，失败：'+ failNum +'个');
                grid.up('window').hide();
            }
        };
        var fail = function(){
            failNum ++;
            added++;
            if(added == count){
                loadMask.hide();
                Ext.MessageBox.alert('提示', '共添加了'+ count + '个虚拟机，成功：' + successNum +'个，失败：'+ failNum +'个');
                grid.up('window').hide();
            }
        };
        for(var i = 0; i < count; i++) {
            requestCounter++;   
            Ext.Ajax.request({
                url: 'vims',
                jsonData: Ext.encode(selection[i].data),
                success: succeed,
                failure: fail
            });
        }

    },

    savePhym: function(button) {
        var form = button.up('form'), window = form.up('window'), values = form.getValues();
        var loadMask = new Ext.LoadMask(window, {msg:"Loading...Please wait..."});
        loadMask.show();
        var record = Ext.ModelManager.create(values, 'PaaSMonitor.model.Phym');
        var vimStore = this.getVimStore();
        record.save({
            success : function(record, operation) {        
                form.getForm().reset();	
                var response = Ext.decode(operation.response.responseText);                 
                var datas = response.data;       
                var reader = vimStore.getProxy().getReader();
                var name = response.message;
                var grid = window.down('grid');
                grid.setTitle('Available Virtual Machines on Phym ' + name);
                vimStore.loadData(reader.readRecords(datas).records);
                window.setTitle('请从下面列表中选择想要监测的虚拟机');                        
                window.layout.setActiveItem('save_vim_panel');
                loadMask.hide();
            },
            failure: function(r, operation){
                loadMask.hide();
                window.hide();       
                Ext.MessageBox.alert('错误', '无法添加物理机');
                //uppanel.layout.setActiveItem('start-panel');
            }
        });
    },

    saveVim: function(button) {
        var form = button.up('form'), window = form.up('window'), values = form.getValues();
        var record = Ext.ModelManager.create(values, 'PaaSMonitor.model.Vim');
        var phym = this.getPhymStore().getById(record.data.phym_id);       
        record.set('phym',phym.data); 
        record.save({
            success : function(record, operation) {        
                form.getForm().reset();	
                Ext.MessageBox.alert('提示', '已成功添加虚拟机！');  
                window.hide();
            },
            failure: function(r, operation){
                window.hide();
                Ext.MessageBox.alert('错误', '无法添加物理机');
                //uppanel.layout.setActiveItem('start-panel');
            }
        });
    },

    saveAppServer: function(button) {
        var form = button.up('form'), window = form.up('window'), values = form.getValues();
        var loadMask = new Ext.LoadMask(window, {msg:"Loading...Please wait..."});
        loadMask.show();
        var record = Ext.ModelManager.create(values, 'PaaSMonitor.model.AppServer');
        var store = this.getAppInstanceStore();
        record.save({
            success : function(record, operation) {        
                form.getForm().reset();	
                var response = Ext.decode(operation.response.responseText);                 
                var datas = response.data;       
                var reader = store.getProxy().getReader();
                var name = response.message;
                var grid = window.down('grid');
                grid.setTitle('Available Application Instances on AppServer ' + name);
                store.loadData(reader.readRecords(datas).records);
                window.setTitle('请从下面列表中选择想要监测的应用实例');                        
                window.layout.setActiveItem('save_app_instances_panel');
                loadMask.hide();        
            },
            failure: function(r, operation){
                window.hide();
                Ext.MessageBox.alert('错误', '无法添加应用服务器');
                //uppanel.layout.setActiveItem('start-panel');
            }
        });
    },

    saveSelectedAppInstances: function(button) {
        var grid = button.up('panel').down('grid');
        var selection = grid.getSelectionModel().getSelection();
        var count  = selection.length;
        if (count > 0){
            var loadMask = new Ext.LoadMask(grid.up('window'), {msg:"Loading"});
            loadMask.show();
        }
        var successNum = 0, failNum = 0, added=0, requestCounter = 0;
        var succeed = function(){
            successNum ++;
            added ++;
            if(added == count){
                loadMask.hide();
                Ext.MessageBox.alert('提示', '共添加了'+ count + '个应用实例，成功：' + successNum +'个，失败：'+ failNum +'个');
                grid.up('window').hide();
            }
        };
        var fail = function(){
            failNum ++;
            added++;
            if(added == count){
                loadMask.hide();
                Ext.MessageBox.alert('提示', '共添加了'+ count + '个应用实例，成功：' + successNum +'个，失败：'+ failNum +'个');
                grid.up('window').hide();
            }
        };
        for(var i = 0; i < count; i++) {
            requestCounter++;   
            Ext.Ajax.request({
                url: 'appinstances',
                jsonData: Ext.encode(selection[i].data),
                success: succeed,
                failure: fail
            });
        }

    }

});
