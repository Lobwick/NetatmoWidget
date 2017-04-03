class UserPreferences {
	var unit = 0;
	var windunit = 0;
	var pressureunit = 0;


	function set(data){
		unit = "°C";
		if (data["unit"] == 1){
			unit = "°F";
		}
		windunit = "kph";
		if (data["windunit"] == 1){
			windunit = "mph";
		}else if (data["windunit"] == 2){
			windunit = "ms";
		}else if (data["windunit"] == 3){
			windunit = "beaufort";
		}else if (data["windunit"] == 4){
			windunit = "knot";
		}
		pressureunit = "mbar";
		if (data["pressureunit"] == 1){
			pressureunit = "inHg";
		}else if (data["pressureunit"] == 2){
			pressureunit = "mmHg";
		}
	}

	function initialize(){
		unit = "°C";
		
		windunit = "kph";
		
		pressureunit = "mbar";
		
	}
}