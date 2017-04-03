using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Attention as Attention;

class InteriorDatas {

	var noise = 0;
	var co = 0;
	var humidity = 0;
	var pressure = 0.0;
	var temperature = 0.0;
	var temp_trend = "stable";
	var date_max_temp = 0;
	var date_min_temp = 0;
	var min_temp = 0.0;
	var max_temp = 0.0;
	var time = 0;

	function initialize(){
		
	}

	function updateInteriorDatas(data){
		Sys.println("updateInteriorDatas()");
		Sys.println(data);
		noise = data["Noise"];
		time = data["time_utc"];
		co = data["CO2"];
		humidity = data["Humidity"];
		pressure = data["AbsolutePressure"];
		temperature = data["Temperature"];
		temp_trend = data["temp_trend"];
		date_max_temp = data["date_max_temp"];
		date_min_temp = data["date_min_temp"];
		min_temp = data["min_temp"];
		max_temp = data["max_temp"];
	}
}