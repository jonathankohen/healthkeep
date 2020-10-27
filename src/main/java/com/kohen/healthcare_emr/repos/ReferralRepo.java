package com.kohen.healthcare_emr.repos;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kohen.healthcare_emr.models.Referral;

@Repository
public interface ReferralRepo extends CrudRepository<Referral, Long> {
}
