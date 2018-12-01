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
private Table moveTable;

void setup(){
    size(1000, 1000, P3D);
    camera = new PeasyCam(this, 0, 0, 0, 2000);
    camera.setSuppressRollRotationMode();
    
    moveTable = loadTable("movement.csv", "header");

    println(moveTable.getRowCount() + " total rows in table"); 

    for (TableRow row : moveTable.rows()) {
    
        float id = row.getFloat("Sensor ID");
        int segment = row.getInt("segment number");
        float xOrig = row.getFloat("Xorig");
        float yOrig = row.getFloat("Yorig");
        float zOrig = row.getFloat("Zorig");
        float xEnd = row.getFloat("Xend");
        float yEnd = row.getFloat("Yend");
        float zEnd = row.getFloat("Zend");
        float xVect = row.getFloat("Z Vector X Rel Angle");
        float yVect = row.getFloat("Z Vector Y Rel Angle");
        float zVect = row.getFloat("Z Vector Z Rel Angle");
        
        /*    
        println(
            "\nID: " + id
          + "\nSegment: " + segment
          + "\nOrigin X: " + xOrig
          + "\nOrigin Y: " + yOrig
          + "\nOrigin Z: " + zOrig
          + "\nEnd X: " + xEnd
          + "\nEnd Y: " + yEnd
          + "\nEnd Z: " + zEnd
          + "\nZ Vector X Rel Angle: " + xVect 
          + "\nZ Vector Y Rel Angle: " + yVect
          + "\nZ Vector Z Rel Angle: " + zVect
        );
        */
    }
    
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
