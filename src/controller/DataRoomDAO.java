package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

	public class DataRoomDAO {
		
		Connection con;
		PreparedStatement psmt;
		ResultSet rs;
		
		public DataRoomDAO() {
		try {
			
			Context initCtx	= new InitialContext();
			
				/*Context ctx	= (Context)initCtx.lookup("java:comp/env");
				DataSource source = (DataSource)ctx.lookup("jdbc/myoracle");
				*/
				//위 2번의 lookup을 아래 1번으로 병합할 수 있다.
			
			
			DataSource source = (DataSource)initCtx.lookup("java:comp/env/jdbc/myoracle");
			
			
			con = source.getConnection();
	
		}
		catch(Exception e) {
			System.out.println("DBCP 연결실패");
			e.printStackTrace();
		}
		
	}
		//자원반납하기 : DB연결 자체를 끊는것이 아니라 커넥션풀에 커넥션개체를 반납하는 것
		
		public void close() {
			try {
				if(rs!= null) rs.close();
				if(psmt!= null) psmt.close();
				if(con!= null) con.close();
			}
			catch(Exception e) {
				System.out.println("자원반납시 예외발생");
				e.printStackTrace();
			}
		}
		
		//자료실 게시판의 전체 레코드 갯수 카운트
		public int getTotalRecordCount(Map map) {
			
			int totalCount = 0;
			try {
				String sql = "SELECT COUNT (*) FROM dataroom ";
				
				if(map.get("Word")!=null) {
					sql+=" WHERE " + map.get("Column") + " "
						+ " LIKE '%" +map.get("Word")+"%' ";
				}
				
				psmt = con.prepareStatement(sql);
				rs = psmt.executeQuery();
				rs.next();
				totalCount = rs.getInt(1);
			}
			catch(Exception e) {}
			return totalCount;
		}
		
		//게시물 리스트 출력하기(페이지처리 X)
		public List<DataRoomDTO> selectList(Map map){
			
			List<DataRoomDTO> bbs = new Vector<DataRoomDTO>();
			
			String sql = "SELECT * FROM dataroom ";
			if(map.get("Word")!=null) {
				sql+=" WHERE " +map.get("Column")+" "
					+ " LIKE '%" + map.get("Word")+"%' ";
			}
			sql += " ORDER BY idx DESC";
			
			try {
				psmt = con.prepareStatement(sql);
				rs=psmt.executeQuery();
				while(rs.next()) {
					
					DataRoomDTO dto = new DataRoomDTO();
					
					dto.setIdx(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setPostdate(rs.getDate(5));
					dto.setAttachedfile(rs.getString(6));
					dto.setDowncount(rs.getInt(7));
					dto.setPass(rs.getString(8));
					dto.setVisitcount(rs.getInt(9));
					
					bbs.add(dto);
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return bbs;
		}
		
		//자료실 글쓰기 처리
		public int insert(DataRoomDTO dto) {
			
			int affected = 0;
			
			try {
				String sql = "INSERT INTO dataroom ("
						+ " idx, title, name, content, attachedfile, pass, downcount) "
						+ " VALUES ("
						+ " dataroom_seq.NEXTVAL, ?,?,?,?,?,0)";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getName());
				psmt.setString(3, dto.getContent());
				psmt.setString(4, dto.getAttachedfile());
				psmt.setString(5, dto.getPass());
				
				//insert성공시 1반환, 실패시 0반환
				affected = psmt.executeUpdate();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return affected;
		}
		
		public void updateVisitCount(String idx) {
			
			String sql = "UPDATE dataroom SET "
					+ " visitcount=visitcount+1 "
					+ " WHERE idx=? ";
			
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1,idx);
				psmt.executeUpdate();
			}
			catch (Exception e) {
				
			}
		}
		
		public DataRoomDTO selectView(String idx) {
			
			DataRoomDTO dto = null;
			String sql = "SELECT * FROM dataroom "
					+ " WHERE idx=? ";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, idx);
				rs=psmt.executeQuery();
				
				if(rs.next()) {
					dto = new DataRoomDTO();
					
					dto.setIdx(rs.getString(1));
					dto.setName(rs.getString(2));
					dto.setTitle(rs.getString(3));
					dto.setContent(rs.getString(4));
					dto.setPostdate(rs.getDate(5));
					dto.setAttachedfile(rs.getString(6));
					dto.setDowncount(rs.getInt(7));
					dto.setPass(rs.getString(8));
					dto.setVisitcount(rs.getInt(9));
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			return dto;
		}
		
		public boolean isCorrectPassword(String pass, String idx) {
			boolean isCorr = true;
			try {
				String sql = "SELECT COUNT (*) FROM dataroom "
						+ " WHERE pass=? AND idx=? ";
				
				psmt=con.prepareStatement(sql);
				psmt.setString(1, pass);
				psmt.setString(2, idx);
				rs = psmt.executeQuery();
				rs.next();
				if(rs.getInt(1)==0) {
					isCorr = false;
					
				}
			}
			catch (Exception e) {
				isCorr = false;
				e.printStackTrace();
			}
			return isCorr;
		}
		
		
		public int delete(String idx) {
			int affected = 0;
			try {
				String query = "DELETE FROM dataroom "
						+ " WHERE idx=? ";
				
				psmt=con.prepareStatement(query);
				psmt.setString(1, idx);
				
				affected = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("delete중 예외발생");
				e.printStackTrace();
			}
			
			return affected;
		}
}