/**
*   @author         Ciaran Bent [K00221230]
*   @creationDate   2018/12/01  YYYY/MM/DD
*   @description    ...
*/

/******************\
|  Read the table  |
\******************/

void readTable(Table table) {    
    for (TableRow row : table.rows()) {    
        float id = row.getFloat(0);
        int segment = row.getInt(1);
        float xOrig = row.getFloat(2);
        float yOrig = row.getFloat(3);
        float zOrig = row.getFloat(4);
        float xEnd = row.getFloat(5);
        float yEnd = row.getFloat(6);
        float zEnd = row.getFloat(7);
        float xVect = row.getFloat(8);
        float yVect = row.getFloat(9);
        float zVect = row.getFloat(10);
            
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
    }
    
    println("\n" + table.getRowCount() + " total rows in table");
}
