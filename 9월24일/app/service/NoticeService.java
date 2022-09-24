package jdbc.app.service;

import jdbc.app.entity.Notice;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoticeService {
    // 해당 값들을 관리하기 쉽게 전역으로 사용할 수 있게 빼논다.
    private String url = "jdbc:oracle:thin:@localhost:1521:xe";
    private String uID = "hr";
    private String uPW = "hr1234";
    private String driver = "oracle.jdbc.driver.OracleDriver";

    public List<Notice> getList(int page) throws ClassNotFoundException, SQLException {
//        String sql = "SELECT * FROM (" +
//                "SELECT ROWNUM num, N.* FROM (" +
//                "SELECT * FROM jobs ORDER BY job_id DESC) N )" +
//                "WHERE num BETWEEN ? AND ?";
        // View를 사용해 쿼리문을 간단하게 만듦
        String sql = "SELECT * FROM jobs_view WHERE num BETWEEN ? AND ?";
        int start = page+1;
        int end  = page+3;

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, uID, uPW);
        PreparedStatement st = con.prepareStatement(sql);
        // 대입할 값이 있어서 prepare을 사용함
        st.setInt(1, start);
        st.setInt(2, end);
        ResultSet rs = st.executeQuery();

        List<Notice> list = new ArrayList<>();

        while(rs.next()){
            String id = rs.getString("job_id");
            String title = rs.getString("job_title");
            int min = rs.getInt("min_salary");
            int max = rs.getInt("max_salary");

            Notice notice = new Notice(id, title, min, max);

            list.add(notice);

        }

        rs.close();
        st.close();
        con.close();

        return list;
    }
    public int getCount() throws ClassNotFoundException, SQLException { // 스칼라값을 얻어옴(단일값)
        int count = 0;
        String sql = "SELECT COUNT(*) count FROM jobs";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, uID, uPW);
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(sql);

        if(rs.next())
            count = rs.getInt("count");

        rs.close();
        st.close();
        con.close();

        return count;
    }

    public int insert(Notice notice) throws ClassNotFoundException, SQLException {
        String job_id = notice.getId();
        String job_title = notice.getTitle();
        int min_salary = notice.getMin();
        int max_salary = notice.getMax();

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String sql = "INSERT INTO jobs(job_id, job_title, min_salary, max_salary)" +
                "values(?, ?, ?, ?)";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, uID, uPW);
        //Statement st = con.createStatement();
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, job_id);
        st.setString(2, job_title);
        st.setInt(3, min_salary);
        st.setInt(4, max_salary);

        int result = st.executeUpdate();


        st.close();
        con.close();

        return result;
    }
    public int update(Notice notice) throws ClassNotFoundException, SQLException {
        String job_id = notice.getId();
        String job_title = notice.getTitle();
        int min_salary = notice.getMin();
        int max_salary = notice.getMax();

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String sql = "DELETE jobs set job_title=?, min_salary=?, max_salary=?" +
                "where job_id=?";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, uID, uPW);
        //Statement st = con.createStatement();
        PreparedStatement st = con.prepareStatement(sql);
        st.setString(1, job_title);
        st.setInt(2, min_salary);
        st.setInt(3, max_salary);
        st.setString(4, job_id);

        int result = st.executeUpdate();


        st.close();
        con.close();

        return result;
    }
    public int delete(int id) throws ClassNotFoundException, SQLException {

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String sql = "DELETE jobs where job_id=?";

        Class.forName(driver);
        Connection con = DriverManager.getConnection(url, uID, uPW);
        //Statement st = con.createStatement();
        PreparedStatement st = con.prepareStatement(sql);
        st.setInt(1, id);

        int result = st.executeUpdate();


        st.close();
        con.close();

        return result;
    }

}
