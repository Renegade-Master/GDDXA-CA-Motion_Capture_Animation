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
private PlayerModel plyr;

private Table newMove;
private int currFrame = 0; // 684 Frames in total
private int segment = 0;   // 23 segments in each frame
private float prevSensor = 0.0;

void setup(){
    size(720, 720, P3D);
    camera = new PeasyCam(this, -25, 0, 50, 150);
    camera.rotateX(1.6);
    camera.rotateY(-0.2);
    camera.rotateZ(-3.0);
    camera.setSuppressRollRotationMode();
    
    // Load the table with the .csv file
    moveTable = loadTable("movement.csv", "header");
    
    newMove = new Table();
    
    // Extract first SensorID
    prevSensor = moveTable.getRow(0).getFloat(0);
    
    // Add all rows that are assigned to the same SensorID
    for(TableRow row = moveTable.getRow(0); row.getFloat(0) == prevSensor;) {
        row = moveTable.getRow(segment++);
        if(row.getFloat(0) != prevSensor){
            prevSensor = row.getFloat(0);
            break;
        }
        newMove.addRow(row);
    }
    
    // Init the Player obj with the first frame
    plyr = new PlayerModel(newMove);
    
    smooth();
    loop();
    frameRate(120);
}

void draw(){
    //  Reset Animation back to start if end is reached
    if(currFrame == 683){
       currFrame = 0;
       segment = 0;
    }
    
    fill(255);
    /****               ****\
    * Manipulate the shapes *
    \****               ****/
    
    plyr.setNextPosition(currFrame++);
    
    background(0);
    
    /****         ****\
    * Draw the shapes *
    \****         ****/
    
    plyr.render();
    
    /****      ****\
    * Draw the HUD *
    \****      ****/
    
    camera.beginHUD();
    
    fill(255);
    textSize(22);
    
    text("Current Frame: " + (currFrame - 1), width - 220, height - 10);
    
    text("Segment: " + segment, width - 220, height - 30);
    
    camera.endHUD();
}
