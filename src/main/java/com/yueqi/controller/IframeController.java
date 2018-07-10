package com.yueqi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("iframe")
public class IframeController extends BaserController {

	@RequestMapping("pic")
	public String toPicIframe() {
		return "iframe/pic";
	}
}
