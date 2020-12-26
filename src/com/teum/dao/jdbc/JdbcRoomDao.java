package com.teum.dao.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.teum.dao.RoomDao;
import com.teum.dao.entity.OfferInfoView;
import com.teum.dao.entity.OfferableRoomListView;
import com.teum.dao.entity.PayInfoView;
import com.teum.dao.entity.ReverseListView;
import com.teum.dao.entity.RoomImageListView;
import com.teum.entity.Room;

public class JdbcRoomDao implements RoomDao {

	@Override
	public int insert(Room room) {
		int result = 0;

		String url = DBContext.URL;
		String sql = "INSERT INTO ROOM(NAME, PRICE, ACC_ID, MAX_HEADCOUNT, BED_COUNT) VALUES(?, ?, ?, ?, ?)";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, room.getName());
			pst.setInt(2, room.getPrice());
			pst.setInt(3, room.getAccId());
			pst.setInt(4, room.getMaxHeadcount());
			pst.setInt(5, room.getBedCount());

			result = pst.executeUpdate();

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return result;
	}
 
	@Override
	public Room getLast() {
		// 마지막 인덱스의 event를 뽑아오는 쿼리문을 작성하자
		Room room = null;

		String url = DBContext.URL;
		String sql = "SELECT * FROM ROOM WHERE ID = (SELECT MAX(ID) FROM ROOM)";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt("ID");
				String name = rs.getString("NAME");
				int accId = rs.getInt("ACC_ID");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");

				room = new Room();

				room.setId(id);
				room.setName(name);
				room.setAccId(accId);
				room.setMaxHeadcount(maxHeadcount);
				room.setBedCount(bedCount);
			}

			// 꼭 닫아줘야함!!! 안그럼 나중에 오류남
			rs.close();
			st.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return room;
	}

	@Override
	public List<RoomImageListView> getList(String accIdsCSV) {
		List<RoomImageListView> list = new ArrayList<>();
		
		String url = DBContext.URL;
		String sql = String.format("SELECT * FROM ROOM_IMAGE_LIST_VIEW WHERE ACC_ID IN (%s)", accIdsCSV);

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID");
				String name = rs.getString("NAME");
				int accId = rs.getInt("ACC_ID");
				int price = rs.getInt("PRICE");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");
				String bookedDate = rs.getString("BOOKED_DATE");
				String filename = rs.getString("FILENAME");
				String fileroute = rs.getString("FILEROUTE");

				RoomImageListView room = new RoomImageListView();

				room.setId(id);
				room.setName(name);
				room.setAccId(accId);
				room.setPrice(price);
				room.setMaxHeadcount(maxHeadcount);
				room.setBedCount(bedCount);
				room.setBookedDate(bookedDate);
				room.setFilename(filename);
				room.setFileroute(fileroute);

				list.add(room);
			}

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<OfferInfoView> getOfferInfoList(int startIndex, int endIndex, int offerId) {
		String url = DBContext.URL;
		String dbid = DBContext.UID;
		String dbpwd = DBContext.PWD;

		String sql = "SELECT * FROM (SELECT ROWNUM RN, OFFER_INFO_VIEW.* FROM OFFER_INFO_VIEW WHERE OFFER_ID=?) WHERE RN BETWEEN ? AND ?";

		List<OfferInfoView> list = new ArrayList<>();
		// DriverManager;//Class.forName~
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, dbid, dbpwd);
			// String sql = "SELECT * FROM MEMBER WHERE TYPE = ?";
			// PreparedStatement ps = con.prepareStatement(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, offerId);
			ps.setInt(2, startIndex);
			ps.setInt(3, endIndex);
//			if(!field.equals("")) {
//			}
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int roomId = rs.getInt("room_id");
				String roomName = rs.getString("room_name");
				int accId = rs.getInt("acc_id");
				int price = rs.getInt("price");
				int maxHeadcount = rs.getInt("max_headcount");
				int bedCount = rs.getInt("bed_count");
				String fileName = rs.getString("filename");
				String fileRoute = rs.getString("fileroute");
				String accName = rs.getString("acc_name");

				OfferInfoView oiv = new OfferInfoView();
				oiv.setRoomId(roomId);
				oiv.setRoomName(roomName);
				oiv.setMaxHeadcount(maxHeadcount);
				oiv.setBedCount(bedCount);
				oiv.setFileName(fileName);
				oiv.setFileRoute(fileRoute);
				oiv.setAccId(accId);
				oiv.setPrice(price);
				oiv.setAccName(accName);

				list.add(oiv);
				System.out.println(oiv);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<OfferableRoomListView> getOfferableRoomList(int startIndex, int endIndex, int offerId) {
		String url = DBContext.URL;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, OFFERABLE_ROOM_LIST_VIEW.* FROM OFFERABLE_ROOM_LIST_VIEW WHERE OFFER_ID=?) WHERE RN BETWEEN ? AND ?";

		List<OfferableRoomListView> list = new ArrayList<>();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, offerId);
			ps.setInt(2, startIndex);
			ps.setInt(3, endIndex);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID");
				String name = rs.getString("NAME");
				int price = rs.getInt("PRICE");
				int accId = rs.getInt("ACC_ID");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");
				String bookedDate = rs.getString("BOOKED_DATE");
				int roomImageId = rs.getInt("ROOM_IMAGE_ID");
				String fileName = rs.getString("FILENAME");
				String fileRoute = rs.getString("FILEROUTE");
				Date checkinDate = rs.getDate("CHECKIN_DATE");
				Date checkoutDate = rs.getDate("CHECKOUT_DATE");

				OfferableRoomListView orlv = new OfferableRoomListView();

				orlv.setId(id);
				orlv.setName(name);
				orlv.setPrice(price);
				orlv.setAccId(accId);
				orlv.setMaxHeadcount(maxHeadcount);
				orlv.setBookedDate(bookedDate);
				orlv.setBedCount(bedCount);
				orlv.setRoomImageId(roomImageId);
				orlv.setFileName(fileName);
				orlv.setFileRoute(fileRoute);
				orlv.setCheckinDate(checkinDate);
				orlv.setCheckoutDate(checkoutDate);

				list.add(orlv);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int getOfferCount(int offerId) {
		int result = 0;
		String url = DBContext.URL;
		String dbid = DBContext.UID;
		String dbpwd = DBContext.PWD;

		String sql = "SELECT COUNT(*) FROM OFFER_INFO_VIEW WHERE FILENAME LIKE '%메인%' AND OFFER_ID=?";

		// DriverManager;//Class.forName~
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, dbid, dbpwd);
			// String sql = "SELECT * FROM MEMBER WHERE TYPE = ?";
			// PreparedStatement ps = con.prepareStatement(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, offerId);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				result = rs.getInt(1);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block

			e.printStackTrace();
		}

		return result;
	}

	@Override
	public int getId(int roomId) {
		int result = 0;

		String url = DBContext.URL;
		String sql = "SELECT ACC_ID FROM ROOM WHERE ID = ?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, roomId);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				result = rs.getInt("ACC_ID");
			}

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public ReverseListView get(int roomId) {
		ReverseListView room = null;

		String url = DBContext.URL;
		String sql = "SELECT * FROM REVERSE_LIST_VIEW WHERE ROOM_ID = ?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, roomId);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int accId = rs.getInt("ACC_ID");
				int offerId = rs.getInt("OFFER_ID");
				String roomName = rs.getString("NAME");
				int roomPrice = rs.getInt("PRICE");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");
				String bookedDate = rs.getString("BOOKED_DATE");
				Date approvalDate = rs.getDate("APPROVAL_DATE");
				String filename = rs.getString("FILENAME");
				String fileroute = rs.getString("FILEROUTE");

				room = new ReverseListView(
						accId, offerId, roomId,
						roomName, roomPrice, maxHeadcount, 
						bedCount, bookedDate, approvalDate, 
						filename, fileroute);
			}

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return room;
	}

	@Override
	public List<RoomImageListView> getViewList(int accId) {
		List<RoomImageListView> list = new ArrayList<>();

		String url = DBContext.URL;
		String sql = "SELECT * FROM ROOM_IMAGE_LIST_VIEW WHERE ACC_ID = ?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, accId);
			
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID");
				String name = rs.getString("NAME");
				int price = rs.getInt("PRICE");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");
				String bookedDate = rs.getString("BOOKED_DATE");
				String filename = rs.getString("FILENAME");
				String fileroute = rs.getString("FILEROUTE");

				RoomImageListView roomImageListView = new RoomImageListView();

				roomImageListView.setId(id);
				roomImageListView.setName(name);
				roomImageListView.setAccId(accId);
				roomImageListView.setPrice(price);
				roomImageListView.setMaxHeadcount(maxHeadcount);
				roomImageListView.setBedCount(bedCount);
				roomImageListView.setBookedDate(bookedDate);
				roomImageListView.setFilename(filename);
				roomImageListView.setFileroute(fileroute);

				list.add(roomImageListView);
			}

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public PayInfoView getList(int accId, int roomId) {
		PayInfoView payInfoView = null;

		String url = DBContext.URL;
		String sql = "SELECT * FROM PAY_INFO_VIEW WHERE ACC_ID = ? AND ROOM_ID = ?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, accId);
			pst.setInt(2, roomId);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				String accName = rs.getString("ACC_NAME");
				String roomName = rs.getString("ROOM_NAME");
				String bookedDate = rs.getString("BOOKED_DATE");
				int price = rs.getInt("PRICE");
				
				payInfoView = new PayInfoView(accId, roomId, accName, roomName, bookedDate, price);
			}

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return payInfoView;
	}

	@Override
	public int update(int accId, int roomId, String bookedDates) {
		int result = 0;
		
		String url = DBContext.URL;
		String sql = "UPDATE ROOM SET BOOKED_DATE=? WHERE ACC_ID=? AND ID=?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, bookedDates);
			pst.setInt(2, accId);
			pst.setInt(3, roomId);

			result = pst.executeUpdate();

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public Room getRoom(int roomId) {
		Room room = null;

		String url = DBContext.URL;
		String sql = "SELECT * FROM ROOM WHERE ID = ?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, roomId);

			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID");
				String name = rs.getString("NAME");
				int price = rs.getInt("PRICE");
				int accId = rs.getInt("ACC_ID");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");
				String bookedDate = rs.getString("BOOKED_DATE");

				room = new Room(
						id, name, price,
						accId, maxHeadcount, bedCount, 
						bookedDate);
			}

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return room;
	}

	@Override
	public int update(int roomId, String newBookedDatesString) {
		int result = 0;
		
		String url = DBContext.URL;
		String sql = "UPDATE ROOM SET BOOKED_DATE=? WHERE ID=?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, newBookedDatesString);
			pst.setInt(2, roomId);

			result = pst.executeUpdate();

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Room> getPriceList(int chk) {
		List<Room> list = new ArrayList<>();

		String url = DBContext.URL;
		String sql = "SELECT *FROM ROOM WHERE ACC_ID =?";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setInt(1, chk);
			
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				int id = rs.getInt("ID");
				String name = rs.getString("NAME");
				int price = rs.getInt("PRICE");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");
			

				Room r = new Room();
				r.setId(id);
				r.setAccId(chk);
				r.setName(name);
				r.setPrice(price);
				r.setMaxHeadcount(maxHeadcount);
				r.setBedCount(bedCount);

				list.add(r);
			}

			pst.close();
			con.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int updatePrice(Room room) {
		int result =0;
		
		String url = DBContext.URL;
		String sql = "UPDATE ROOM SET PRICE=? WHERE ID=? AND ACC_ID=?";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement st =con.prepareStatement(sql);
			st.setInt(1, room.getPrice());
			st.setInt(2, room.getId());
			st.setInt(3, room.getAccId());
		
			//ResultSet rs = st.executeQuery(sql); // select 문장에만
			result =st.executeUpdate();//insert,update,delete 문장일 떄
			
			st.close();
			con.close();
			
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	public List<ReverseListView> getReversedRoomList(int startIndex, int endIndex, int offerId) {
		String url = DBContext.URL;
		String sql = "SELECT * FROM (SELECT ROWNUM RN, REVERSE_LIST_VIEW.* FROM REVERSE_LIST_VIEW WHERE OFFER_ID=?) WHERE RN BETWEEN ? AND ?";

		List<ReverseListView> list = new ArrayList<>();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, offerId);
			ps.setInt(2, startIndex);
			ps.setInt(3, endIndex);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				int roomId = rs.getInt("room_id");
				String roomName = rs.getString("NAME");
				int roomPrice = rs.getInt("PRICE");
				int accId = rs.getInt("ACC_ID");
				int maxHeadcount = rs.getInt("MAX_HEADCOUNT");
				int bedCount = rs.getInt("BED_COUNT");
				String bookedDate = rs.getString("BOOKED_DATE");
				Date approvalDate = rs.getDate("APPROVAL_DATE");
				String fileName = rs.getString("FILENAME");
				String fileRoute = rs.getString("FILEROUTE");

				ReverseListView rlv = new ReverseListView();

				rlv.setRoomId(roomId);
				rlv.setOfferId(offerId);
				rlv.setRoomName(roomName);
				rlv.setRoomPrice(roomPrice);
				rlv.setMaxHeadcount(maxHeadcount);
				rlv.setAccId(accId);
				rlv.setBookedDate(bookedDate);
				rlv.setBedCount(bedCount);
				rlv.setApprovalDate(approvalDate);
				rlv.setFilename(fileName);
				rlv.setFileroute(fileRoute);

				list.add(rlv);
			}

			rs.close();
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int getPrice(int id) {
		int result =0;
		
		
		String url = DBContext.URL;
		String sql = "SELECT AVG(PRICE) FROM ROOM WHERE ACC_ID=?";
		System.out.println(id);
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url, DBContext.UID, DBContext.PWD);
			PreparedStatement st =con.prepareStatement(sql);
			st.setInt(1, id);
		
			ResultSet rs = st.executeQuery(); // select 문장에만
			
			while(rs.next()) {
				result = rs.getInt(1);
			}
			
			rs.close();
			st.close();
			con.close();
			
		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
