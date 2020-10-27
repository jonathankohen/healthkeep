package com.kohen.healthcare_emr.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kohen.healthcare_emr.models.Patient;
import com.kohen.healthcare_emr.models.Referral;
import com.kohen.healthcare_emr.models.User;
import com.kohen.healthcare_emr.services.PatientServ;
import com.kohen.healthcare_emr.services.UserServ;

@Controller
public class IndexController {
	private static PatientServ patServ;
	private static UserServ userServ;

	public IndexController(PatientServ patServ, UserServ userServ) {
		IndexController.patServ = patServ;
		IndexController.userServ = userServ;
	}

	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("allPatients", patServ.getPatients());
		model.addAttribute("allUserCount", userServ.getUsers().size());
		return "patients";
	}

	@GetMapping("/patients/new")
	public String addPatient(Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("newPatient", new Patient());
		return "addPatient";
	}

	@PostMapping("/patients/create_new")
	public String createPatient(@Valid @ModelAttribute("newPatient") Patient newPatient, BindingResult result,
			Model model, HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("newPatient", new Patient());
			return "addPatient";
		} else {
			User loggedInUser = (User) session.getAttribute("user");
			newPatient.setUser(loggedInUser);
			patServ.create(newPatient);
			return "redirect:/home";
		}
	}

	@GetMapping("/patients/{id}")
	public String displayPatient(@PathVariable("id") Long id, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (loggedInUser == null) {
			return "redirect:/";
		}
		model.addAttribute("singlePatient", patServ.getPatient(id));
		model.addAttribute("newReferral", new Referral());
		return "displayPatient";
	}

	@GetMapping("/patients/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Patient patient = patServ.getPatient(id);
		model.addAttribute("patient", patient);
		return "edit";
	}

	@PostMapping("/patients/{id}/edit")
	public String update(@Valid @ModelAttribute("patient") Patient patient, BindingResult result,
			@PathVariable("id") Long id) {
		if (result.hasErrors()) {
			return "edit";
		} else {
			patServ.updatePatient(patient, id);
			return "redirect:/patients/{id}";
		}
	}

	@PostMapping("/patients/{id}/delete")
	public String destroy(@PathVariable("id") Long id) {
		patServ.delete(id);
		return "redirect:/home";
	}

	@PostMapping("/patients/{id}/referral")
	public String referPatient(@Valid @ModelAttribute("newReferral") Referral newReferral, BindingResult result,
			@PathVariable("id") Long id, Model model, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("user");
		if (result.hasErrors()) {
			System.out.println(result);
			model.addAttribute("singlePatient", patServ.getPatient(id));
			return "displayPatient";
		}
		newReferral.setUser(loggedInUser);
		newReferral.setPatient(patServ.getPatient(id));
		patServ.create(newReferral);
		return "redirect:/patients/" + id;
	}
}