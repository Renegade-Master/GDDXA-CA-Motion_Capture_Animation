/**
*   @author         Ciaran Bent [K00221230]
*   @creationDate   2018/11/27  YYYY/MM/DD
*   @description    ...
*/

/****************\
|  PROGRAM CODE  |
\****************/

import controlP5.*;
import peasy.*;

private ControlP5 gui;
private PeasyCam camera;
private Table moveTable;
private PlayerModel plyr;
private Table newMove;

// Global Variables
private int currFrame = 0;       // 684 Frames in TOTAL;          0 is FIRST;         0 is DEFAULT
private int dataRow = 0;         // 15732 Data Rows in TOTAL;     0 is FIRST;         0 is DEFAULT
private float prevSensor = 0.0;  // 10582.47488 is LAST SensorID; 10576.775 is FIRST; 0 is DEFAULT

// User Interface buttons
private Toggle tgl_pause;

void setup() {
    size(720, 720, P3D);
    gui = new ControlP5(this);
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
    
    // Create the Graphical User Interface
    //tgl_pause = new Toggle(gui,null,"tgl_pause",0.0,0.0,0.0,20,20);
    //gui.addToggle("tgl_pause",0.0,0.0,20,20);
    gui.addToggle("toggleValue")
        .setPosition(40,100)
        .setSize(50,20);
    
    
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
    
    //tgl_pause.draw(null);
        
    textSize(22);    
    text("Current Frame: " + (currFrame), width - 220, height - 10);    
    text("Data Row: " + dataRow, width - 220, height - 30);
    
    camera.endHUD();
        
    /****---------------****\
    * Manipulate the shapes *
    \****---------------****/
    
    plyr.setNextPosition(currFrame++);
}
/*
void mousePressed() { 
    noLoop();
} 

void mouseReleased() { 
    loop();
}*/
