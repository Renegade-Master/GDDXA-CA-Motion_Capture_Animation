/**
*   @author         Ciaran Bent [K00221230]
*   @creationDate   2018/11/27  YYYY/MM/DD
*   @description    This file contains the PlayerModel Class that I will use to handle my scene
*/

/**********************\
|  PLAYERMODEL OBJECT  |
\**********************/

public class PlayerModel {
    private Table position;
    
    /**
    *   Constructor uses a set of rows to initally load up the Animation
    */
    PlayerModel(ArrayList<TableRow> origPos) {
        position = new Table();
        position.addColumn("Segment",Table.INT);
        position.addColumn("xOrigin",Table.FLOAT);
        position.addColumn("yOrigin",Table.FLOAT);
        position.addColumn("zOrigin",Table.FLOAT);
        position.addColumn("xEnd",Table.FLOAT);
        position.addColumn("yEnd",Table.FLOAT);
        position.addColumn("zEnd",Table.FLOAT);
        
        for(TableRow row : origPos) {
            TableRow r = position.addRow();
            r.setInt("Segment",row.getInt(1));
            r.setFloat("xOrigin",row.getFloat(2));
            r.setFloat("yOrigin",row.getFloat(3));
            r.setFloat("zOrigin",row.getFloat(4));
            r.setFloat("xEnd",row.getFloat(5));
            r.setFloat("yEnd",row.getFloat(6));
            r.setFloat("zEnd",row.getFloat(7));
        }
    }
    
    /**
    *   Disply the current animation frame to the screen
    */
    public void render() {
        for(TableRow r : this.position.rows()) {
            println("Printing out the Character Model...\n");
        }
        this.readTable(this.position);
    }
    
    /**
    *   Sets the Animation to a new set of points
    */
    public void setNewPosition(TableRow newPos) {
        this.position.removeRow(0);
        
        TableRow r = position.addRow();
        r.setInt("Segment",newPos.getInt(1));
        r.setFloat("xOrigin",newPos.getFloat(2));
        r.setFloat("yOrigin",newPos.getFloat(3));
        r.setFloat("zOrigin",newPos.getFloat(4));
        r.setFloat("xEnd",newPos.getFloat(5));
        r.setFloat("yEnd",newPos.getFloat(6));
        r.setFloat("zEnd",newPos.getFloat(7));
    }
    
    /**
    *   Displays all of the points currently is use by the Animation
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
