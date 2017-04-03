using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Attention as Attention;

class RainDatas {

	var rain = false;
	var sum_rain_24 = 0.0;
	var sum_rain_1 = 0.0;
	var time = 0;

	function initialize(){
		
	}

	function updateRainDatas(data){
		Sys.println("updateRainDatas()");
		Sys.println(data);

		time = data["time_utc"];
		sum_rain_24 = data["sum_rain_24"];
		sum_rain_1 = data["sum_rain_1"];
		rain = !data["Rain"];
	}
}