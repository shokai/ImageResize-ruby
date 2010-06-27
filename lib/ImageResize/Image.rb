module Image
  
  def Image.resize(img_in, img_out, width, height)
    jar_path = File.expand_path(File.dirname(__FILE__)).split(/\//)
    jar_path.pop
    jar_path.pop
    resizer = "#{jar_path.join('/')}/java/ImageResize.jar"
    puts `java -jar #{resizer} #{img_in} #{img_out} #{width} #{height}`
  end
  
end
