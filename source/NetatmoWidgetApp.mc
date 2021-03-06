using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Attention as Attention;

var netatmo;

class NetatmoWidgetApp extends App.AppBase {

    // rain
    // indoor
    //  outdoor

    function initialize() {
        AppBase.initialize();
        netatmo = new Netatmo();
    }

    // onStart() is called on application start up
    function onStart(state) {
        //Ui.pushView(new DisplayIndoor(), new DisplayIndoorDelegate(), Ui.SLIDE_IMMEDIATE);
    }

    
    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new NetatmoWidgetView(), new NetatmoWidgetDelegate() ];
    }

}

class NetatmoWidgetDelegate extends Ui.BehaviorDelegate{

    function initialize() {
        BehaviorDelegate.initialize();
    }
    
    function onSelect() {
        Ui.pushView(new DisplayRain(), new DisplayRainDelegate(), Ui.SLIDE_IMMEDIATE);
    }
}