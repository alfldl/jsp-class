package och10;

//DTO활용 : Data Transfer Object
public class Dept {
	private int deptno;
	private String dname;
	private String loc;
	// private로 선언 후 getter setter로 수정 -> 정보은폐(Encapsulation)
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
	
}
