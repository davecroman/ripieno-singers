package com.ripienosingers.service;

import com.ripienosingers.model.HomepageSection;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;

@Service
public class HomepageContentService {

    @PersistenceContext
    EntityManager em;

    @Transactional
    public void addSection(HomepageSection section) {
        em.persist(section);
    }

    @Transactional
    public List<HomepageSection> listSections() {
        CriteriaQuery<HomepageSection> query = em.getCriteriaBuilder().createQuery(HomepageSection.class);
        query.from(HomepageSection.class);
        return em.createQuery(query).getResultList();
    }

}
