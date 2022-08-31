package Admin;

public class WalletID {
    
    static int a, b, c, d, e, f, g, h, i, j, k, l, p, q, r; 
    static String walletID;
            
    public static String referenceCode(){
        int [] integers = {1, 2, 3, 4, 5, 6, 7,8, 9};
       
        for (int iteration = 0; iteration < 4; iteration++){
            a = integers[(int)Math.floor(Math.random() * integers.length)];
            b = integers[(int)Math.floor(Math.random() * integers.length)];
            c = integers[(int)Math.floor(Math.random() * integers.length)];
            d = integers[(int)Math.floor(Math.random() * integers.length)];
            e = integers[(int)Math.floor(Math.random() * integers.length)];
            f = integers[(int)Math.floor(Math.random() * integers.length)];
            g = integers[(int)Math.floor(Math.random() * integers.length)];
            k = integers[(int)Math.floor(Math.random() * integers.length)];
            l = integers[(int)Math.floor(Math.random() * integers.length)];
            p = integers[(int)Math.floor(Math.random() * integers.length)];
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
        
        walletID = aa+cc+ll+dd+ff+kk+bb+gg+pp+ee;
        
        return walletID;      
    }
}
