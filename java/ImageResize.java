import javax.imageio.*;
import java.io.*;
import java.awt.image.*;
import java.awt.geom.*;
import java.awt.image.*;
import java.util.regex.*;

class ImageResize{

    public ImageResize(){
    }

    public static void main(String args[]){
	if(args.length < 4){
	    System.out.println("ImageResize in.jpg out.jpg 320 320");
	    System.exit(1);
	}
	ImageResize app = new ImageResize();
	if(app.resize(args[0], args[1], Integer.parseInt(args[2]), Integer.parseInt(args[3]))){
	    System.out.println(args[1]);
	}
    }

    public boolean resize(String fname_in, String fname_out, int max_width, int max_height){
	System.out.println(fname_in);
	BufferedImage img = null;
	try {
	    img = ImageIO.read(new File(fname_in));
	}
	catch (Exception e) {
	    e.printStackTrace();
	    img = null;
	}
	
	int width, height;
	if(img.getWidth() < img.getHeight()){
	    height = max_height;
	    width = img.getWidth() * max_height / img.getHeight();
	}
	else{
	    width = max_width;
	    height = img.getHeight() * max_width / img.getWidth();
	}
	System.out.println(img.getWidth() + "x" +img.getHeight() + " => " + width + "x" + height);
	
	BufferedImage img_resized = new BufferedImage(width, height, img.getType());
	AffineTransformOp ato = new AffineTransformOp(AffineTransform.getScaleInstance((double)width / img.getWidth(), 
										       (double)height / img.getHeight()), 
						      null);
	ato.filter(img, img_resized);
	

	String format = Pattern.compile("^.+\\.(.+)$").matcher(fname_out).replaceAll("$1");
	boolean result = false;
	try {
	    result = ImageIO.write(img_resized, format, new File(fname_out));
	}
	catch (Exception e) {
	    e.printStackTrace();
	    result = false;
	}
	return result;
    }
    
}