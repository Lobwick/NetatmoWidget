using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Attention as Attention;

class ExteriorDatas {

	var temperature = 0.0;
	var temp_trend = "stable";
	var humidity = 0;
	var date_max_temp = 0;
	var date_min_temp = 0;
	var min_temp = 0.0;
	var max_temp = 0.0;
	var time = 0;

	function initialize(){
		
	}

	function updateExteriorDatas(data){
		Sys.println("updateExteriorDatas()");
		Sys.println(data);

		time = data["time_utc"];
		humidity = data["Humidity"];
		temperature = data["Temperature"];
		temp_trend = data["temp_trend"];
		date_max_temp = data["date_max_temp"];
		date_min_temp = data["date_min_temp"];
		min_temp = data["min_temp"];
		max_temp = data["max_temp"];
	}
}