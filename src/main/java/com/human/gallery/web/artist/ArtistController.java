package com.human.gallery.web.artist;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import com.human.gallery.domain.user.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/artist")
@Controller
public class ArtistController {


	@Value("${file.dir}")
	private String fileDir;
	@GetMapping("")
	public String viewArtist(@SessionAttribute(name = "user", required = false) Users user, Model model) {

		model.addAttribute("user",user);
		return "artist/artist";
	}
	@RequestMapping("/upload")
	public String viewUpload(@SessionAttribute(name = "user", required = false) Users user, Model model) {

		model.addAttribute("user",user);
		return "artist/uploadArtist";
	}
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String doUpload(@RequestParam("name") String name,
							@RequestParam("career") String career,
							@RequestParam("direction") String direction,
							@RequestParam("file") MultipartFile file
							) throws IllegalStateException, IOException {

		log.info("name = {}", name);
		log.info("career = {}", career);
		log.info("direction = {}", direction);
		log.info("MultipartFile = {}", file);

		if (!file.isEmpty()) {
			String fullPath = fileDir + file.getOriginalFilename();
			log.info("파일 경로 fullPath = {}", fullPath);
			file.transferTo(new File(fullPath));
		}
		return "redirect:/artist";
	}
	public String aaa() {
		return null;
	}
}
