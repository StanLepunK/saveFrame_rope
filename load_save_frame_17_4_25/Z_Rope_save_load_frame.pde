/**
SAVE LOAD  FRAME Rope
v 0.2.0
2017-2017 by Stan le Punk
*/
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.awt.Graphics;
import java.awt.Color;



/**
LOAD BMP
v 0.1.0
*/

PImage loadImageBMP(String fileName) {
  PImage img = null;

  try {
    InputStream is = createInput(fileName);
    BufferedImage buff_img = ImageIO.read(is);
    int[] pix = buff_img.getRGB(0, 0, buff_img.getWidth(), buff_img.getHeight(), null, 0, buff_img.getWidth());
    img = createImage(buff_img.getWidth(),buff_img.getHeight(), RGB) ;
    // println("Componenent", buff_img.getColorModel().getNumComponents()) ;
    img.pixels = pix ;
    

    // in case the picture is in grey value...to set the grey because this one is very very bad
    // I don't find any solution to solve it...
    // any idea ?
    if(buff_img.getColorModel().getNumComponents() == 1) {
      float ratio_brightness = .95;
      for(int i = 0 ; i < img.pixels.length ; i++) {     
        colorMode(HSB);
        float b = brightness(img.pixels[i]) *ratio_brightness ;
        img.pixels[i] = color(0,0,b) ;
        colorMode(RGB);
      }
    }
    
    
  }
  catch(IOException e) {
  }

  if(img != null) {
    return img;
  } else {
    return null ;
  }
}















/**
Save Frame
V 0.0.1
*/
void saveFrame(String where, String filename) {
  float compression = .9 ;
  saveFrame(where, filename, compression) ;
}


void saveFrame(String where, String filename, float compression) {
  // check if the directory or folder exist, if it's not create the path
  File dir = new File(where)  ;
  dir.mkdir() ;
  // final path with file name adding
 String path = where+"/"+filename ;
 //  String path = where+"/"+filename+".jpg" ;
 

  try {
    OutputStream os = new FileOutputStream(new File(path));
    if(path.contains(".bmp") || path.contains(".BMP")) {
      saveBMP(os) ;
    } else if(path.contains(".jpeg") || path.contains(".jpg") || path.contains(".JPG") || path.contains(".JPEG")) {
      // saveJPG(os, compression) ;
    }
  }  catch (FileNotFoundException e) {
    //
  }
}



/**
SAVE BMP
v 0.2.1
*/
boolean saveBMP(OutputStream output) {
  try {
    loadPixels() ; 
    BufferedImage buff_img = new BufferedImage(pixelWidth, pixelHeight, BufferedImage.TYPE_INT_RGB) ;
    buff_img.setRGB(0, 0, pixelWidth, pixelHeight, pixels, 0, pixelWidth);
    Graphics g = buff_img.getGraphics();
    g.dispose() ;
    output.flush() ;
    
    ImageIO.write(buff_img, "bmp", output);
    return true ;
  }
  catch(IOException e) {
    e.printStackTrace();
  }
  return false ;
}




void save_bmp(String where, String filename, int w, int h, int [] pix) {
  // check if the directory or folder exist, if it's not create the path
  File dir = new File(where)  ;
  dir.mkdir() ;
  // final path with file name adding
  String path = where+"/"+filename+".bmp" ;

  try {
    OutputStream os = new FileOutputStream(new File(path));
    saveBMP(os, w, h, pix) ;
  }  catch (FileNotFoundException e) {
    //
  }
}


boolean saveBMP(OutputStream os, int w, int h, int [] pix) {
  try {
    BufferedImage buff_img = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB) ;
    int [] final_pix = new int[w*h] ;
    for(int i = 0 ; i < final_pix.length; i++) {
      if(pix.length < i) {
        final_pix[i] = pix[i];
      } else {
        final_pix[i] = -16777216 ; // black color
      }

    }    
    buff_img.setRGB(0, 0, w, h, final_pix, 0, w);
    Graphics g = buff_img.getGraphics();
    g.dispose() ;
    os.flush();
    return true ;

  } catch(IOException e) {

  }
  return false ;
}




















