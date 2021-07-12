package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.poly.domain.FavoriteUserReportShare;
import edu.poly.model.Share;

public class ShareDAO extends AbstractEntityDAO<Share>{

	public ShareDAO() {
		super(Share.class);
		// TODO Auto-generated constructor stub
	}
	
	public List<FavoriteUserReportShare> reportFavoritesSharesVideo(String videoId){
		String jpql = "select new edu.poly.domain.FavoriteUserReportShare(s.user.fullname, s.user.email, "
				+ "s.emails, s.shareDate) from Share s where s.video.videoId = :videoId";
		EntityManager em =JpaUtils.getEntityManager();
		List<FavoriteUserReportShare> list = null;
		try {
			TypedQuery<FavoriteUserReportShare> query = em.createQuery(jpql, FavoriteUserReportShare.class);
			
			query.setParameter("videoId", videoId);
			
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list;
	}

}
