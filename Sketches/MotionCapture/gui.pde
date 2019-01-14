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

public void sldr_fpsChanged(GSlider source, GEvent event) { //_CODE_:sldr_fpsControl:663526:
    println("sldr_fpsControl - GSlider >> GEvent." + event + " @ " + millis());
    
    camera.setActive(false);
    
    setFPS(sldr_fpsControl.getValueF());
    
} //_CODE_:sldr_fpsControl:663526:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  sldr_fpsControl = new GSlider(this, 210, 40, 300, 40, 8.0);
  sldr_fpsControl.setShowValue(true);
  sldr_fpsControl.setShowLimits(true);
  sldr_fpsControl.setLimits(0.5, 0.0, 1.0);
  sldr_fpsControl.setNbrTicks(15);
  sldr_fpsControl.setStickToTicks(true);
  sldr_fpsControl.setShowTicks(true);
  sldr_fpsControl.setNumberFormat(G4P.DECIMAL, 1);
  sldr_fpsControl.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  sldr_fpsControl.setOpaque(false);
  sldr_fpsControl.addEventHandler(this, "sldr_fpsChanged");
}

// Variable declarations 
// autogenerated do not edit
GSlider sldr_fpsControl; 
