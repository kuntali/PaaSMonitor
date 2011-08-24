Ext.define('PaaSMonitor.store.Vims', {
    extend: 'Ext.data.Store',
    model: 'PaaSMonitor.model.Vim',    
    proxy: {
        type: 'rest',
        url: 'vims',
        headers: {
        	'Accept': 'application/json'
        },        
        reader: {
            type: 'json',
            root: 'data',
            successProperty: 'success'
        }
    }
});