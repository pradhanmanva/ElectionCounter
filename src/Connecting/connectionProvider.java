package Connecting;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * Created by pradh on 5/6/2017.
 */
public class connectionProvider implements ConnectionInterface {
    Connection connection = null;
    private boolean result = false;

    connectionProvider() {
    }

    @Override
    public boolean connect() {
        {
            try {
                Class.forName(ConnectionInterface.JDBC_DRIVER);
                System.out.println("Connecting to database...");
                connection = DriverManager.getConnection(ConnectionInterface.DB_URL, ConnectionInterface.USER, ConnectionInterface.PASS);
                result = true;
            } catch (Exception e) {
                result = false;
                e.printStackTrace();
            } finally {
                return result;
            }
        }
    }

}
