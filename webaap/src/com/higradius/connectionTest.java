package com.higradius;
import com.higradius.Datagetset;
import java.sql.*;
import java.util.*;
import java.sql.DriverManager;
public class connectionTest {

	public ArrayList<Datagetset> getData() throws Exception{
		ArrayList<Datagetset> columnlist=new ArrayList<Datagetset>();
		
		try{
			String url="jdbc:mysql://localhost:3306/prediction";
		String username="root";
		String pass="vishal";
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,username,pass);
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery("select name_customer, cust_number , invoice_id , total_open_amount , due_in_date , Pridicted_date, bucket  from mytable");
		while(rs.next() ) {
			Datagetset column=new Datagetset();
			column.setCoustomer(rs.getString(1));
			column.setCoust_no(rs.getString(2));
			column.setInvoice_no(rs.getString(3));
			column.setInvoice_ammount(rs.getInt(4));
			column.setDue_date(rs.getString(5));
			column.setPredicted_date(rs.getString(6));
			column.setBucket(rs.getString(7));
			columnlist.add(column);
		}
		System.out.println("connectiontest.java");
		con.close();
		System.out.println(columnlist.get(0).getCoustomer());
		
		}catch (Exception e) {
		System.out.println(e);
		}
		return columnlist;
	}
}
