package Connecting;

import Beans.SlipData;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class SlipDataClass {
    PreparedStatement preparedStatement = null;
    connectionProvider con = new connectionProvider();
    Statement statement;
    boolean result = false;
    String SQLquery;

    public SlipDataClass() {
        boolean connected = con.connect();
        if (connected) {
            System.out.print("Successful.");
        } else {
            System.out.print("Connecting Failed.");
        }
    }

    boolean updateSlipData(int id, int values[]) {
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

    boolean addSlipData(int id, int[] values) {
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

    int getMaxID() {
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
