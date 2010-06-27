module Image
  
  def Image.resize(img_in, img_out, width, height)
    path = File.expand_path(File.dirname(__FILE__)).split(/\//)
    path.pop
    path.pop
    resizer = "#{path.join('/')}/java/ImageResize.jar"
    puts `java -jar #{resizer} #{img_in} #{img_out} #{width} #{height}`
  end
  
end
