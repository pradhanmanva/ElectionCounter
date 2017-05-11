package Connecting;

import Beans.SlipData;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class jdbcSlipData {
    PreparedStatement preparedStatement = null;
    connectionProvider con = new connectionProvider();
    Statement statement;
    boolean result = false;
    String SQLquery;

    public jdbcSlipData() {
        boolean connected = con.connect();
        if (connected) {
            System.out.print("Successful.");
        } else {
            System.out.print("Connecting Failed.");
        }
    }

    public boolean updateSlipData(int id, int values[]) {
        String query = "";
        int i = 1;
        for (int x : values) {
            query += "_" + Integer.toString(i++) + "=" + Integer.toString(x) + " ,";
        }
        query = query.substring(0, query.length() - 1);
        SQLquery = "UPDATE SLIPDATA SET " + query + "WHERE slipdata.id = ?";

        try {
            preparedStatement = con.connection.prepareStatement(SQLquery);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
            System.out.println("Record is updated to DBUSER table!");
            result = true;
        } catch (Exception e) {
            result = false;
            e.printStackTrace();
        } finally {
            return result;
        }
    }

    public boolean addSlipData(int id, int[] values) {
        int i = 1;
        String query = "";
        for (int x : values) {
            query += Integer.toString(x) + ",";
        }
        query = query.substring(0, query.length() - 1);
        SQLquery = "INSERT INTO SLIPDATA VALUES (?," + query + ")";

        try {
            preparedStatement = con.connection.prepareStatement(SQLquery);
            preparedStatement.setInt(1, id);
            preparedStatement.execute();
            System.out.println("Successful Insert");
            result = true;
        } catch (Exception e) {
            result = false;
            e.printStackTrace();
        } finally {
            return result;
        }
    }

    public SlipData showSlipData(int id) {
        SQLquery = "SELECT * FROM SLIPDATA where ID = " + Integer.toString(id) + " ";
        SlipData slipData = new SlipData();
        try {
            statement = con.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQLquery);
            resultSet.next();
            slipData.setId(resultSet.getInt(1));
            slipData.set_1(resultSet.getInt(2));
            slipData.set_2(resultSet.getInt(3));
            slipData.set_3(resultSet.getInt(4));
            slipData.set_4(resultSet.getInt(5));
            slipData.set_5(resultSet.getInt(6));
            slipData.set_6(resultSet.getInt(7));
            slipData.set_7(resultSet.getInt(8));
            slipData.set_8(resultSet.getInt(9));
            slipData.set_9(resultSet.getInt(10));
            slipData.set_10(resultSet.getInt(11));
            slipData.set_11(resultSet.getInt(12));
            slipData.set_12(resultSet.getInt(13));
            slipData.set_13(resultSet.getInt(14));
            slipData.set_14(resultSet.getInt(15));
            slipData.set_15(resultSet.getInt(16));
            slipData.set_16(resultSet.getInt(17));
            slipData.set_17(resultSet.getInt(18));
            slipData.set_18(resultSet.getInt(19));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slipData;
    }

    public int getMaxID() {
        SQLquery = "SELECT MAX(ID) from slipdata";
        int max = 0;
        try {
            statement = con.connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SQLquery);
            resultSet.next();
            max = resultSet.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return max;
    }
}
