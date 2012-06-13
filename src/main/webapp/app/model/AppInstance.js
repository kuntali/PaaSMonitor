/*
 * File: app/model/AppInstance.js
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

Ext.define('PaaSMonitor.model.AppInstance', {
    extend: 'Ext.data.Model',

    idProperty: 'id',

    fields: [
        {
            name: 'id'
        },
        {
            name: 'name'
        },
        {
            name: 'location'
        },
        {
            name: 'description'
        },
        {
            name: 'appServer'
        },
        {
            name: 'objectName'
        }
    ],

    proxy: {
        type: 'rest',
        url: 'appinstances',
        reader: {
            type: 'json'
        }
    }
});