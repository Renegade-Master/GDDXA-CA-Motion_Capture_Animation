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
    public float femurR = 0.0;
    public float femurL = 0.0;
    public float tibiaR = 0.0;
    public float tibiaL = 0.0;
    
    private Table position;    // The current frame
    private Table nextAnim;    // The next frame
    private float scale = 50;  // Increase the size of 
                               // the Player Model for displaying
    
    /**
    *   Constructor uses a set of rows to initally load up
    *   the Animation
    */
    PlayerModel(Table origPos) {
        this.position = new Table();
        this.nextAnim = null;
        
        //  Add Column Headers and Data Types
        this.position.addColumn("Segment",Table.INT);
        this.position.addColumn("xOrigin",Table.FLOAT);
        this.position.addColumn("yOrigin",Table.FLOAT);
        this.position.addColumn("zOrigin",Table.FLOAT);
        this.position.addColumn("xEnd",Table.FLOAT);
        this.position.addColumn("yEnd",Table.FLOAT);
        this.position.addColumn("zEnd",Table.FLOAT);
        
        //  Add (Hopefully) 23 Rows to the Table
        for(TableRow row : origPos.rows()) {
            TableRow r = this.position.addRow();
            r.setInt("Segment",row.getInt(1));
            r.setFloat("xOrigin",row.getFloat(2));
            r.setFloat("yOrigin",row.getFloat(3));
            r.setFloat("zOrigin",row.getFloat(4));
            r.setFloat("xEnd",row.getFloat(5));
            r.setFloat("yEnd",row.getFloat(6));
            r.setFloat("zEnd",row.getFloat(7));
        }
        
        //  Save the Table for debugging purposes - HIGH OVERHEAD
        //saveTable(this.position, "data/initialPlayerPosition.csv");
    }
    
    /**
    *   Disply the current animation frame to the screen
    */
    public void render() {
        strokeWeight(5);
        for(TableRow r : this.position.rows()) {
            stroke(255,255,255);
            
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
    }
    
    /**
    *   Sets the Animation to a new set of points
    */
    public void setNextPosition() {
        if(forwards) {
            // Reset the animation if the end has been reached
            if(prevSensor == 10581.73325) { // 10582.47488 is DEFAULT last SensorID
                prevSensor = 10577.33325;     // 10576.775 is DEFAULT first SensorID
                dataRow = startFrame * 23;
            }
        }
        else {
            // Reset the animation if the end has been reached
            if(prevSensor == 10577.33325) { // 10576.775 is DEFAULT first SensorID
                prevSensor = 10581.73325;     // 10582.47488 is DEFAULT last SensorID
                dataRow = endFrame * 23;
            }
        }
        
        // Reset this Model's position data
        this.nextAnim = new Table();
        this.position.clearRows();        
        
        // Isolate the next frame
        for(TableRow row = moveTable.getRow(dataRow); row.getFloat(0) == prevSensor;) {            
            row = moveTable.getRow(dataRow);
            if(row.getFloat(0) != prevSensor) {
                prevSensor = row.getFloat(0);
                break;
            }
            this.nextAnim.addRow(row);
            
            if(forwards) {
                dataRow++;
            }else {
                dataRow--;
            }
        }
        
        int i;
        if(forwards) {i = 0;}
        else {i = 22;}
        
        // Extract Knee Flexion data rows
        for(TableRow row : this.nextAnim.rows()) {
            switch (i) { 
                case 2:
                    this.loadFlexion(i,row.getFloat(10));
                    break; 
                case 3:
                    this.loadFlexion(i,row.getFloat(10));
                    break; 
                case 7:
                    this.loadFlexion(i,row.getFloat(10));
                    break; 
                case 8:
                    this.loadFlexion(i,row.getFloat(10));
                    break;
            }
            
            // Set this Model position data to next position
            TableRow r = this.position.addRow();
            r.setInt("Segment",row.getInt(1));
            r.setFloat("xOrigin",row.getFloat(2));
            r.setFloat("yOrigin",row.getFloat(3));
            r.setFloat("zOrigin",row.getFloat(4));
            r.setFloat("xEnd",row.getFloat(5));
            r.setFloat("yEnd",row.getFloat(6));
            r.setFloat("zEnd",row.getFloat(7));
            
            // If forwards: proceed to next line; if not: go to previous line
            if(forwards) {i++;}
            else {i--;}
        }
        
        this.nextAnim.clearRows();
    }
    
    /**
    *   Apply the appropriate conversion to the Flexion data before use.
    */
    private void loadFlexion(int i, float u) {
        switch (i) { 
            case 2:
                this.femurR = 180 - u;
                break; 
            case 3:
                this.tibiaR = u;
                break; 
            case 7:
                this.femurL = 180 - u;
                break; 
            case 8:
                this.tibiaL = u;
                break;
        }
    }
    
    /**
    *   Calculate the Left and Right Knee Flexion.
    */
    public float flexion(char side) {
        switch(side) {
            case 'l':
                return(abs(this.femurL - tibiaL));
            case 'r':
                return(abs(this.femurR - tibiaR));
            default:
                println("Please enter only 'l' or 'r' to the 'PlayerModel.flexion(char)' function.");
                return(Float.MAX_VALUE);
        }
    }
    
    /**
    *   Displays all of the points currently in use by the Animation.
    */
    @Override
    public String toString() { 
        StringBuilder sb = new StringBuilder();
        for (TableRow row : this.position.rows()) {
            sb.append("\nSegment: ").append(row.getInt(0));
            sb.append("\nOrigin X: ").append(row.getInt(1));
            sb.append("\nOrigin Y: ").append(row.getInt(2));
            sb.append("\nOrigin Z: ").append(row.getInt(3));
            sb.append("\nEnd X: ").append(row.getInt(4));
            sb.append("\nEnd Y: ").append(row.getInt(5));
            sb.append("\nEnd Z: ").append(row.getInt(6)).append("\n");
        }
        
        return(sb.toString());
    }
}
