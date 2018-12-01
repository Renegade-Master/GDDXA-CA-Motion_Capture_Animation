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
        float id = row.getFloat("Sensor ID");
        int segment = row.getInt("segment number");
        float xOrig = row.getFloat("Xorig");
        float yOrig = row.getFloat("Yorig");
        float zOrig = row.getFloat("Zorig");
        float xEnd = row.getFloat("Xend");
        float yEnd = row.getFloat("Yend");
        float zEnd = row.getFloat("Zend");
        float xVect = row.getFloat("Z Vector X Rel Angle");
        float yVect = row.getFloat("Z Vector Y Rel Angle");
        float zVect = row.getFloat("Z Vector Z Rel Angle");
            
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
