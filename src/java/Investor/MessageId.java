package Investor;

public class MessageId {
    static int a, b, c, d, e; 
    static char f, g, h, i, j, k, l, p, q, r;
    static String investID;
            
    public static String messageID(){
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
            
        }
        
        String aa = String.valueOf(a);
        String bb=  String.valueOf(b);
        String cc = String.valueOf(c);
        String dd = String.valueOf(d);
        
        investID = aa+cc+dd+bb;
        
        return investID;      
    }
}
