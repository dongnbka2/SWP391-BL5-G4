package dal;

import dal.DBConnect;
import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author Dong
 */
public class UserDAO {

    static Connection cnn; // kết nối
    static PreparedStatement stm; // thực hiên các cáu lệnh sql
    static ResultSet rs; // lưu trữ và xử lí dữ liệu

    public static boolean IfEmailExist(String email) {

        try {
            String sql = "select email from Users where email=?";
            cnn = DBConnect.getConnection();
            stm = cnn.prepareStatement(sql);
            stm.setString(1, email);
            rs = stm.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println("IfEmailExist error:" + e.getMessage());
        }
        return false;
    }

    public boolean checkDupCEmail(String email) {
        try {
            String sql = "select [code] from [Users] where [email]='" + email + "'";
            cnn = DBConnect.getConnection();
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                return false;
            }
        } catch (Exception e) {
            System.out.println("checkDupEmail error:" + e.getMessage());
        }
        return true;
    }

    public static User getUser(String email, String pass) {
        try {
            String sql = "Select [user_id],[code],[fullname],[dob],[gender],[address],[email],[password],\n"
                    + "[id_card],[avatar],[role],[status],[created_at],[created_by],[modified_at],[modified_by] from [Users] \n"
                    + "where email='" + email + "' AND password='" + pass + "'";
            cnn = DBConnect.getConnection();
            stm = cnn.prepareStatement(sql);
            rs = stm.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.user_id = rs.getInt(1);
                u.code = rs.getString(2);
                u.fullname = rs.getString(3);
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                u.dob = f.format(rs.getDate(4));
                u.gender = (rs.getBoolean(5) ? "Male" : "Female");
                u.address = rs.getString(6);
                u.email = rs.getString(7);
                u.password = rs.getString(8);
                u.id_card = rs.getString(9);
                u.avatar = rs.getString(10);
                u.role = rs.getInt(11);
                u.status = rs.getBoolean(12);
                u.created_at = rs.getDate(13);
                u.created_by = rs.getInt(14);
                u.modified_at = rs.getDate(15);
                u.modified_by = rs.getInt(16);
                return u;
            }
        } catch (Exception e) {
            System.out.println("getUser Error: " + e.getMessage());
        }
        return null;
    }
    
    public static User getUserByID(int id) {
        User u = new User();
        try {
            String str = "Select [user_id],[code],[fullname],[dob],[gender],[address],[email],[password]\n"
                    + ",[id_card],[avatar],[role],[status],[created_at],[created_by],[modified_at],[modified_by] \n"
                    + "from [Users]\n"
                    + "where [user_id]=?";
            Connection conn = DBConnect.getConnection();
            PreparedStatement pstm = conn.prepareStatement(str);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                u.user_id = rs.getInt(1);
                u.code = rs.getString(2);
                u.fullname = rs.getString(3);
                SimpleDateFormat f = new SimpleDateFormat("dd/MM/yyyy");
                u.dob = f.format(rs.getDate(4));
                u.gender = (rs.getBoolean(5) ? "Male" : "Female");
                u.address = rs.getString(6);
                u.email = rs.getString(7);
                u.password = rs.getString(8);
                u.id_card = rs.getString(9);
                u.avatar = rs.getString(10);
                u.role = rs.getInt(11);
                u.status = rs.getBoolean(12);
                u.created_at = rs.getDate(13);
                u.created_by = rs.getInt(14);
                u.modified_at = rs.getDate(15);
                u.modified_by = rs.getInt(16);
            }
        } catch (SQLException e) {
            System.out.println("get user by id error: " + e);
        }
        return u;
    }
    
  public static String encryptPassword(String pass) {
        return DigestUtils.md5Hex(pass).toUpperCase();
    }

    public static boolean checkPassword(String passInput, String passDB) {
        return passDB.equals(DigestUtils.md5Hex(passInput).toUpperCase());
    }}