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
private int strtSeg = 0;
private int endSeg = 22;

void setup(){
    size(1000, 1000, P3D);
    camera = new PeasyCam(this, 0, 0, 0, 2000);
    camera.setSuppressRollRotationMode();
    
    moveTable = loadTable("movement.csv", "header");
    //readTable(moveTable);
    
    newMove = new ArrayList<TableRow>(); 
    while(strtSeg < endSeg) {
        newMove.add(moveTable.getRow(strtSeg++));   
    }
    strtSeg = 0;
    
    plyr = new PlayerModel(newMove);
    
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
