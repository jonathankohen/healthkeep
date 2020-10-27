package com.kohen.healthcare_emr.repos;

import org.springframework.data.repository.CrudRepository;

import com.kohen.healthcare_emr.models.Patient;

public interface PatientRepo extends CrudRepository<Patient, Long> {

}
