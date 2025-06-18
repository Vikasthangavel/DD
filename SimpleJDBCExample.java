import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SimpleJDBCExample {
    public static void main(String[] args) {
        // Database credentials and URL
        String url = "jdbc:mysql://localhost:3306/test"; // replace 'testdb' with your DB name
        String user = "root"; // your DB username
        String password = "Vikas@5599"; // your DB password

        try {
            // Step 1: Load JDBC driver (optional since JDBC 4.0)
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Step 2: Establish connection
            Connection conn = DriverManager.getConnection(url, user, password);

            // Step 3: Create statement
            Statement stmt = conn.createStatement();

            // Step 4: Execute SQL INSERT
            String insertSql = "INSERT INTO users (id, name) VALUES (1, 'Alice')";
            stmt.executeUpdate(insertSql);

            // Step 5: Execute SQL SELECT
            String selectSql = "SELECT * FROM users";
            ResultSet rs = stmt.executeQuery(selectSql);

            // Step 6: Process results
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                System.out.println("ID: " + id + ", Name: " + name);
            }

            // Step 7: Close connection
            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
