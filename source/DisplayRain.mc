using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Time as Time;
using Toybox.Attention as Attention;


class DisplayRain extends Ui.View {
   

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
    }

    function onShow() {
    }

    function layoutDisplay(dc, title){
        dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
          // display title
        dc.drawText((dc.getWidth() / 2), (dc.getHeight() / 5) -40, Gfx.FONT_SYSTEM_XTINY, title, Gfx.TEXT_JUSTIFY_CENTER);
         dc.drawLine(0, (dc.getHeight() /8) - 5, dc.getWidth(), (dc.getHeight() /8) -5);    
        // draw lines
       
        //
        dc.drawLine(0, (dc.getHeight()  /2)+20, dc.getWidth(), (dc.getHeight()  /2)+20);
        dc.drawLine((dc.getWidth()/2), (dc.getHeight()  /2)+20, (dc.getWidth()/2), (dc.getHeight()  /2)+60);
        dc.drawLine(0, (dc.getHeight()  /2)+60, dc.getWidth(), (dc.getHeight()  /2)+60);

       
    }

    // Update the view
    function onUpdate(dc) {
        Sys.println("DisplayRain();");
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        layoutDisplay(dc, Ui.loadResource(Rez.Strings.Rain));
        //display rain
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        
        var iconWeather;
        Sys.println("test = " + netatmo);
        Sys.println("test = " + netatmo.rain_datas);
        Sys.println("test = " + netatmo.rain_datas.rain);
        if (netatmo.rain_datas.rain == true){
           iconWeather = new Ui.Bitmap({:rezId=>Rez.Drawables.Sun,:locX=>(dc.getWidth() / 2)-30,:locY=>(dc.getHeight() /2)-62});
        }else {
             iconWeather = new Ui.Bitmap({:rezId=>Rez.Drawables.Rain,:locX=>(dc.getWidth() / 2)-30,:locY=>(dc.getHeight() /2)-62});
        }
        iconWeather.draw(dc);    

        //dc.drawText((dc.getWidth() / 2), (dc.getHeight() /2)-50, Gfx.FONT_NUMBER_MEDIUM, netatmo.interior_datas.temperature.format("%.1f")+"°", Gfx.TEXT_JUSTIFY_CENTER);
        //display rain hour
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight() /2)+20, Gfx.FONT_SYSTEM_XTINY, Ui.loadResource(Rez.Strings.Rain)+" 1H", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight() /2)+35, Gfx.FONT_SYSTEM_XTINY, netatmo.rain_datas.sum_rain_1.format("%.2f")+"mm", Gfx.TEXT_JUSTIFY_CENTER);

        // display rain 24h
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight() /2)+20, Gfx.FONT_SYSTEM_XTINY, Ui.loadResource(Rez.Strings.Cumulative), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight() /2)+35, Gfx.FONT_SYSTEM_XTINY, netatmo.rain_datas.sum_rain_24.format("%.2f")+"mm", Gfx.TEXT_JUSTIFY_CENTER);

        //time Updated
       // dc.drawText((dc.getWidth() / 2), (dc.getHeight()  /2)+60, Gfx.FONT_SYSTEM_XTINY, Ui.loadResource(Rez.Strings.Updated), Gfx.TEXT_JUSTIFY_CENTER);
       // dc.drawText((dc.getWidth() / 2), (dc.getHeight()  /2)+80, Gfx.FONT_SYSTEM_XTINY, "12:00", Gfx.TEXT_JUSTIFY_CENTER);
        
       // var m = new Time.Moment({:seconds =>1491244924});
        //var c = Calendar.info(m, Time.FORMAT_MEDIUM);
        //Sys.println(m.toString());
      
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }



}
