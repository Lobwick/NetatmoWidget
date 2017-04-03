using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Attention as Attention;

class Netatmo {

    // Netatmo API
    var access_token = "";
    var refresh_token = "";
    var expires_in = 0;
    var interior_datas = new InteriorDatas();
    var exterior_datas = new ExteriorDatas();
    var rain_datas = new RainDatas();
    var user_preferences = new UserPreferences();

    function getToken(){
        var api = new CallApi(method(:callbackToken));
        var url = "https://api.netatmo.com/oauth2/token";
        var params = {  "client_id" => "58dab29f6b0aff90168c7b5e",
                        "client_secret" => "nULZAxKSTMcksN79fXapr4npH4OAU",
                        "grant_type" => "password",
                        "username" => "lobwick@hotmail.fr",
                        "password" => "dezdezd",
                        "scope" => "read_station"};
                        //{"Content-Type" => Comm.REQUEST_CONTENT_TYPE_URL_ENCODED}
        api.makeRequest(url, params, { :method => Comm.HTTP_REQUEST_METHOD_POST, "Content-Type" => Comm.REQUEST_CONTENT_TYPE_URL_ENCODED});
    }

    function getDatas(){
        var api = new CallApi(method(:callbackDatas));
        var url = "https://api.netatmo.com/api/getstationsdata";
        var params = {  "access_token" => access_token};
        api.makeRequest(url, params, { :method => Comm.HTTP_REQUEST_METHOD_POST, "Content-Type" => Comm.REQUEST_CONTENT_TYPE_URL_ENCODED});
    }



    function callbackDatas(data, responseCode){
        Sys.println("callbackDatas()");
        Sys.println("data : " + data);
        Sys.println("responseCode : " + responseCode);
        Sys.println("test : " + data["body"]["user"]["administrative"]);
        user_preferences.set(data["body"]["user"]["administrative"]);
        interior_datas = new InteriorDatas();
        interior_datas.updateInteriorDatas(data["body"]["devices"][0]["dashboard_data"]);

        var i = 0;

        var modules = data["body"]["devices"][0]["modules"];
        var size = modules.size();
        while (i < size){
            Sys.println("module : " + i + " type = "+modules[i]["type"]);
            if (modules[i]["type"].equals("NAModule1")){
                exterior_datas = new ExteriorDatas();
                exterior_datas.updateExteriorDatas(modules[i]["dashboard_data"]);
            }else if (modules[i]["type"].equals("NAModule3")){
                rain_datas = new RainDatas();
                rain_datas.updateRainDatas(modules[i]["dashboard_data"]);
            }
            i++;
        }
        Ui.requestUpdate();
    }

    function callbackToken(data, responseCode){
        //res = data["access_token"];

        access_token = data["access_token"];
        refresh_token = data["refresh_token"];
        expires_in = data["expires_in"];

        Ui.requestUpdate();
        getDatas();
    }
}