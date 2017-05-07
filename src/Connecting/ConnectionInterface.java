package Connecting; /**
 * Created by pradh on 5/6/2017.
 */

interface ConnectionInterface {

    String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost/election";
    String USER = "root";
    String PASS = "";

    boolean connect();

}
