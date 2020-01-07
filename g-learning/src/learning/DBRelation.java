package learning;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import Bean.StudentArrayBean;
import Bean.StudentBean;
import parameter.StudentParameter;
/**
 * Servlet implementation class DBRelation
 */
@WebServlet("/DBRelation)")
public class DBRelation extends DBDAO implements Serializable {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBRelation() {
        super();
        // TODO Auto-generated constructor stub
    }
    StudentBean sBean=null;

	public boolean login(int id,String pass){

		ResultSet rslt = null;
		String login = "SELECT * FROM student WHERE student_id = ? AND student_pass = ?";
		try{
		stmt = con.prepareStatement(login);
		stmt.setInt(1,id);
		stmt.setString(2,pass);
		rslt = stmt.executeQuery();
	    if(rslt.next()){
				return true;
	    }else{
			return false;
	    }

		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			try{
				stmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}

	public boolean IdDuplicateCheck(int id){
    	ResultSet rs=null;
		String sql = "SELECT * FROM student WHERE student_id = ?";
		try{
		stmt = con.prepareStatement(sql);
		stmt.setInt(1,id);
		rs = stmt.executeQuery();
	    if(rs.next()){
				return true;
	    }else{
			return false;
	    }

		}catch(Exception e){
			e.printStackTrace();
			return false;
		}finally{
			try{
				stmt.close();
				con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
    }


	public void DBInsert(String cls,int id,String name,String pass,String adress){

		try{
		stmt = con.prepareStatement("INSERT INTO student VALUES(?,?,?,?,?,1);");
		stmt.setInt(1,id);
		stmt.setString(2,name);
		stmt.setString(3,pass);
		stmt.setString(4,adress);
		stmt.setString(5,cls);

		stmt.executeUpdate();

		}catch(Exception e){
		e.printStackTrace();
		}
	}
	public StudentArrayBean StudentDisplay(){
    	StudentArrayBean SABean=new StudentArrayBean();
		ResultSet rs=null;
		String sql = "SELECT * FROM student";
		try{
		stmt = con.prepareStatement(sql);
	//	stmt.setInt(1,id);
		rs = stmt.executeQuery();
		while(rs.next()){
			sBean=new StudentBean();
			sBean.setStudent_id(rs.getInt(StudentParameter.sudent_id));
			sBean.setStudent_name(rs.getString(StudentParameter.student_name));

			SABean.addstudentArray(sBean);

		}


	} catch (SQLException e) {
		// TODO 自動生成された catch ブロック
		e.printStackTrace();
	}
	return SABean;


}

}
