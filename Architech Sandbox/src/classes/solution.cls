public class solution{

    public integer solution(integer A, integer B){
    
        // Run the first integer to view the square
        integer countTotalSuare = 0;
        for(integer i=A;i<=B;i++){
              boolean isSquare =  isSquareRoot(double.valueOf(i));               
              if(isSquare){
                  countTotalSuare = countTotalSuare + 1; 
              }
        }   
        system.debug('countTotalSuarecountTotalSuare---'+countTotalSuare);
        return countTotalSuare;
    }
    
    public boolean isSquareRoot(double val){
        
        double isSquareRootValue = Math.sqrt(decimal.valueOf(val));
        integer originalValue = (integer) isSquareRootValue;
        if(Math.pow(isSquareRootValue,2) == Math.pow(originalValue,2)){
            return true;
        }else {
            return false;
        }        
        
    }

}