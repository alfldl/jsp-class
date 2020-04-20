package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookMemberDao {

	private static BookMemberDao instance;
	private BookMemberDao() {}
	public static BookMemberDao  getInstance() {
		if (instance == null) {	instance = new BookMemberDao();		}
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { System.out.println(e.getMessage());	}
		return conn;
	}
	
	public int check(String bmno, String passwd) throws SQLException {
		int result  = 0;  				Connection conn = null;
		String sql  = "select passwd from BOOKMEMBER where bmno=?"; 
		PreparedStatement pstmt = null; ResultSet rs = null;
		try { 
			conn  = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bmno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String dbPasswd = rs.getString(1);
				if (dbPasswd.equals(passwd)) result = 1;
				else result = 0;
			} else   result = -1;
		} catch(Exception e) { System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;	Statement stmt= null; 
		ResultSet rs = null;    int tot = 0;
		String sql = "select count(*) from BookMember";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
	public int getBiTotalCnt() throws SQLException {
		Connection conn = null;	Statement stmt= null; 
		ResultSet rs = null;    int tot = 0;
		String sql = "select count(*) from BookIn";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}	
	public int getBoTotalCnt() throws SQLException {
		Connection conn = null;	Statement stmt= null; 
		ResultSet rs = null;    int tot = 0;
		String sql = "select count(*) from BookOut";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}	
	
	//  bookin booklent_yn = 'N'
	public int getBiLentTotalCnt() throws SQLException {
		Connection conn = null;	Statement stmt= null; 
		ResultSet rs = null;    int tot = 0;
		String sql = "select count(*) from BookIn WHERE booklent_yn='N'";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}	
	
	public String  bmGetBMName(int bmno) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		String rbmName = "";
		System.out.println("Start bmGetBMName ");
		String sql = "SELECT bmname  From bookMember WHERE bmno="+bmno;
		System.out.println("bmGetBMName sql->"+sql);

		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) rbmName = rs.getString(1);
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		System.out.println("bmGetBMName rbmName->"+rbmName);
		return rbmName;
	}
	
	public List<BookMember> bmlist(int startRow, int endRow) throws SQLException {
		List<BookMember> list = new ArrayList<BookMember>();
		Connection conn = null;	PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
    	// mysql select * from board order by num desc limit startPage-1,10;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from BookMember ) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookMember bookMember = new BookMember();
				bookMember.setBmno(rs.getInt("bmno"));
				bookMember.setPasswd(rs.getString("passwd"));
				bookMember.setBmname(rs.getString("bmname"));
				bookMember.setBmaddr(rs.getString("bmaddr"));
				bookMember.setBmtel(rs.getString("bmtel"));
				bookMember.setBmloc(rs.getString("bmloc"));
				bookMember.setBmgrade(rs.getString("bmgrade"));
				bookMember.setNoretcnt(rs.getInt("noretcnt"));
				bookMember.setLent_yn(rs.getString("lent_yn"));
				bookMember.setReg_date(rs.getDate("reg_date"));
				list.add(bookMember);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}

	public List<BookIn> biList(int startRow, int endRow) throws SQLException {
		List<BookIn> list = new ArrayList<BookIn>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
    	// mysql select * from board order by num desc limit startPage-1,10;
		 String sql = "select * from (select rownum rn ,a.* from " + 
			" (select * from BookIn ) a ) "+
			" where rn between ? and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			   System.out.println("biList  sql->" +sql);
			   System.out.println("biList  startRow->" +startRow);
			   System.out.println("biList  endRow->" +endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookIn bookIn  = new BookIn();
				bookIn.setBook_kind(rs.getString("book_kind"));
				bookIn.setBookno(rs.getString("bookno"));
				bookIn.setBookseq(rs.getInt("bookseq"));
				   System.out.println("biList  bookno->" +rs.getString("bookno"));
				   System.out.println("biList  bookname->" +rs.getString("bookname"));

				bookIn.setBookname(rs.getString("bookname"));
				bookIn.setWrite(rs.getString("write"));
				bookIn.setBookcredate(rs.getString("bookcredate"));
				bookIn.setBookstate(rs.getString("bookstate"));
				bookIn.setBooklent_yn(rs.getString("booklent_yn"));
				bookIn.setReg_date(rs.getDate("reg_date"));
				bookIn.setCheck("0");
				list.add(bookIn);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}

	public List<BookOut> boList(int startRow, int endRow) throws SQLException {
		List<BookOut> list = new ArrayList<BookOut>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
    	// mysql select * from board order by num desc limit startPage-1,10;
		 String sql = "  SELECT   * from (select rownum rn ,a.* , b.bmname bmname " +
                              "   From	 (select * from BookOut ) a   , BookMember b " +
                             "   Where   a.bmno = b.bmno " +
                            "    ) " +
		                   " WHERE  rn between ?  and ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			   System.out.println("boList  sql->" +sql);
			   System.out.println("boList  startRow->" +startRow);
			   System.out.println("boList  endRow->" +endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookOut bookOut   = new BookOut();
				bookOut.setBmno(rs.getInt("bmno"));
				bookOut.setBook_kind(rs.getString("book_kind"));
				bookOut.setBookno(rs.getString("bookno"));
				bookOut.setBookseq(rs.getInt("bookseq"));
				   System.out.println("biList  bookno->" +rs.getString("bookno"));
				bookOut.setBookLentDate(rs.getString("bookLentDate"));
				bookOut.setBookRetDate(rs.getString("bookRetDate"));
				bookOut.setBookLentDay(rs.getInt("bookLentDay"));
//				bookOut.setWrite(rs.getString("write"));
				bookOut.setBookRet_yn(rs.getString("bookRet_yn"));
				bookOut.setReg_date(rs.getDate("reg_date"));
				bookOut.setBmname(rs.getString("bmname"));
				list.add(bookOut);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}

	//  bookin booklent_yn = 'N'
	public List<BookIn> biLentYNList(int startRow, int endRow) throws SQLException {
		List<BookIn> list = new ArrayList<BookIn>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from board order by num desc";
    	// mysql select * from board order by num desc limit startPage-1,10;
		 String sql = "SELECT * from (SELECT rownum rn ,a.* from " + 
			" (SELECT  * From BookIn ) a ) "+
			" WHERE rn between ? and ?  AND booklent_yn = 'N'  ";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			   System.out.println("biList  sql->" +sql);
			   System.out.println("biList  startRow->" +startRow);
			   System.out.println("biList  endRow->" +endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookIn bookIn  = new BookIn();
				bookIn.setBook_kind(rs.getString("book_kind"));
				bookIn.setBookno(rs.getString("bookno"));
				bookIn.setBookseq(rs.getInt("bookseq"));
				   System.out.println("biList  bookno->" +rs.getString("bookno"));
				   System.out.println("biList  bookname->" +rs.getString("bookname"));

				bookIn.setBookname(rs.getString("bookname"));
				bookIn.setWrite(rs.getString("write"));
				bookIn.setBookcredate(rs.getString("bookcredate"));
				bookIn.setBookstate(rs.getString("bookstate"));
				bookIn.setBooklent_yn(rs.getString("booklent_yn"));
				bookIn.setReg_date(rs.getDate("reg_date"));
				bookIn.setCheck("0");
				list.add(bookIn);
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return list;
	}
	
	public int bmInsert(BookMember bookMember) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		String sql1 = "select nvl(max(BMNO),0) from bookMember";
		String sql="insert into bookMember values(?,?,?,?,?,?,?,0,'Y',SYSDATE)";
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int bmno = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bmno);
			pstmt.setString(2, bookMember.getPasswd());
			pstmt.setString(3, bookMember.getBmname());
			pstmt.setString(4, bookMember.getBmaddr());
			pstmt.setString(5, bookMember.getBmtel());
			pstmt.setString(6, bookMember.getBmloc());
			pstmt.setString(7, bookMember.getBmgrade());
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}

	public int biInsert(BookIn  bookIn) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		String sql1 = "SELECT  NVL(MAX(bookseq),0) FROM  BookIn WHERE"
				            + "  book_kind=?   AND  bookno=?";
		String sql="INSERT INTO  BookIn VALUES(?,?,?,?,?,?,?,'N',SYSDATE)";
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, bookIn.getBook_kind());
			pstmt.setString(2, bookIn.getBookno());
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int bookseq = rs.getInt(1) + 1;  
			rs.close();   pstmt.close();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookIn.getBook_kind());
			pstmt.setString(2, bookIn.getBookno());
			pstmt.setInt(3,bookseq);
			pstmt.setString(4, bookIn.getBookname());
			pstmt.setString(5, bookIn.getWrite());
			pstmt.setString(6, bookIn.getBookcredate());
			pstmt.setString(7, bookIn.getBookstate());
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	// 도서 출고 입력 
	public int boInsert(BookOut  bookOut) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		ResultSet rs = null;
		System.out.println("boInsert Start ");
		//  대여기간   =    반납예정기간 - 대여일자 
		String sql1 = "SELECT  TO_Date(To_char(?)) - To_Date(TO_CHAR(?))   FROM Dual";
		String sql="INSERT INTO  BookOut VALUES(?,?,?,?,TO_CHAR(TO_DATE(?),'YYYYMMDD'),TO_CHAR(TO_DATE(?),'YYYYMMDD'),?,'N',SYSDATE)";
		// 대여후 BookIn에 대여여부 'Y'  Setting
		String sql2="Update   BookIN SET   booklent_yn = 'Y'  "
				+           " WHERE  book_kind=? AND  bookno=? AND  bookseq=?";
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			System.out.println("boInsert write->"+bookOut.getBookRetDate());
			pstmt.setString(1, bookOut.getBookRetDate());
			pstmt.setString(2, bookOut.getBookLentDate());
			rs = pstmt.executeQuery();
			rs.next();
			// key인 num 1씩 증가, mysql auto_increment 또는 oracle sequence
			// sequence를 사용 : values(시퀀스명(board_seq).nextval,?,?...)
			int bookLentDay = rs.getInt(1) + 1;     // 대여기간
			rs.close();   pstmt.close();
			System.out.println("boInsert bookLentDay->"+bookLentDay);

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookOut.getBmno());
			pstmt.setString(2, bookOut.getBook_kind());
			pstmt.setString(3, bookOut.getBookno());
			pstmt.setInt(4,bookOut.getBookseq());
			pstmt.setString(5, bookOut.getBookLentDate());
			pstmt.setString(6, bookOut.getBookRetDate());
			pstmt.setInt(7, bookLentDay);   // 대여기간
				result = pstmt.executeUpdate();
			
			// 대여가 성공하면 입고Table에 대출여부 'Y' Setting
			if (result == 1) {
				System.out.println("boInsert sql2->"+sql2);
				System.out.println("boInsert getBook_kind->"+bookOut.getBook_kind());
				System.out.println("boInsert getBookno->"+bookOut.getBookno());
				System.out.println("boInsert getBookseq->"+bookOut.getBookseq());
			   rs.close();   pstmt.close();
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, bookOut.getBook_kind());
				pstmt.setString(2, bookOut.getBookno());
				pstmt.setInt(3,bookOut.getBookseq());
				result = pstmt.executeUpdate();
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public BookMember bmSelect(int bmno) throws SQLException {
		Connection conn = null;	Statement stmt= null; ResultSet rs = null;
		String sql = "select * from bookMember where bmno="+bmno;
		BookMember bookMember = new BookMember();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				bookMember.setBmno(rs.getInt("bmno"));
				bookMember.setPasswd(rs.getString("passwd"));
				bookMember.setBmname(rs.getString("bmname"));
				bookMember.setBmaddr(rs.getString("bmaddr"));
				bookMember.setBmtel(rs.getString("bmtel"));
				bookMember.setBmloc(rs.getString("bmloc"));
				bookMember.setBmgrade(rs.getString("bmgrade"));
				bookMember.setNoretcnt(rs.getInt("noretcnt"));
				bookMember.setLent_yn(rs.getString("lent_yn"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return bookMember;
		
	}	

	public BookIn  biSelect(BookIn bookIn1) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		ResultSet rs = null;
		String sql = "select * from BookIn  where book_kind=? and bookno=? "
	                                                     			+ "and bookseq=?";
		BookIn bookIn = new BookIn();
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookIn1.getBook_kind());
			pstmt.setString(2, bookIn1.getBookno());
			pstmt.setInt(3, bookIn1.getBookseq());

			rs = pstmt.executeQuery();
			if (rs.next()) {			

				bookIn.setBook_kind(rs.getString("book_kind"));
				bookIn.setBookno(rs.getString("bookno"));
				bookIn.setBookseq(rs.getInt("bookseq"));
				bookIn.setBookname(rs.getString("bookname"));
				bookIn.setWrite(rs.getString("write"));
				bookIn.setBookcredate(rs.getString("bookcredate"));
				bookIn.setBookstate(rs.getString("bookstate"));
				bookIn.setBooklent_yn(rs.getString("booklent_yn"));
				bookIn.setReg_date(rs.getDate("reg_date"));
			}
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return bookIn;
	}
	
	public int bmUpdate(BookMember bookMember) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update bookMember set passwd=?,bmname=?,bmaddr=?,"+
		                	"bmtel=?,bmloc=?,bmgrade=?,noretcnt=? where bmno=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
	        System.out.println("bmUpdate passwd->"+bookMember.getPasswd());
	        System.out.println("bmUpdate bmaddr->"+bookMember.getBmaddr());
	        System.out.println("bmUpdate bmgrade->"+bookMember.getBmgrade());

			pstmt.setString(1, bookMember.getPasswd());
			pstmt.setString(2, bookMember.getBmname());
			pstmt.setString(3, bookMember.getBmaddr());
			pstmt.setString(4, bookMember.getBmtel());
			pstmt.setString(5, bookMember.getBmloc());
			pstmt.setString(6, bookMember.getBmgrade());
			pstmt.setInt(7, bookMember.getNoretcnt());
			pstmt.setInt(8, bookMember.getBmno());
			
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}

	public int biUpdate(BookIn bookIn) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="update BookIn SET  bookname=?,write=?,bookcredate=?,"+
		                	"bookstate=?,booklent_yn=? where book_kind=? "
		                	+ "and bookno=? and  bookseq=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
					
			pstmt.setString(1, bookIn.getBookname());
			pstmt.setString(2, bookIn.getWrite());
			pstmt.setString(3, bookIn.getBookcredate());
			pstmt.setString(4, bookIn.getBookstate());
			pstmt.setString(5, bookIn.getBooklent_yn());
			pstmt.setString(6, bookIn.getBook_kind());
			pstmt.setString(7, bookIn.getBookno());
			pstmt.setInt(8, bookIn.getBookseq());
			result = pstmt.executeUpdate();
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	
	public int bmDelete(int bmno, String passwd) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;		    
		ResultSet rs = null;
		String sql1 = "select passwd From bookMember where bmno=?";
		String sql="delete From bookMember where bmno=?";
		try {
			String dbPasswd = "";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bmno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dbPasswd = rs.getString(1); 
				if (dbPasswd.equals(passwd)) {
					rs.close();  pstmt.close();
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, bmno);
					result = pstmt.executeUpdate();
				} else result = 0;
			} else result = -1;
		} catch(Exception e) {	System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	public int biDelete(BookIn bookIn) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;		    
		ResultSet rs = null;
		String sql="delete From BookIn  WHERE book_kind=? and bookno=? "
	                                                     			+ "and bookseq=?";
		try {
			       conn = getConnection();
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, bookIn.getBook_kind());
					pstmt.setString(2, bookIn.getBookno());
					pstmt.setInt(3, bookIn.getBookseq());
					result = pstmt.executeUpdate();
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		}
		return result;
	}
	
	
}
