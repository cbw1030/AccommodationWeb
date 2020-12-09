package com.teum.dao;

import java.util.List;

import com.teum.entity.QnA;

public interface QnADao {
	
	int insert(QnA qna);
	int update(QnA qna);
	int delete(int id);
	
	QnA get(int id);
	List<QnA> getList();
}
