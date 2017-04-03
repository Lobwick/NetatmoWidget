
using Toybox.System as Sys;
using Toybox.Communications as Comm;
using Toybox.WatchUi as Ui;

class CallApi extends Ui.BehaviorDelegate {
    var notify;
 
    function initialize(handler) {
        Ui.BehaviorDelegate.initialize();
        notify = handler;
    }

    function makeRequest(url, headers, params) {
        Comm.makeWebRequest(
            url,
            headers,
            params,
            method(:onReceive)
        );
    }
    function makeRequestWithCallBack(url, headers, params) {
        Comm.makeWebRequest(
            url,
            headers,
            params,
            method(:onReceive)
        );
    }

    function setInvokeFunction(handler){
        notify = handler;
    }

    function onReceive(responseCode, data) {
        if (responseCode == 200) {
            notify.invoke(data, responseCode);
        } else {
            notify.invoke("Failed to load\nError: " + responseCode.toString(), responseCode);
        }
    }
}