/**
*   @author         Ciaran Bent [K00221230]
*   @creationDate   2018/11/27  YYYY/MM/DD
*   @description    This file contains the PlayerModel Class
*                   that I will use to handle my scene
*/

/**********************\
|  PLAYERMODEL OBJECT  |
\**********************/

public class PlayerModel {
    private Table position;
    private Table nextAnim; 
    private float scale = 50;
    
    /**
    *   Constructor uses a set of rows to initally load up the Animation
    */
    PlayerModel(Table origPos) {
        position = new Table();
        
        //  Add Column Headers and Data Types
        position.addColumn("Segment",Table.INT);
        position.addColumn("xOrigin",Table.FLOAT);
        position.addColumn("yOrigin",Table.FLOAT);
        position.addColumn("zOrigin",Table.FLOAT);
        position.addColumn("xEnd",Table.FLOAT);
        position.addColumn("yEnd",Table.FLOAT);
        position.addColumn("zEnd",Table.FLOAT);
        
        //  Add (Hopefully) 23 Rows to the Table
        for(TableRow row : origPos.rows()) {
            TableRow r = position.addRow();
            r.setInt("Segment",row.getInt(1));
            r.setFloat("xOrigin",row.getFloat(2));
            r.setFloat("yOrigin",row.getFloat(3));
            r.setFloat("zOrigin",row.getFloat(4));
            r.setFloat("xEnd",row.getFloat(5));
            r.setFloat("yEnd",row.getFloat(6));
            r.setFloat("zEnd",row.getFloat(7));
        }
        
        //  Save the Table for debugging purposes
        saveTable(position, "data/initialPlayerPosition.csv");
    }
    
    /**
    *   Disply the current animation frame to the screen
    */
    public void render() {
        println("Printing out the Character Model...\n");
        //stroke(random(0, 255),random(0, 255),random(0, 255));
        println("Rows in Plyr Table during Render(): " + this.position.getRowCount());
        //TableRow r1 = this.position.getRow(0);
        //TableRow r2 = this.position.getRow(11);
        //line(r1.getFloat(1) * scale,r1.getFloat(2) * scale,r1.getFloat(3) * scale,
         //    r2.getFloat(4) * scale,r2.getFloat(5) * scale,r2.getFloat(6) * scale);
        
        strokeWeight(5);
        for(TableRow r : this.position.rows()) {
            stroke(255,255,255);
            //stroke(random(0, 255),random(0, 255),random(0, 255));
            line(r.getFloat(1) * scale,r.getFloat(2) * scale,r.getFloat(3) * scale,
                 r.getFloat(4) * scale,r.getFloat(5) * scale,r.getFloat(6) * scale);
            
            stroke(255,0,0);
            translate(r.getFloat(1) * scale,r.getFloat(2) * scale,r.getFloat(3) * scale);
            sphere(1);
            translate(-r.getFloat(1) * scale,-r.getFloat(2) * scale,-r.getFloat(3) * scale);
            translate(r.getFloat(4) * scale,r.getFloat(5) * scale,r.getFloat(6) * scale);
            sphere(1);
            translate(-r.getFloat(4) * scale,-r.getFloat(5) * scale,-r.getFloat(6) * scale);
        }
        //this.readTable(this.position);
    }
    
    /**
    *   Sets the Animation to a new set of points
    */
    public void setNextPosition(int currFrame) {        
        // Create a new table to store the 
        nextAnim = new Table();
        
        println("Rows in Plyr Table: " + this.position.getRowCount());
        
        
        for(TableRow row = moveTable.getRow(currFrame * 23); row.getFloat(0) == prevSensor;) {
            row = moveTable.getRow(segment++);
            if(row.getFloat(0) != prevSensor) {
                prevSensor = row.getFloat(0);
                break;
            }
            nextAnim.addRow(row);
        }
        
        this.position.clearRows();
        println("Rows in next Animation: " + nextAnim.rows());
        int s = 0;
        for(TableRow row : nextAnim.rows()) {
            TableRow r = position.addRow();
            r.setInt("Segment",row.getInt(1));
            r.setFloat("xOrigin",row.getFloat(2));
            r.setFloat("yOrigin",row.getFloat(3));
            r.setFloat("zOrigin",row.getFloat(4));
            r.setFloat("xEnd",row.getFloat(5));
            r.setFloat("yEnd",row.getFloat(6));
            r.setFloat("zEnd",row.getFloat(7));
            s++;
        }
    }
    
    /**
    *   Displays all of the points currently in use by the Animation
    */
    private void readTable(Table table) {    
        for (TableRow row : table.rows()) {
            int segment = row.getInt(0);
            float xOrig = row.getFloat(1);
            float yOrig = row.getFloat(2);
            float zOrig = row.getFloat(3);
            float xEnd = row.getFloat(4);
            float yEnd = row.getFloat(5);
            float zEnd = row.getFloat(6);
                
            println(
                "\nSegment: " + segment
              + "\nOrigin X: " + xOrig
              + "\nOrigin Y: " + yOrig
              + "\nOrigin Z: " + zOrig
              + "\nEnd X: " + xEnd
              + "\nEnd Y: " + yEnd
              + "\nEnd Z: " + zEnd
            );
        }
    }
}

/*
float[][][] newPos =
{ //  Segment * 23
    { //  Origin
        {0,0,0}
    },
    { //  End
        {1,1,1}
    }
    
};
*/
