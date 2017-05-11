package Connecting;

import Beans.SlipData;

/**
 * Created by pradh on 5/6/2017.
 */
public class Main {
    public static void main(String args[]) {
        jdbcCandidate obj = new jdbcCandidate();
        obj.print();
        jdbcSlipData object = new jdbcSlipData();
        int[] x = new int[18];
        x[0] = 3;
        x[1] = 6;
        x[2] = 7;
        x[3] = 9;
        x[4] = 2;
        x[5] = 2;
        x[6] = 2;
        x[7] = 2;
        x[8] = 2;
        x[9] = 2;
        x[10] = 2;
        int y = 1;
        int id = object.getMaxID() + 1;
        boolean o = object.updateSlipData(y, x);
        System.out.print(object.addSlipData(id, x));
        SlipData slipData = object.showSlipData(4);
        System.out.println();
    }
}
