package ex1;

import java.sql.*;

public class Program {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String sql = "SELECT * FROM jobs WHERE min_salary > 4500";

        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection(url, "hr", "hr1234");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        while(rs.next()){
            String id = rs.getString("job_id");
            String title = rs.getString("job_title");
            int min = rs.getInt("min_salary");
            int max = rs.getInt("max_salary");

            System.out.printf("직무ID : %8s \t 부서명 : %30s \t 최소연봉 : %6d \t 최대연봉 : %6d\n", id, title, min, max);
        }

        rs.close();
        st.close();
        con.close();
    }
}
