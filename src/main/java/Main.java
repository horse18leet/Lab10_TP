import javax.xml.transform.Result;
import java.sql.*;

public class Main {
    static Connection connection;
    static Statement statement;

    public static void main(String[] args) throws SQLException {
        Connect();
        ResultSet rs;
        //rs = statement.executeQuery("SELECT name, COUNT(*) AS kol_vo\n" + "FROM progress INNER JOIN subject ON progress.id_subject=subject.id\n" + "GROUP BY subject.name\n" + "ORDER BY kol_vo DESC\n" + "LIMIT 3;");
        //rs = statement.executeQuery("CREATE TABLE student(\n" + "id INT PRIMARY KEY NOT NULL,\n" + "name VARCHAR(30) NOT NULL,\n" + "serial SMALLINT NOT NULL,\n" + "number INT NOT NULL,\n" + "UNIQUE(serial,number)\n" + ");");
        //rs = statement.executeQuery("SELECT AVG(mark) FROM progress WHERE (id_student = 1);");
        //rs = statement.executeQuery("SELECT AVG(mark) FROM progress WHERE (id_subject = 1);");
        rs = statement.executeQuery("SELECT student.name, subject.name, progress.mark FROM student INNER JOIN progress ON progress.id_student=student.id INNER JOIN subject ON progress.id_subject=subject.ID WHERE progress.mark>3 LIMIT 4 OFFSET 1;");
        while(rs.next())
        {
            System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3));
        }
        Disconnect();
    }

    public static void Connect() throws SQLException {

        try{
            connection = DriverManager.getConnection(
                    "jdbc:postgresql://localhost:5432/lab10",
                    "postgres",
                    "@8acJMQKc"
            );
            statement = connection.createStatement();
        }
        catch (SQLException e){
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        }
    }

    public static void Disconnect() throws SQLException {
        try{
            connection.close();
        }catch (Exception e){
            e.printStackTrace();
        }
        try{
            statement.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
