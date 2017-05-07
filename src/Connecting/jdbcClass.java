package Connecting;

import Beans.CandidateClass;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class jdbcClass {
    private Statement statement;
    private CandidateClass[] candidateClasses = new CandidateClass[18];

    public jdbcClass() {
        connectionProvider con = new connectionProvider();
        boolean connected = con.connect();
        if (connected) {
            System.out.print("Successful.");
            try {
                statement = con.connection.createStatement();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            System.out.print("Connecting Failed.");
        }
    }

    public CandidateClass[] SelectStatement() {
        try {
            String sql;
            sql = "SELECT * from CANDIDATES";
            ResultSet rs = statement.executeQuery(sql);
            int i = 0;
            while (rs.next()) {
                candidateClasses[i] = new CandidateClass();
                candidateClasses[i].setId(rs.getInt("id"));
                candidateClasses[i].setName(rs.getString("name"));
                candidateClasses[i].setVotes(rs.getInt("votes"));
                candidateClasses[i++].setPanel(rs.getInt("panel"));
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return candidateClasses;
    }

    void print() {
        candidateClasses = SelectStatement();
        for (CandidateClass x : candidateClasses) {
            System.out.println(x.getId() + " " + x.getName() + " " + x.getVotes() + " " + x.getPanel());
        }
    }
}
