/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void speedUp(GButton source, GEvent event) { //_CODE_:btn_speedUp:836498:
  println("btn_speedUp - GButton >> GEvent." + event + " @ " + millis());
  
  if(fStep <= 5) {
        fStep++;
        switch(fStep) {
            case 0: // 1
                frameRate(1.0);
                break;
            case 1: // 2
                frameRate(7.5);
                break;
            case 2: // 3
                frameRate(15.0);
                break;
            case 3: // 4
                frameRate(30.0);
                break;
            case 4: // 5
                frameRate(45.0);
                break;
            case 5: // 6
                frameRate(60.0);
                break;
            default:
                println("Key: '" + keyCode + "/" + key + "' is currently not used.");
                break;
        }
    } else {
        fStep = 5;
    }
} //_CODE_:btn_speedUp:836498:

public void speedDown(GButton source, GEvent event) { //_CODE_:btn_speedDown:546327:
    println("btn_speedDown - GButton >> GEvent." + event + " @ " + millis());
  
    if(fStep >= 0) {
        fStep--;  
        switch(fStep) {
            case 0: // 1
                frameRate(1.0);
                break;
            case 1: // 2
                frameRate(7.5);
                break;
            case 2: // 3
                frameRate(15.0);
                break;
            case 3: // 4
                frameRate(30.0);
                break;
            case 4: // 5
                frameRate(45.0);
                break;
            case 5: // 6
                frameRate(60.0);
                break;
            default:
                println("Key: '" + keyCode + "/" + key + "' is currently not used.");
                break;
        }
    } else {
        fStep = 0;
    }
} //_CODE_:btn_speedDown:546327:

public void pauseAni(GButton source, GEvent event) { //_CODE_:btn_pause:553315:
  println("btn_pause - GButton >> GEvent." + event + " @ " + millis());
  
  if(looping) {
      looping = !looping;
      btn_pause.setIcon("icons\\media-playback-pause-symbolic.symbolic.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
      noLoop();
  } else {
      looping = !looping;
      btn_pause.setIcon("icons\\media-playback-start-symbolic.symbolic.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
      loop();
  }
} //_CODE_:btn_pause:553315:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  btn_speedUp = new GButton(this, 240, 40, 40, 40);
  btn_speedUp.setIcon("media-seek-forward-symbolic.symbolic.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  btn_speedUp.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  btn_speedUp.addEventHandler(this, "speedUp");
  btn_speedDown = new GButton(this, 140, 40, 40, 40);
  btn_speedDown.setIcon("media-seek-forward-symbolic-rtl.symbolic.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  btn_speedDown.setLocalColorScheme(GCScheme.RED_SCHEME);
  btn_speedDown.addEventHandler(this, "speedDown");
  btn_pause = new GButton(this, 190, 40, 40, 40);
  btn_pause.setIcon("media-playback-start-symbolic.symbolic.png", 1, GAlign.NORTH, GAlign.CENTER, GAlign.MIDDLE);
  btn_pause.addEventHandler(this, "pauseAni");
}

// Variable declarations 
// autogenerated do not edit
GButton btn_speedUp; 
GButton btn_speedDown; 
GButton btn_pause; 
