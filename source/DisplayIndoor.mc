using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Attention as Attention;


class DisplayIndoor extends Ui.View {
//var netatmo;
   

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
       // setLayout(Rez.Layouts.MainLayout(dc));
       //getToken();
      // netatmo = new Netatmo();
       //netatmo.getToken();
//Sys.println("onLayout");
        
    
    }

    

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() {
    }

    function layoutDisplay(dc, title){
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
        // display title
        dc.drawText((dc.getWidth() / 2), (dc.getHeight() / 5) -40, Gfx.FONT_SYSTEM_XTINY, title, Gfx.TEXT_JUSTIFY_CENTER);
        // draw lines
        dc.drawLine(0, (dc.getHeight() /8) - 5, dc.getWidth(), (dc.getHeight() /8) -5);
        dc.drawLine((dc.getWidth() / 2), (dc.getHeight() /8) - 5, dc.getWidth()/2, (dc.getHeight()  /4)+10);
        dc.drawLine(0, (dc.getHeight()  /4)+10, dc.getWidth(), (dc.getHeight()  /4)+10);
        dc.drawLine(0, (dc.getHeight()  /4)*3+10, dc.getWidth(), (dc.getHeight()  /4)*3+10);

    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        layoutDisplay(dc, Ui.loadResource(Rez.Strings.Indoor));
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        
        //display C02
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight() /10), Gfx.FONT_SYSTEM_XTINY, "CO2", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight()  /10)+15, Gfx.FONT_SYSTEM_XTINY, netatmo.interior_datas.co.format("%d")+"ppm", Gfx.TEXT_JUSTIFY_CENTER);
        //display pressure
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight() /10), Gfx.FONT_SYSTEM_XTINY, Ui.loadResource(Rez.Strings.Pressure), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight()  /10)+15, Gfx.FONT_SYSTEM_XTINY, netatmo.interior_datas.co.format("%.1f")+netatmo.user_preferences.pressureunit, Gfx.TEXT_JUSTIFY_CENTER);

        //display temp
        var iconTemp = null;
        if (netatmo.exterior_datas.temp_trend.equals("stable")){
            iconTemp = new Ui.Bitmap({:rezId=>Rez.Drawables.Stable,:locX=>(dc.getWidth() / 2)-80,:locY=>(dc.getHeight() /2)-30});
        }else if (netatmo.exterior_datas.temp_trend.equals("up")){
            iconTemp = new Ui.Bitmap({:rezId=>Rez.Drawables.Up,:locX=>(dc.getWidth() / 2)-80,:locY=>(dc.getHeight() /2)-30});
        }else if (netatmo.exterior_datas.temp_trend.equals("down")){
            iconTemp = new Ui.Bitmap({:rezId=>Rez.Drawables.Down,:locX=>(dc.getWidth() / 2)-80,:locY=>(dc.getHeight() /2)-30});
        }
        iconTemp.draw(dc);
        dc.drawText((dc.getWidth() / 2), (dc.getHeight() /2)-18, Gfx.FONT_NUMBER_MEDIUM, netatmo.interior_datas.temperature.format("%.1f"), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 2)+50, (dc.getHeight() /2)-16, Gfx.FONT_SYSTEM_LARGE, netatmo.user_preferences.unit, Gfx.TEXT_JUSTIFY_CENTER);

        dc.drawText((dc.getWidth() / 2), (dc.getHeight()  /4)*3-10, Gfx.FONT_SYSTEM_XTINY, "Max : "+netatmo.interior_datas.max_temp.format("%.1f") + netatmo.user_preferences.unit + " Min : " + netatmo.interior_datas.min_temp.format("%.1f") + netatmo.user_preferences.unit, Gfx.TEXT_JUSTIFY_CENTER);
        //display humidity
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight()  /4)*3+10, Gfx.FONT_SYSTEM_XTINY, Ui.loadResource(Rez.Strings.Humidity), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight()  /4)*3+25, Gfx.FONT_SYSTEM_XTINY, netatmo.interior_datas.humidity.format("%d")+"%", Gfx.TEXT_JUSTIFY_CENTER);

        //display noise
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight()  /4)*3+10, Gfx.FONT_SYSTEM_XTINY, Ui.loadResource(Rez.Strings.Noise), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight()  /4)*3+25, Gfx.FONT_SYSTEM_XTINY, netatmo.interior_datas.noise.format("%d")+"db", Gfx.TEXT_JUSTIFY_CENTER);

       // dc.drawLine(0, (dc.getHeight()  /4)*3+50, dc.getWidth(), (dc.getHeight()  /4)*3+50);
        dc.drawLine((dc.getWidth() / 2), (dc.getHeight()  /4)*3+10, dc.getWidth()/2, (dc.getHeight() ));
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }



}
