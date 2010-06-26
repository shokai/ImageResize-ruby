module Image
  
  
  def Image.resize(img_in, img_out, width, height)
    resizer = File.dirname(__FILE__) + '/../../java/ImageResize.jar'
    puts `java -jar #{resizer} #{img_in} #{img_out} #{width} #{height}`
  end
  
end
