package org.kosa.hello;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class CalcController {

	@GetMapping("/addForm")
	public String addForm() {
//		log.info("addForm()...");
		
		return "addForm";
	}
	
	@PostMapping("/add")
	public String add(int a, int b, Model model) {
//		log.info("addForm()...");
		model.addAttribute("result", a + b);
		return "add";
	}
	
	@PostMapping("/jsonCalc") 
	@ResponseBody 
	public Map<String, Object> jsonCalc(@RequestBody Map<String, Integer> map) {
		Map<String, Object> result = new HashMap<>();
		result.put("status", 0);
		result.put("result", map.get("a") + map.get("b"));
		result.put("a", map.get("a"));
		result.put("b", map.get("b"));
		return result;
	}
}
