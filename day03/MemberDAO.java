package day03;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public MemberDAO() {
		con = DBConnect.getConnect();
		System.out.println("생성자 : "+con);
	}
	public ArrayList<MemberDTO> getList(){
		ArrayList<MemberDTO> list = new ArrayList<>();
		System.out.println("getlist 호출");
		
		String sql = "select * from members";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while( rs.next() ) {
				MemberDTO dto = new MemberDTO();
				
				dto.setId( rs.getString("id") );
				dto.setPwd( rs.getString("pwd") );
				dto.setName( rs.getString("name") );
				dto.setAddr( rs.getString("addr") );
				dto.setTel( rs.getString("tel") );
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public int delete( String id ) {
		System.out.println( "id : " + id );
		String sql = "delete from members where id='"+id+"'";
		//String sql = "delete from members where id=?";
		int result = 0;
		try {
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public int loginChk(String id, String pwd) {
		int result = 0;
		String sql = "select * from members where id='"+id+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if( rs.next() ) { //id 존재하면 실행
				if( rs.getString("pwd").equals(pwd) ) {
					result = 0;//로그인 성공
				}else {
					result = 1;//비밀번호가 틀린경우
				}
			}else { //아이디가 없는 경우
				result = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		String sql = "select * from members where id='"+id+"'";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if( rs.next() ) {
				dto = new MemberDTO();
				dto.setId( rs.getString("id") );
				dto.setPwd( rs.getString("pwd") );
				dto.setAddr( rs.getString("addr") );
				dto.setName( rs.getString("name") );
				dto.setTel( rs.getString("tel") );
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	public void register(MemberDTO dto) {
		String sql = "insert into members values(?,?,?,?,?)";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getTel());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void del(String id) {
		String sql = "delete from members where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void modify(MemberDTO dto) {
		String sql=
		"update members set pwd=?, name=?, addr=?, tel=? where id=?";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPwd());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getId());
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}













