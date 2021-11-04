package member.bean;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class Cookies {
	/*��Ű�� <��Ű�̸�, ��Ű��ü>�� ���·� �����ϴ� ���� ���� */
	private Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	
	public Cookies(HttpServletRequest request)  // ��û http������������Ʈ Ŭ������ �Ķ���� request���� �޾� 
	{
		Cookie[] cookies=request.getCookies(); // Cookie�迭�� �о�� ������ Cookie��ü�� CookieMap�� �����Ѵ�. 
		if(cookies != null) 
		{
			for(int i=0;i<cookies.length;i++) 
			{
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
	}
	
	public Cookie getCookie(String name) //�� ��Ű�ʿ� ������ �̸��� ��Ű ��ü�� ���Ѵ�. �������� ������ null�� ����.
	{
		return cookieMap.get(name);
	}
	
	public String getValue(String name) throws IOException // ������ �������� ���� ���� �߰�.?
	{
		Cookie cookie = cookieMap.get(name);
		if(cookie==null)
		{
			return null;
		}
		return URLDecoder.decode(cookie.getValue(), "euc-kr");
	}
	
	public boolean exists(String name) 	// ���� �̸��� Cookie�� �����ϸ� true, �ƴϸ� false ����
	{
		return cookieMap.get(name) != null;
	}
	
	public static Cookie createCookie(String name, String value) throws IOException
	{	// �̸��� name ���� value �� ��Ű ��ü ����&����
		return new Cookie(name, URLEncoder.encode(value, "utf-8"));
	}
	
	public static Cookie createCookie(String name, String value, String path, int maxAge) throws IOException
	{	// + ���, ��ȿ�ð�maxAge�� ��Ű ��ü ����&����
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
	
	public static Cookie createCookie(String name, String value, String domain, String path, int maxAge) throws IOException
	{	// +������ 
		Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
		cookie.setDomain(domain);
		cookie.setPath(path);
		cookie.setMaxAge(maxAge);
		return cookie;
	}
}