using Toybox.WatchUi as Ui;
using Toybox.Communications as Comm;

using Toybox.Time as Time;
using Toybox.System as Sys;
using Toybox.Graphics as Gfx;
using Toybox.Application as App;
using Toybox.Time.Gregorian as Calendar;
using Toybox.Attention as Attention;


class DisplayOutdoor extends Ui.View {
//var netatmo;
   

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
       // setLayout(Rez.Layouts.MainLayout(dc));
       //getToken();
      // netatmo = new Netatmo();
//       netatmo.getToken();


        
    
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
        dc.drawLine(0, (dc.getHeight() /8) - 5, dc.getWidth(), (dc.getHeight() /8) -5);    
        // draw lines
        
        dc.drawLine(0, (dc.getHeight()  /2)+20, dc.getWidth(), (dc.getHeight()  /2)+20);
        dc.drawLine((dc.getWidth()/2), (dc.getHeight()  /2)+20, (dc.getWidth()/2), (dc.getHeight() ));
       
    }

    // Update the view
    function onUpdate(dc) {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        layoutDisplay(dc, Ui.loadResource(Rez.Strings.Outdoor));
        //display temp exterior_datas
        dc.setColor(Gfx.COLOR_BLUE, Gfx.COLOR_TRANSPARENT);
        
        
        var iconTemp = null;
        if (netatmo.exterior_datas.temp_trend.equals("stable")){
            iconTemp = new Ui.Bitmap({:rezId=>Rez.Drawables.Stable,:locX=>(dc.getWidth() / 2)-75,:locY=>(dc.getHeight() /2)-60});
        }else if (netatmo.exterior_datas.temp_trend.equals("up")){
            iconTemp = new Ui.Bitmap({:rezId=>Rez.Drawables.Up,:locX=>(dc.getWidth() / 2)-75,:locY=>(dc.getHeight() /2)-60});
        }else if (netatmo.exterior_datas.temp_trend.equals("down")){
            iconTemp = new Ui.Bitmap({:rezId=>Rez.Drawables.Down,:locX=>(dc.getWidth() / 2)-75,:locY=>(dc.getHeight() /2)-60});
        }
        iconTemp.draw(dc);
       

        dc.drawText((dc.getWidth() / 2)+10, (dc.getHeight() /2)-50, Gfx.FONT_NUMBER_MEDIUM, netatmo.exterior_datas.temperature.format("%.1f"), Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 2)+60, (dc.getHeight() /2)-48, Gfx.FONT_SYSTEM_LARGE, netatmo.user_preferences.unit, Gfx.TEXT_JUSTIFY_CENTER);
        
        //display temp exterior_datas min
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight() /2)+20, Gfx.FONT_SYSTEM_XTINY, "Min", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)-10, (dc.getHeight() /2)+35, Gfx.FONT_SYSTEM_XTINY, netatmo.exterior_datas.min_temp.format("%.2f")+"°", Gfx.TEXT_JUSTIFY_CENTER);

        // display temp exterior_datas max
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight() /2)+20, Gfx.FONT_SYSTEM_XTINY, "Max", Gfx.TEXT_JUSTIFY_CENTER);
        dc.drawText((dc.getWidth() / 3)*2+10, (dc.getHeight() /2)+35, Gfx.FONT_SYSTEM_XTINY, netatmo.exterior_datas.min_temp.format("%.2f")+"°", Gfx.TEXT_JUSTIFY_CENTER);

      
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() {
    }



}
