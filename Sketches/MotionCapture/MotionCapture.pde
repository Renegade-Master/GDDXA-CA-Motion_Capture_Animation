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

private ArrayList<TableRow> newMove;
private int currFrame = 0;
private int segment = 0;
private float prevSensor = 0.0;

void setup(){
    size(1000, 1000, P3D);
    camera = new PeasyCam(this, 0, 0, 0, 2);
    camera.setSuppressRollRotationMode();
    
    moveTable = loadTable("movement.csv", "header");
    //readTable(moveTable);
    
    newMove = new ArrayList<TableRow>();
    
    prevSensor = moveTable.getRow(0).getFloat(0);
    println(prevSensor);
    for(TableRow row = moveTable.getRow(0); row.getFloat(0) == prevSensor;) {
        row = moveTable.getRow(segment++);
        if(row.getFloat(0) != prevSensor){
            break;
        }
        newMove.add(row);
    }
    
    plyr = new PlayerModel(newMove);
    plyr.render();
    
    loop();
    frameRate(60);
}

void draw(){
    //  Reset Animation back to start if end is reached
    if(currFrame == 684){
       currFrame = 0; 
    }
    
    fill(255);
    
    // Manipulate the shapes
    //plyr.setNewPosition(moveTable.getRow(currFrame++));
    
    background(0);
    
    // Draw the Shapes
    plyr.render();
    
    //  Draw the HUD
    camera.beginHUD();
    
    fill(255);
    textSize(22);
    
    text("Current Frame: " + currFrame, width - 220, height - 10);
    
    camera.endHUD();
}
