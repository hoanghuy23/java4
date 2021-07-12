package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.StoredProcedureQuery;
import javax.persistence.TypedQuery;



import edu.poly.model.Video;

public class VideoDAO extends AbstractEntityDAO<Video>{
	EntityManager em = JpaUtils.getEntityManager();
	public VideoDAO() {
		super(Video.class);
		// TODO Auto-generated constructor stub
	}
	public List<Video> findAllOrderByViewDesc() {
		em.clear();
		try {
			String sql = "SELECT v FROM Video v ORDER BY v.views DESC";
			TypedQuery<Video> query = em.createQuery(sql, Video.class);
			List<Video> list = query.getResultList();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	
	public List<Video>FindAllVideoView(int firstResult, int maxResult) {
		EntityManager entityManager = JpaUtils.getEntityManager();
		try {
			StoredProcedureQuery query = entityManager.createNamedStoredProcedureQuery("Video.SP_Pagination");
			 query.setParameter("@RowsPerPage", firstResult );
			 query.setParameter("@PageNumber", maxResult);
			return query.getResultList();
		} finally {
			entityManager.close();
		}
	}
	
	public List<Video> findOffsetVideo(){
		em.clear();
		try {
			String sql = "select v from Video v order by v.videoId OFFSET 6 ROWS";
			TypedQuery<Video> query = em.createQuery(sql, Video.class);
			List<Video> list = query.getResultList();
			return list;
		} catch (Exception e) {
			return null;
		}
	}
	
	public int getNumberPage() {
		Long total = this.countPage();
		int pageNumber = (int) (total/6);
		if(total %6 !=0) {
			pageNumber++;
		}
		return pageNumber;
}
	public Long countPage() {
		EntityManager entityManager = JpaUtils.getEntityManager();
		try {
			String sql = "SELECT count(v) FROM Video v ";
			TypedQuery<Long> query = entityManager.createQuery(sql,Long.class);
			return query.getSingleResult();
		} finally {
			entityManager.close();
		}
	}
}
