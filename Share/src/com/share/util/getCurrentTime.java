package com.share.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class getCurrentTime {
	public static String gettime(){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = format.format(new Date());
		return time;
	}
	
	public static Double gettotal(String start,String stop,Double price) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date datestart = sdf.parse(start);
		Date datestop = sdf.parse(stop);
		Long diff = datestop.getTime()-datestart.getTime();
		Double total = (1+diff/(1000*60*60))*price;
		return total;
	}
}
