package Connecting;

/**
 * Created by pradh on 5/11/2017.
 */
public class runXampp {
    static private boolean result = false;

    public static boolean startXampp() {
        try {
            Process process = Runtime.getRuntime().exec("C:\\xampp\\xampp_start.exe");
            Process process1 = Runtime.getRuntime().exec("C:\\xampp\\mysql\\bin\\mysqld.exe");
            result = true;
        } catch (Exception e) {
            result = false;
            e.printStackTrace();
        }
        return result;
    }
}
