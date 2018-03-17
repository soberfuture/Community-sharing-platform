package com.share.util;

import java.util.Random;

import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;
/*
 * 发送验证码
 * 如果无法发送，应该是发送短信条数到达限定值了，可以自己再找一个API接口
 * */
public class SendMsg {

	private static String url = "http://gw.api.taobao.com/router/rest";
	private static String appkey = "";//http://www.alidayu.com在阿里巴巴的大于平台注册就有了
	private static String secret = "";
	private static String type = "normal";
	private static String signname = "社区共享平台";
	private static String template = "";
	
	public static void sendMessage(String tel,String code) throws ApiException{
		TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		String param = "{\"name\":\""+tel+"\",\"code\":\""+code+"\"}";
		req.setSmsType(type);
		req.setSmsFreeSignName(signname);
		req.setSmsParamString(param);
		req.setSmsTemplateCode(template);
		req.setRecNum(tel);
		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		System.out.println(rsp.getBody());
	}
	
	public static String getRandom(){
		Random random = new Random();
		String str = "";
		for(int i=0;i<6;i++){
			int t = random.nextInt(10);
			str = str + String.valueOf(t);
		}
		return str;
	}
}
