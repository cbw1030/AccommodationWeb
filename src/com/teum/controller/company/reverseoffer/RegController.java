package com.teum.controller.company.reverseoffer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teum.dao.entity.OfferableRoomListView;
import com.teum.dao.entity.RoomImageListView;
import com.teum.entity.Acc;
import com.teum.entity.Offer;
import com.teum.entity.ReverseOffer;
import com.teum.service.AccService;
import com.teum.service.OfferService;
import com.teum.service.ReverseOfferService;
import com.teum.service.RoomImageService;
import com.teum.service.RoomService;

@WebServlet("/company/reverseOffer/reg")
public class RegController extends HttpServlet {

	private AccService accService;
	private OfferService offerService;
	private RoomService roomService;
	private RoomImageService roomImageService;
	private ReverseOfferService reverseOfferService;
	
	public RegController() {
		accService = new AccService();
		offerService = new OfferService();
		roomService = new RoomService();
		roomImageService = new RoomImageService();
		reverseOfferService = new ReverseOfferService();
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("email") == null) 		  // 로그인이 안된 경우
			response.sendRedirect("/signin");
		else if(((int)session.getAttribute("type")) != 1) // 기업이 아닌 경우
			response.sendRedirect("/index");
		else {
			int companyId = (int) session.getAttribute("id");
			
			
			
			/* -- 개인이 제안한 위치에 매칭되는 모든 숙소 불러오기 -- */
			List<Acc> accList = accService.getList(companyId);
			StringBuilder accIdsCSV = new StringBuilder();
			
			for (Acc acc : accList) {
				accIdsCSV.append(toString().valueOf(acc.getId()));
				accIdsCSV.append(",");
			}
			
			if (accIdsCSV.toString().equals("") || accIdsCSV.toString() == null)
				accIdsCSV.append("0,");
				
			accIdsCSV.delete(accIdsCSV.length() - 1, accIdsCSV.length()); // 마지막 콤마 삭제
			
			List<Offer> offerList = offerService.getList(accIdsCSV.toString());
			
			
			
			/*============================== Ajax ===============================*/
			int page = 1;
			int offerId = 0;
			String page_ = request.getParameter("page");
			String offerId_ = request.getParameter("offerId");
			
			// 개인회원이 보낸 제안이 최소 1개라도 있는 경우엔 첫 번째 제안을 디폴트 값으로 설정
			if(!offerList.isEmpty())
				offerId = offerList.get(0).getId();
			
			if(page_ != null && !page_.equals(""))
				page = Integer.parseInt(page_);
			
			if(offerId_ != null && !offerId_.equals(""))
				offerId = Integer.parseInt(offerId_);
			
			
			// 제안목록중 원하는 제안을 클릭한 경우 offerId에 클릭한 offer id를 대입
			if(offerId_ != null && !offerId_.equals(""))
				offerId = Integer.parseInt(offerId_);
			System.out.println("offerId: " + offerId);
			List<OfferableRoomListView> offerViewList = roomService.getOfferableRoomList(page, offerId);
			
			
			/* -- 개인이 제안한 위치에 매칭되는 모든 숙소의 id값을 CSV형식으로 뽑기 -- */
			StringBuilder offeredAccIdsCSV = new StringBuilder();
//			System.out.println("offerViewList: " + offerViewList.toString());
//			System.out.println("offeredAccIdsCSV: " + offeredAccIdsCSV);
			for (OfferableRoomListView offer : offerViewList) {
				offeredAccIdsCSV.append(toString().valueOf(offer.getAccId()));
				offeredAccIdsCSV.append(",");
			}
			
			if (offeredAccIdsCSV.toString().equals("") || offeredAccIdsCSV.toString() == null)
				offeredAccIdsCSV.append("0,");
			
			offeredAccIdsCSV.delete(offeredAccIdsCSV.length() - 1, offeredAccIdsCSV.length()); // 마지막 콤마 삭제
			
			
			
			/* -- offeredAccIdsCSV로 모든 방 리스트 불러오기(예약가능 여부는 밑에서 확인) -- */
			List<RoomImageListView> roomList = roomService.getList(offeredAccIdsCSV.toString());
			
			List<RoomImageListView> showRoomList = new ArrayList<>();
			
			
			StringBuilder offerdDatesCSV = new StringBuilder();
			/* -- 예약이 가능한 방 리스트만 뽑기 -- */
			for (OfferableRoomListView offer : offerViewList) {
				Date checkinDate = offer.getCheckinDate();
				Date checkoutDate = offer.getCheckoutDate();
				
				// 개인이 제안한 체크인 날짜 ~ 체크아웃 전날 날짜까지 추리기
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				
				while (checkinDate.compareTo(checkoutDate) <= 0) {
					offerdDatesCSV.append(sdf.format(checkinDate));
					offerdDatesCSV.append(",");
					Calendar c = Calendar.getInstance();
					c.setTime(checkinDate);
					c.add(Calendar.DAY_OF_MONTH, 1);
					checkinDate = c.getTime();
				}
				offerdDatesCSV.delete(offerdDatesCSV.length() - 12, offerdDatesCSV.length()); // 퇴실일 ~ 콤마까지 삭제
				
				System.out.printf("개인이 예약한 날짜(체크인~체크아웃-1): %s\n", offerdDatesCSV.toString());
				
					
			}
			
			
			
			
//			int index = 1;
			for (RoomImageListView room : roomList) {
				// ex) 만약 개인이 2020-01-01 ~ 2020-01-03 날짜로 제안이 오는 경우에는 offeredDates는 아래와 같다.
				// offeredDates = ["2020-01-01", "2020-01-02", "2020-01-03"];
				String[] offeredDates = offerdDatesCSV.toString().split(",");
				String bookedDate = room.getBookedDate();
				
				boolean isBook = true;
				
//				System.out.printf("%d번째 for문\n", index++);
//				System.out.println("offeredDates: " + Arrays.toString(offeredDates));
//				System.out.println("bookedDate: " + bookedDate);
//				System.out.println("showRoomList: " + showRoomList);
//				System.out.println();
				System.out.println(room.toString());
				// 방에 예약이 비어있으므로 보여줄 수 있음
				if (bookedDate == null || bookedDate.equals("")) {
					showRoomList.add(room);
					continue;
				}
				
				// 하루라도 예약날짜가 겹치면 isBook 상태를 false로 변경
				for (String offeredDate : offeredDates)
					if (bookedDate.contains(offeredDate)) {
						isBook = false;
						break;
					}
				
				// 하루도 예약이 겹치지 않았으므로 예약가능
				if (isBook)
					showRoomList.add(room);
			}
			
			
			
			
			
//			System.out.println("showRoomList: " + showRoomList.toString());
			
			/* -- 데이터 넘기기 -- */
			request.setAttribute("offerList", offerList);
			request.setAttribute("showRoomList", showRoomList);
			request.getRequestDispatcher("reg.jsp").forward(request, response);
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String roomId_ = request.getParameter("room-id");
		int roomId = 0;
		
		if (roomId_ != null && !roomId_.equals(""))
			roomId = Integer.parseInt(roomId_);
		
		
		int accId = roomService.getId(roomId);
		int offerId = offerService.getId(accId);
		
		ReverseOffer reverseOffer = new ReverseOffer(offerId, roomId);
		
		reverseOfferService.insert(reverseOffer);
		offerService.update(offerId);
		
		response.sendRedirect("/company/reverseOffer/detail");
		
		
		
		
		
		
		
//		int page = 1;
//		int offerId = 0;
//		String page_ = request.getParameter("page");
//		String offerId_ = request.getParameter("offerId");
//		
//		// 개인회원이 보낸 제안이 최소 1개라도 있는 경우엔 첫 번째 제안을 디폴트 값으로 설정
//		if(!offerList.isEmpty())
//			offerId = offerList.get(0).getId();
//		
//		if(page_ != null && !page_.equals(""))
//			page = Integer.parseInt(page_);
//		
//		List<OfferInfoView> oiv = roomService.getOfferInfoList(page, offerId);
//		
//		JSONArray jArray = new JSONArray();
//		
//		for(OfferInfoView o : oiv) {
//			JSONObject obj = new JSONObject();
//			obj.put("roomId", o.getRoomId());
//			obj.put("accId", o.getAccId());
//			obj.put("roomName", o.getRoomName());
//			obj.put("maxHeadcount", o.getMaxHeadcount());
//			obj.put("bedCount", o.getBedCount());
//			obj.put("fileName", o.getFileName());
//			obj.put("fileRoute", o.getFileRoute());
//			obj.put("price", o.getPrice());
//			obj.put("accName", o.getAccName());
//			
//			jArray.add(obj);
//		}
//		JSONObject obj = new JSONObject();
//		int offerCount = roomService.getOfferCount(offerId);
//		obj.put("offerCount", offerCount);
//		jArray.add(obj);
//		
//		response.setContentType("application/x-json; charset=UTF-8");
//		response.getWriter().print(jArray);
	}
}
