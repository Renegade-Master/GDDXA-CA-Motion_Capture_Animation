/**
*   @author         Ciaran Bent [K00221230]
*   @creationDate   2018/11/27  YYYY/MM/DD
*   @description    ...
*/

/****************\
|  PROGRAM CODE  |
\****************/

import peasy.*;

private PeasyCam camera;

void setup(){
    size(1000, 1000, P3D);
    camera = new PeasyCam(this, 0, 0, 0, 2000);
    camera.setSuppressRollRotationMode();
    
    loop();
    frameRate(60);
}

void draw(){
    fill(255);
    
    // Manipulate the shapes
    
    
    background(0);
    
    // Draw the Shapes
    
    
    //  Draw the HUD
    camera.beginHUD();
    
    camera.endHUD();
}
