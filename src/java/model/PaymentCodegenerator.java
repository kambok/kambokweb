/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.time.LocalDate;

/**
 *
 * @author User
 */
public class PaymentCodegenerator {
static int a,b,c,d,e,f,g,h,i; 
  static  String code;
  
    
   
   public static String generateRegno(){
   
    int []arr={0,1,2,3,4,5,6,7,8,9};
        for(int limit=0;limit<15;limit++){
         
        a=arr[(int)Math.floor(Math.random() *arr.length)];
          b=arr[(int)Math.floor(Math.random() *arr.length)];
            c=arr[(int)Math.floor(Math.random() *arr.length)];
              d=arr[(int)Math.floor(Math.random() *arr.length)];
                e=arr[(int)Math.floor(Math.random() *arr.length)];
                  f=arr[(int)Math.floor(Math.random() *arr.length)];
                    g=arr[(int)Math.floor(Math.random() *arr.length)];
                      h=arr[(int)Math.floor(Math.random() *arr.length)];
                        
        }
     
        String aa=String.valueOf(a);
        String bb=String.valueOf(b);
        String cc=String.valueOf(c);
        String dd=String.valueOf(d);
        String ee=String.valueOf(e);
        String ff=String.valueOf(f);
        String gg=String.valueOf(g);
        String hh=String.valueOf(h);
        LocalDate date = LocalDate.now();
        String mydate=String.valueOf(date);
        String day=String.valueOf(date.getDayOfMonth());
        String month=String.valueOf(date.getMonthValue()); 
        String year=String.valueOf(date.getYear());  
        //String str=mydate.replaceAll("[^0-9]", " ");
        String dated=day+""+month+""+year;
        //System.out.println("date:"+dated);
        
     code=aa+bb+cc+dd+ee+ff;
     int limit=code.length();
     System.out.println("Registration number generated");
     return code;
   }
           
}
