void settings() {
  size(100,100) ;
}


PImage img ;

void setup() {



// img = loadImage("purosGirl_OS_4.bmp"); 
img = loadImageBMP("purosGirl_OS_24.bmp"); 
println(img.pixels.length) ;

surface.setSize(img.width, img.height);
}


// int [][]pix ; 
void draw() {
  image(img, 0, 0);
}


void keyPressed() {
  save_frame_bmp() ;
}











/**
SAVE
*/


void save_frame_bmp() {
  String filename = "image_" +year()+"_"+month()+"_"+day()+"_"+hour() + "_" +minute() + "_" + second()+".bmp" ; 
 // String path = sketchPath()+"/bmp/";
  String path = sketchPath();
  path += "/bmp" ;
  saveFrame(path, filename) ;
}