package com.snowshoestamp.sdk;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;

public class Receiver extends HttpServlet {

	//The serializable number.
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse res)
			throws IOException, ServletException
	{
		String api_key = "ENTER_YOUR_API_KEY";//Put your api_key here


		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		InputStream input = request.getInputStream();
		BufferedReader in = new BufferedReader(new InputStreamReader(input));
		String body = in.readLine();
		in.close();

		HttpPost connection = new HttpPost("https://api.snowshoestamp.com/v3/stamp");
		connection.setEntity(new StringEntity(body, ContentType.APPLICATION_JSON));
		connection.setHeader("Content-Type", "application/json");
		connection.setHeader("SnowShoe-Api-Key", api_key);

		HttpClient httpClient = new DefaultHttpClient();
		HttpResponse response = httpClient.execute(connection);
		BufferedReader reader = new BufferedReader(new InputStreamReader(response.getEntity().getContent(), "UTF-8"));
		String json = reader.readLine();
		out.print(json);
	}
}
