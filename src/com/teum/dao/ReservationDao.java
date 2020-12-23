package com.teum.dao;

import java.util.Date;
import java.util.List;

import com.teum.dao.entity.PrivateReservationListView;
import com.teum.dao.entity.ReservationDetailView;
import com.teum.dao.entity.ReservationForCompanyView;
import com.teum.dao.entity.ReservationListView;
import com.teum.dao.entity.ReviewView;
import com.teum.entity.Reservation;

public interface ReservationDao {

	List<ReservationListView> getListByUser(int startIndex, int endIndex,int id);

	int getCount(int userId);

	List<ReservationForCompanyView> getList(int startIndex, int endIndex, String accIdsCSV, int accType);

	int getItemCount(String accIdsCSV, int accType);


	int update(Reservation rese);

	ReviewView get(int userId, int id);

	ReservationDetailView getDetail(int id);

	List<ReservationDetailView> getList(int accId);

	List<ReviewView> getReviewList(int accId);

	int getAvg(int accId);

	int getReviewCount(int accId);
  
  
	List<PrivateReservationListView> getPrivateList(int id, int startIndex, int endIndex);

	int getPrivateCount(int userId);

	int insert(int accId, int roomId, Date checkinDate, Date checkoutDate, int userId, int price, int headcount);

	int update(int id);

	Reservation get(int id);

}
