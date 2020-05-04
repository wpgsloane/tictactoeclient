//client
import processing.net.*;

Client myClient;
String outgoing;
String incoming;
String valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()-=+_;:?.,";

void setup(){
  size(300,300);
  textAlign(CENTER,CENTER);
  textSize(20);
  
  incoming = "";
   outgoing = "";
                      //this=sketch          //port#
  myClient = new Client(this, "127.0.0.1", 12345);
                              //ip address
}

void draw(){
  background(255);
  fill(0);
  text(incoming,width/2,height/2-100);
  
  if (myClient.available()>0){//how we get/read messages
    incoming = myClient.readString();
  }
}

void keyPressed(){
  if (key == ENTER){
    myClient.write(outgoing);
    outgoing = "";
  } else if (key== BACKSPACE && outgoing.length()>0){
    outgoing.substring(0,outgoing.length()-1);
  } else if (valid.contains(""+key)){
    outgoing = outgoing+key;
  }
}
