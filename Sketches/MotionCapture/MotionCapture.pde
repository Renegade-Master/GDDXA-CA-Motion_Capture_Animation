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
private int currFrame = 66; // 684 frames in total; 0 is DEFAULT
private int dataRow = 1519;   // 15732 rows in total; 0 is DEFAULT
private float prevSensor = 0.0;

void setup() {
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
    prevSensor = moveTable.getRow(dataRow).getFloat(0);
    
    // Add all rows that are assigned to the same SensorID
    for(TableRow row = moveTable.getRow(0); row.getFloat(0) == prevSensor;) {
        row = moveTable.getRow(dataRow++);
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
    if(currFrame == 594){ // 683 is DEFAULT last frame
       currFrame = 66;    // 0 is DEFAULT first frame
    }
    
    fill(255);
    
    background(0);
    
    /****---------****\
    * Draw the shapes *
    \****---------****/
    
    plyr.render();
    
    /****------****\
    * Draw the HUD *
    \****------****/
    
    camera.beginHUD();
    
    fill(255);
    textSize(22);
    
    text("Current Frame: " + (currFrame), width - 220, height - 10);
    
    text("Data Row: " + dataRow, width - 220, height - 30);
    
    camera.endHUD();
        
    /****---------------****\
    * Manipulate the shapes *
    \****---------------****/
    
    plyr.setNextPosition(currFrame++);
}
