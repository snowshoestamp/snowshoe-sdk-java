#JAVA SDK Instructions#

This SDK is intended to serve as an example implementation of a JAVA backend interacting
with the SnowShoeStamp API. The included WAR file can be dropped in a Tomcat webapp directory and ran to see how it makes the call to our server. You will be able to stamp the screen on a phone if you navigate to the IP of the Tomcat server and it should send a stamp request to our server and return data back.

---

Below are the few simple steps required to make this SDK work with Tomcat.

1. Once Tomcat has unpacked the WAR file, navigate to WEB-INF/src/com/snowshoestamp/sdk, and open 
receiver.java

2. In receiver.java, you will find two comments asking you to enter your app secret and app key. 
These you can obtain by going to beta.snowshoestamp.com and registering an app. When you register
your app, the callback url will be your domain and then /sssjavasdk/servlet/receiver, so if your webapp 
directory is at www.yourdomain.com, your callback url will be 
http://www.yourdomain.com/sssjavasdk/servlet/receiver
Feel free to change this for your own implementation as necessary

3. Once you have entered your app secret and app key in the receiver file, open the redirect file, 
and where you see the comment asking you to enter your app key again, do so.

4. At this point, you should be able to navigate on a touch screen device to www.yourdomain.com/sssjavasdk
and see a link saying "Send me to the stamp screen". The basic functionality exhibited here is to
illustrate that at some point in your app, you will need to send the user to our server. The address for this
redirect is http://beta.snowshoestamp.com/api/v2/client/ &#60; your app key here &#62; /  You can achieve this redirect 
however is most convenient for you. 

5. If you click the link, you should be directed to our stamp screen. Stamp the screen, and
it should post to the callback you entered, which will then print the response JSON out to the screen. 
You will want to do something more robust with that JSON, but what you do with it is entirely up to you.