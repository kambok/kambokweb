
package model;


public class LoanInterestCalculator {
 
    
    public static double extinterest(double amount,int days){
	    
             return amount*1/100 * days;
    }
    
    public static double loanInterest(double amount,int days){
	     double interest=0.0;
	     if(amount<=50000){
	       if(days<=7){
                 return 2.2*amount/100 *7;  
               }else if(days>7 && days<=14){
                  return 1.5*amount/100 *14; 
               }else if(days>14 && days<=21){
               return 1.2*amount/100 *21;
               }else if(days>21 && days<=30){
                return 1*amount/100 *30;  
               }	
                       
              }else if(amount>50000 && amount<=100000){
                 if(days<=7){
                 return 2*amount/100 *7;  
               }else if(days>7 && days<=14){
                  return 1.3*amount/100 *14; 
               }else if(days>14 && days<=30){
               return 0.97*amount/100 *30;
               }
              
              }else if(amount>100000 && amount<=250000){
               if(days<=7){
                 return 1.8*amount/100 *7;  
               }else if(days>7 && days<=14){
                  return 1*amount/100 *14; 
               }else if(days>14 && days<=30){
               return 0.76*amount/100 *30;
               }
              
              }else if(amount>250000 && amount<=400000){
              if(days<=7){
                 return 1*amount/100 *7;  
               }else if(days>7 && days<=14){
                  return 0.8*amount/100 *14; 
               }else if(days>14 && days<=30){
               return 0.65*amount/100 *30;
               }
              
              }else if(amount>400000 && amount<=500000){
              if(days<=7){
                 return 0.8*amount/100 *7;  
               }else if(days>7 && days<=14){
                  return 0.65*amount/100 *14; 
               }else if(days>14 && days<=30){
               return 0.5*amount/100 *30;
               }
              
              }	   
		
	
				  
	return 00.0;	
    }
	
    

}
