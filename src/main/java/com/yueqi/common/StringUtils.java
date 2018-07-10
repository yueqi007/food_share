package com.yueqi.common;

import java.util.ArrayList;
import java.util.List;

public class StringUtils {
	
	public static List StringToList(String str) {
		List list = new ArrayList();
		String[] strings = str.split(",");
		for(String s:strings) {
			list.add(s);
		}
		return list;
	}

}
