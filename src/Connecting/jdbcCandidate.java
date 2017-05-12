package Connecting;

import Beans.CandidateClass;
import com.sun.org.apache.xml.internal.resolver.readers.ExtendedXMLCatalogReader;

import java.sql.*;


public class jdbcCandidate {
    private Statement statement;
    private CandidateClass[] candidateClasses = new CandidateClass[18];
    PreparedStatement preparedStatement = null;
    private connectionProvider con = new connectionProvider();
    boolean result = false;
    String sql;

    public jdbcCandidate() {
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

    public CandidateClass selectClassById(int id) {
        CandidateClass candidateClass = null;
        try {
            candidateClass = new CandidateClass();
            sql = "SELECT * from CANDIDATES WHERE ID=?";
            preparedStatement = con.connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet rs = statement.executeQuery(sql);
            rs.next();
            candidateClass.setId(rs.getInt("id"));
            candidateClass.setName(rs.getString("name"));
            candidateClass.setPanel(rs.getInt("panel"));
            candidateClass.setVotes(rs.getInt("votes"));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return candidateClass;
    }

    void print() {
        for (CandidateClass x : candidateClasses) {
            System.out.println(x.getId() + " " + x.getName() + " " + x.getVotes() + " " + x.getPanel());
        }
    }

    public CandidateClass[] selectStatement() {
        CandidateClass candidateClass = null;
        try {
            sql = "SELECT * from CANDIDATES";
            statement = con.connection.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            int i = 0;
            while (rs.next()) {
                candidateClasses[i] = new CandidateClass();
                candidateClasses[i].setId(rs.getInt("id"));
                candidateClasses[i].setName(rs.getString("name"));
                candidateClasses[i].setPanel(rs.getInt("panel"));
                candidateClasses[i++].setVotes(rs.getInt("votes"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return candidateClasses;
    }

    public boolean updateTable() {
        sql = "UPDATE CANDIDATES SET VOTES=? WHERE ID=?";
        try {
            for (int i = 1; i <= 18; i++) {
                String SQL = "SELECT SUM(slipdata._" + Integer.toString(i) + ") FROM CANDIDATES, SLIPDATA WHERE CANDIDATES.ID=SLIPDATA.ID";

                statement = con.connection.createStatement();
                ResultSet resultSet = statement.executeQuery(SQL);
                resultSet.next();
                preparedStatement = con.connection.prepareStatement(sql);
                preparedStatement.setInt(1, resultSet.getInt(1));
                preparedStatement.setInt(2, i);
                final int i1 = preparedStatement.executeUpdate();
            }
            result = true;
        } catch (Exception e) {
            result = false;
            e.printStackTrace();
        }
        return result;
    }
}
