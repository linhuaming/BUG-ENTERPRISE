package com.fh.controller.web;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import com.fh.entity.system.User;
import com.fh.service.system.fhlog.FHlogManager;
import com.fh.service.system.loginimg.LogInImgManager;
import com.fh.service.system.user.UserManager;
import com.fh.util.*;
import net.sf.json.JSONObject;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fh.controller.base.BaseController;
import com.fh.service.system.blacklist.BlacklistManager;
import com.fh.service.system.statistics.StatisticsManager;
import com.fh.service.web.leavemsg.LeavemsgManager;
import com.fh.service.web.news.NewsManager;

/** 
 * 说明：访问首页)
 * 创建人：FH Q313596790
 * 修改时间：2018-06-30
 */
@Controller
@RequestMapping(value="/web")
public class WebController extends BaseController {

	@Resource(name="leavemsgService")
	private LeavemsgManager leavemsgService;
	@Resource(name="newsService")
	private NewsManager newsService;
	@Resource(name="statisticsService")
	private StatisticsManager statisticsService;
	@Resource(name="blacklistService")
	private BlacklistManager blacklistService;
	@Resource(name="loginimgService")
	private LogInImgManager loginimgService;
	@Resource(name = "userService")
	private UserManager userService;
	@Resource(name = "fhlogService")
	private FHlogManager FHLOG;
	/**访问登录页
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="login")
	public ModelAndView toLogin()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = this.setLoginPd(pd);	//设置登录页面的配置参数
		mv.setViewName("web/login");
		mv.addObject("pd",pd);
		return mv;
	}
	/**设置登录页面的配置参数
	 * @param pd
	 * @return
	 */
	public PageData setLoginPd(PageData pd){
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); 		//读取系统名称
		String strLOGINEDIT = Tools.readTxtFile(Const.LOGINEDIT);	//读取登录页面配置
		if(null != strLOGINEDIT && !"".equals(strLOGINEDIT)){
			String strLo[] = strLOGINEDIT.split(",fh,");
			if(strLo.length == 2){
				pd.put("isZhuce", strLo[0]);
				pd.put("isMusic", strLo[1]);
			}
		}
		try {
			List<PageData> listImg = loginimgService.listAll(pd);	//登录背景图片
			pd.put("listImg", listImg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pd;
	}
	/**请求登录，验证用户
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "login_login", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Object login() throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String errInfo = "";
		String KEYDATA[] = pd.getString("KEYDATA").replaceAll("qq313596790fh", "").replaceAll("QQ978336446fh", "").split(",fh,");
		if (null != KEYDATA && KEYDATA.length == 3) {
			Session session = Jurisdiction.getSession();
			String sessionCode = (String) session.getAttribute(Const.SESSION_SECURITY_CODE);        //获取session中的验证码
			String code = KEYDATA[2];
			if (null == code || "".equals(code)) {//判断效验码
				errInfo = "nullcode";            //效验码为空
			} else {
				String USERNAME = KEYDATA[0];    //登录过来的用户名
				String PASSWORD = KEYDATA[1];    //登录过来的密码
				pd.put("USERNAME", USERNAME);
				if (Tools.notEmpty(sessionCode) && sessionCode.equalsIgnoreCase(code)) {        //判断登录验证码
					String passwd = new SimpleHash("SHA-1", USERNAME, PASSWORD).toString();    //密码加密
					pd.put("PASSWORD", passwd);
					pd = userService.getUserByNameAndPwd(pd);    //根据用户名和密码去读取用户信息
					if (pd != null) {
						pd.put("LAST_LOGIN", DateUtil.getTime().toString());
						userService.updateLastLogin(pd);
						User user = new User();
						user.setUSER_ID(pd.getString("USER_ID"));
						user.setUSERNAME(pd.getString("USERNAME"));
						user.setPASSWORD(pd.getString("PASSWORD"));
						user.setNAME(pd.getString("NAME"));
						user.setRIGHTS(pd.getString("RIGHTS"));
						user.setROLE_ID(pd.getString("ROLE_ID"));
						user.setLAST_LOGIN(pd.getString("LAST_LOGIN"));
						user.setIP(pd.getString("IP"));
						user.setSTATUS(pd.getString("STATUS"));
						session.setAttribute(Const.SESSION_USER, user);            //把用户信息放session中
						session.removeAttribute(Const.SESSION_SECURITY_CODE);    //清除登录验证码的session
						//shiro加入身份验证
						Subject subject = SecurityUtils.getSubject();
						UsernamePasswordToken token = new UsernamePasswordToken(USERNAME, PASSWORD);
						try {
							subject.login(token);
						} catch (AuthenticationException e) {
							errInfo = "身份验证失败！";
						}
					} else {
						errInfo = "usererror";                //用户名或密码有误
						logBefore(logger, USERNAME + "登录系统密码或用户名错误");
						FHLOG.save(USERNAME, "登录系统密码或用户名错误");
					}
				} else {
					errInfo = "codeerror";                    //验证码输入有误
				}
				if (Tools.isEmpty(errInfo)) {
					errInfo = "success";                    //验证成功
					logBefore(logger, USERNAME + "登录系统");
					FHLOG.save(USERNAME, "登录系统");
				}
			}
		} else {
			errInfo = "error";    //缺少参数
		}
		map.put("result", errInfo);
		return AppUtil.returnObject(new PageData(), map);
	}

	/**访问首页(废弃,默认访问的首页是根目录index.html)
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public ModelAndView toindex()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("SYSNAME", Tools.readTxtFile(Const.SYSNAME)); //读取系统名称
		mv.setViewName("web/index");
		mv.addObject("pd",pd);
		return mv;
	}
	
	/**保存访客留言
	 * @return
	 */
	@RequestMapping(value="/saveLeavemsg")
	@ResponseBody
	public Object saveLeavemsg(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("LEAVEMSG_ID", this.get32UUID());		//主键
			pd.put("CTIME", Tools.date2Str(new Date()));	//提交时间
			leavemsgService.save(pd);
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**获取新闻瀑布流
	 * @return
	 */
	@RequestMapping(value="/getNewTitle")
	@ResponseBody
	public Object getNewTitle(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("start", Integer.parseInt(pd.getString("start")));
			pd.put("newsnumber", 1);
			List<PageData> listNews = newsService.listAll(pd);
			if(listNews.size() > 0){
				pd = listNews.get(0);
				pd.put("hasNext", "yes");
			}else{
				pd.put("hasNext", "no");
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		map.put("new", pd);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**获取新闻详情
	 * @return
	 */
	@RequestMapping(value="/getNew")
	@ResponseBody
	public Object getNew(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		String result = "00";
		try{
			pd.put("NEWS_ID", pd.getString("NEWID"));
			pd = newsService.findById(pd);	//根据ID读取
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		map.put("new", pd);
		return AppUtil.returnObject(new PageData(), map);
	}
	
	/**访问记录
	 * @return
	 */
	@RequestMapping(value="/addStatistics")
	@ResponseBody
	public Object addStatistics(){
		PageData pd = new PageData();
		pd = this.getPageData();
		HttpServletRequest request = this.getRequest();
		String ip = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			ip = request.getRemoteAddr();  
	    }else{
	    	ip = request.getHeader("x-forwarded-for");  
	    }
		String path="http://ip.taobao.com/service/getIpInfo.php?ip="+ip;
		try {
			URL url=new URL(path);
			HttpURLConnection http = (HttpURLConnection)url.openConnection();
			http.setDoOutput(true);
			http.setDoInput(true);
			http.setRequestMethod("POST");
			http.setRequestProperty("Content-Type","application/x-www-form-urlencoded");
			http.connect();
			InputStream is =null;
			String message= null;
			try {
				is = http.getInputStream();

			int size = is.available();
			byte[] bt = new byte[size];
			is.read(bt);
			message=new String(bt,"UTF-8");
			}catch(IOException e){
				logger.info(e.getMessage());
			}
			JSONObject jsonMsg = null;
			try {
				jsonMsg = JSONObject.fromObject(message);
			}catch(net.sf.json.JSONException e){
				logger.info(e.getMessage());

				jsonMsg = null;
				pd.put("STATISTICS_ID", this.get32UUID());        //主键
				pd.put("IP", ip);            //IP
				pd.put("AREA", "");        //地区
				pd.put("REGION", "");    //省/直辖市
				pd.put("OPERATOR", "");    //运营商
				pd.put("CDATE", DateUtil.getDay());                //日期
				pd.put("CTIME", Tools.date2Str(new Date()));

			}

			if(jsonMsg!=null && ! "".equals(jsonMsg)) {
				JSONObject jsonMsg2 = JSONObject.fromObject(jsonMsg.getString("data"));
				String country = jsonMsg2.getString("country");
				String area = jsonMsg2.getString("area");
				String region = jsonMsg2.getString("region");
				String city = jsonMsg2.getString("city");
				String isp = jsonMsg2.getString("isp");
				String AREA = country + " " + area + " " + region + " " + city;
				pd.put("STATISTICS_ID", this.get32UUID());        //主键
				pd.put("IP", ip);            //IP
				pd.put("AREA", AREA);        //地区
				pd.put("REGION", "内网IP".equals(AREA.trim()) ? "局域网" : region);    //省/直辖市
				pd.put("OPERATOR", isp);    //运营商
				pd.put("CDATE", DateUtil.getDay());                //日期
				pd.put("CTIME", Tools.date2Str(new Date()));    //时间
			}
			try {
				statisticsService.save(pd);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "<mate charset='utf-8' /><a href='/'>欢迎访问！</a>";
	}
	
	/**判断访客IP是否在黑名单
	 * @return
	 */
	@RequestMapping(value="/isBlack")
	@ResponseBody
	public Object isBlack(){
		Map<String,Object> map = new HashMap<String,Object>();
		PageData pd = new PageData();
		pd = this.getPageData();
		HttpServletRequest request = this.getRequest();
		String IP = "";
		if (request.getHeader("x-forwarded-for") == null) {  
			IP = request.getRemoteAddr();  
	    }else{
	    	IP = request.getHeader("x-forwarded-for");  
	    }
		String result = "OK";
		try{
			pd.put("IP", IP);
			List<PageData>	varList = blacklistService.listAll(pd);
			if(varList.size() > 0){
				result = "NO";
			}
		}catch (Exception e){
			logger.error(e.toString(), e);
		}finally{
			map.put("result", result);
			logAfter(logger);
		}
		return AppUtil.returnObject(new PageData(), map);
	}
	
}
