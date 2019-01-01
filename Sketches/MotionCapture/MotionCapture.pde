/**
*   @author         Ciaran Bent [K00221230]
*   @creationDate   2018/11/27  YYYY/MM/DD
*   @description    ...
*/

/****************\
|  PROGRAM CODE  |
\****************/

import g4p_controls.*;
import peasy.*;

private PeasyCam camera;
private Table moveTable;
private PlayerModel plyr;
private Table newMove;

// Global Variables
private int currFrame = 0;       // 684 Frames in TOTAL;          0 is FIRST;         0 is DEFAULT
private int dataRow = 0;         // 15732 Data Rows in TOTAL;     0 is FIRST;         0 is DEFAULT
private float prevSensor = 0.0;  // 10582.47488 is LAST SensorID; 10576.775 is FIRST; 0 is DEFAULT
private boolean forwards = true;
private float fRate = 30;
private int fStep = 3;
private boolean looping = true;

void setup() {
    size(720, 720, P3D);
    createGUI();
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
    //noLoop();
    frameRate(fRate);
}

void draw() {
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

    textSize(25);
    
    text("CONTROLS", 15, 30);
    //text("DEBUG", width - 170, 30);
    text("CALCULATIONS", 15, height - 210);
    textSize(23.5);
    text("Z Vector Angle", 15, height - 180);
    text("Knee Flexion", 15, height - 80);
    textSize(22);
    text("FPS: " + nf(frameRate, 0, 1), 15, 66);
    
    text("    Femur: " + nf(plyr.femurL, 0, 2) + "° | " + nf(plyr.femurR, 0, 2) + "°\n"
       + "    Tibia  : " + nf(plyr.tibiaL, 0, 2) + "° | " + nf(plyr.tibiaR, 0, 2) + "°"
       , 15, height - 150
    );    
    text("    Left     : " + nf(plyr.flexion('l'), 0, 2) + "°\n"
       + "    Right   : " + nf(plyr.flexion('r'), 0, 2) + "°"
       , 15, height - 50
    );
    //text("Framerate: " + frameRate, width - 170, 60);
    
    text("Current Frame: " + currFrame, width - 220, height - 10);    
    text("Data Row: " + dataRow, width - 220, height - 30);
    
    camera.endHUD();
        
    /****---------------****\
    * Manipulate the shapes *
    \****---------------****/
    
    if(forwards) {
        plyr.setNextPosition(currFrame++);
    }else {
        plyr.setNextPosition(currFrame--);
    }
}

void keyPressed() {    
    switch(keyCode) {
        case 49: // 1
            frameRate(1.0);
            break;
        case 50: // 2
            frameRate(7.5);
            break;
        case 51: // 3
            frameRate(15.0);
            break;
        case 52: // 4
            frameRate(30.0);
            break;
        case 53: // 5
            frameRate(45.0);
            break;
        case 54: // 6
            frameRate(60.0);
            break;
        default:
            println("Key: '" + keyCode + "/" + key + "' is currently not used.");
            break;
    }
}
