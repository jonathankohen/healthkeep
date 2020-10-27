package com.kohen.healthcare_emr.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kohen.healthcare_emr.models.Patient;
import com.kohen.healthcare_emr.models.Referral;
import com.kohen.healthcare_emr.repos.PatientRepo;
import com.kohen.healthcare_emr.repos.ReferralRepo;

@Service
public class PatientServ {

	private static PatientRepo patRepo;
	private static ReferralRepo refRepo;

	public PatientServ(PatientRepo patRepo, ReferralRepo refRepo) {
		PatientServ.patRepo = patRepo;
		PatientServ.refRepo = refRepo;
	}

	public Patient create(Patient newPat) {
		return patRepo.save(newPat);
	}

	public Referral create(Referral newRef) {
		newRef.setId(null);
		return refRepo.save(newRef);
	}

	public List<Patient> getPatients() {
		return (List<Patient>) patRepo.findAll();
	}

	public Patient getPatient(Long id) {
		Optional<Patient> patient = patRepo.findById(id);
		return patient.isPresent() ? patient.get() : null;
	}

	public Patient savePatient(Patient patient) {
		return patRepo.save(patient);
	}

	public Patient updatePatient(Patient toUpdate, Long id) {
		return patRepo.save(toUpdate);
	}

	public void delete(Long id) {
		patRepo.deleteById(id);
	}
}
