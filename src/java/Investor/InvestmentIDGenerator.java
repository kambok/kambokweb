
package Investor;


public class InvestmentIDGenerator {
     static int a, b, c, d, e; 
    static char f, g, h, i, j, k, l, p, q, r;
    static String investID;
            
    public static String investmentID(){
        char[] capitalAlph = new char [26];
        char[] smallAlph = new char [26];
        int [] integers = {1, 2, 3, 4, 5, 6, 7,8, 9};
        
        int m = 0, n = 0;
        
        for (char alph = 'A'; alph <= 'Z'; ++alph){
            capitalAlph[m] = alph;
            m++;
        }
        
        for (char alph = 'a'; alph <= 'z'; ++alph){
            smallAlph[n] = alph;
            n++;
        }
        
        for (int iteration = 0; iteration < 4; iteration++){
            a = integers[(int)Math.floor(Math.random() * integers.length)];
            b = integers[(int)Math.floor(Math.random() * integers.length)];
            c = integers[(int)Math.floor(Math.random() * integers.length)];
            d = integers[(int)Math.floor(Math.random() * integers.length)];
            e = integers[(int)Math.floor(Math.random() * integers.length)];
            f = capitalAlph[(int)Math.floor(Math.random() * capitalAlph.length)];
            g = capitalAlph[(int)Math.floor(Math.random() * capitalAlph.length)];
            k = smallAlph[(int)Math.floor(Math.random() * smallAlph.length)];
            l = smallAlph[(int)Math.floor(Math.random() * smallAlph.length)];
            p = smallAlph[(int)Math.floor(Math.random() * smallAlph.length)];
            
        }
        
        String aa = String.valueOf(a);
        String bb=  String.valueOf(b);
        String cc = String.valueOf(c);
        String dd = String.valueOf(d);
        String ee = String.valueOf(e);
        String ff = String.valueOf(f);
        String gg = String.valueOf(g);
        String kk = String.valueOf(k);
        String ll = String.valueOf(l);
        String pp = String.valueOf(p);
        
        investID = aa+cc+ll+dd+ff+kk+bb+gg+pp+ee+ll+aa;
        
        return investID;      
    }
}
