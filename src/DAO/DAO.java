package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import JDBC.JDBC;
import VO.MVO;
import VO.RVO;
import VO.SVO;

public class DAO {
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement stmt = null;
	
	public ArrayList<MVO> getM(){
		ArrayList<MVO> M = null;
		
		try {
			conn = JDBC.getConnection();
			String sql = "select id, name, birth, decode(gender, 'M','남성','F','여성') gender, decode(talent, '1','보컬','2','댄스','3','랩') talent, agency from tbl_a order by id asc";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			M = new ArrayList<MVO>();
			
			while(rs.next()) {
				MVO m = new MVO();
				
				m.setAgency(rs.getString("agency"));
				m.setBirth(rs.getString("birth"));
				m.setGender(rs.getString("gender"));
				m.setName(rs.getString("name"));
				m.setNo(rs.getString("id"));
				m.setTalent(rs.getString("talent"));
				
				M.add(m);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, conn, stmt);
		}
		return M;
	}

	public ArrayList<SVO> getS(){
		ArrayList<SVO> S = null;
		
		try {
			conn = JDBC.getConnection();
			String sql = "select a.id, name, birth, sum(point) point, mname from tbl_a a, tbl_m m, tbl_p p where a.id = p.id and p.mid = m.mid group by a.id, name, birth, mname order by a.id asc";
			stmt=  conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			S = new ArrayList<SVO>();
			
			while(rs.next()) {
				
				String renk = "";
				
				int point = rs.getInt("point");
				
				if(point >= 90) {
					renk = "A";
				}else if(point >= 80){
					renk = "B";
				}else if(point >= 70) {
					renk = "C";
				}else if(point >= 60) {
					renk = "D";
				}else if(point >= 50) {
					renk = "E";
				}else {
					renk = "F";
				}
				
				SVO s= new SVO();
				
				s.setBrith(rs.getString("birth"));
				s.setId(rs.getString("id"));
				s.setMname(rs.getString("mname"));
				s.setName(rs.getString("name"));
				s.setPoint(point);
				s.setRenk(renk);
				
				
				S.add(s);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, conn, stmt);
		}
		return S;
	}

	public ArrayList<RVO> getR(){
		ArrayList<RVO> R = null;
		
		try {
			conn = JDBC.getConnection();
			String sql = "select a.id, name, sum(point) sum, round(avg(point),2) avg from tbl_a a, tbl_p p where a.id = p.id group by a.id, name order by sum desc";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			R = new ArrayList<RVO>();
			
			while(rs.next()) {
				RVO r = new RVO();
				
				r.setAvg(rs.getDouble("avg"));
				r.setId(rs.getString("id"));
				r.setName(rs.getString("name"));
				r.setSum(rs.getInt("sum"));
				
				R.add(r);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, conn, stmt);
		}
		return R;
	}

	public int add(MVO vo) {
		int cnt = 0;
		
		try {
			conn = JDBC.getConnection();
			String sql = "insert into tbl_a values(?,?,?,?,?,?) ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getNo());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getBirth());
			stmt.setString(4, vo.getGender());
			stmt.setString(5, vo.getTalent());
			stmt.setString(6, vo.getAgency());
			
			cnt = stmt.executeUpdate();
			
			if(cnt > 0) {
				conn.commit();
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			JDBC.close(conn, stmt);
		}
		return cnt;
	}

	public MVO getM(String no) {
		MVO m = null;
		
		try {
			conn = JDBC.getConnection();
			String sql = "select * from tbl_a where id=? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, no);
			rs =stmt.executeQuery();
			
			
			
			if(rs.next()) {
				m = new MVO();
				
				m.setAgency(rs.getString("agency"));
				m.setBirth(rs.getString("birth"));
				m.setGender(rs.getString("gender"));
				m.setName(rs.getString("name"));
				m.setNo(rs.getString("id"));
				m.setTalent(rs.getString("talent"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBC.close(rs, conn, stmt);
		}
		return m;
	}

	public int update(MVO vo, String no) {
		int cnt = 0;
		
		try {
			conn = JDBC.getConnection();
			String sql = "update TBL_A set name=?, birth=?, gender=?, talent=?, agency=? where id=? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, vo.getName());
			stmt.setString(2, vo.getBirth());
			stmt.setString(3, vo.getGender());
			stmt.setString(4, vo.getTalent());
			stmt.setString(5, vo.getAgency());
			stmt.setString(6, no);
			
			cnt = stmt.executeUpdate();
			
			if(cnt > 0) {
				conn.commit();
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			JDBC.close(conn, stmt);
		}
		return cnt;
	}

	public int delete(String no) {
		int cnt = 0;
		
		try {
			conn = JDBC.getConnection();
			String sql = "delete TBL_A where id=? ";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, no);
			
			cnt = stmt.executeUpdate();
			
			if(cnt > 0) {
				conn.commit();
			}
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally {
			JDBC.close(conn, stmt);
		}
		return cnt;
	}
}
