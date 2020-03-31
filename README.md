#JAVA SDK Instructions#

This SDK is intended to serve as an example implementation of a JAVA backend interacting
with the SnowShoeStamp API. The included WAR file can be dropped in a Tomcat webapp directory and ran to see how it makes the call to our server. You will be able to stamp the screen on a phone if you navigate to the IP of the Tomcat server and it should send a stamp request to our server and return data back.

---

Below are the few simple steps required to make this SDK work with Tomcat. This project is built to work simply with Eclipse and Tomcat 9.0.

1. The first thing to do is create your own app which you can learn more about [HERE](https://snowshoe.readme.io/v3.0/docs/part-1-create-a-snowshoe-application)

2. Make sure you get the API Key that you will need to run requests. You can learn more about the API Keys [HERE](https://snowshoe.readme.io/v3.0/docs/part-1-create-a-snowshoe-application#get-api-keys)

3. After you have done this, in the src there is a Receiver.java file and a place where you input your API Key at the top of the doPost() method. replace the 'ENTER_YOUR_API_KEY' with your API Key.

4. You can now run the demo web applet using stamps that are connected to your app. If you are using Eclipse just run the app on server and it is ready to go as a stamp screen.

5. To stamp the screen on a phone just connect to (serversLocalIP):8080/snowshoe-sdk-java/ and you can stamp that screen to see how it works.
