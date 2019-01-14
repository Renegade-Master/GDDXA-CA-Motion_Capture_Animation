/**
*   @author         Ciaran Bent [K00221230]
*   @creationDate   2019/01/03  YYYY/MM/DD
*   @description    ...
*/

/********************\
|  Helper Functions  |
\********************/

public void incFrameRate() {
    if(looping) {
      if(fStep <= 5) {
            fStep++;
            switch(fStep) {
                case 0: // 1
                    frameRate(1.0);
                    break;
                case 1: // 2
                    frameRate(7.5);
                    break;
                case 2: // 3
                    frameRate(15.0);
                    break;
                case 3: // 4
                    frameRate(30.0);
                    break;
                case 4: // 5
                    frameRate(45.0);
                    break;
                case 5: // 6
                    frameRate(60.0);
                    break;
                default:
                    println("Key: '" + keyCode + "/" + key + "' is currently not used.");
                    break;
            }
        } else {
            fStep = 5;
        }
    }    
}

public void decFrameRate() {
    if(looping) {
      if(fStep >= 0) {
            fStep--; 
            switch(fStep) {
                case 0: // 1
                    frameRate(1.0);
                    break;
                case 1: // 2
                    frameRate(7.5);
                    break;
                case 2: // 3
                    frameRate(15.0);
                    break;
                case 3: // 4
                    frameRate(30.0);
                    break;
                case 4: // 5
                    frameRate(45.0);
                    break;
                case 5: // 6
                    frameRate(60.0);
                    break;
                default:
                    println("Key: '" + keyCode + "/" + key + "' is currently not used.");
                    break;
            }
        } else {
            fStep = 0;
        }
    }    
}

public void setFPS(float value) {
    value = sldr_fpsControl.getValueF();
    
    // Animation plays FORWARDS
    if(value > 0.5) {
        forwards = true;
    }
    // Animation plays BACKWARDS
    else if(value < 0.5) {
        forwards = false;
        value = (1 - value);
    }
    
    frameRate(fRate * value);
}
