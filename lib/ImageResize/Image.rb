module Image

  $VERBOSE = nil
  
  def Image.cmd
    jar_path = File.expand_path(File.dirname(__FILE__)).split(/\//)
    jar_path.pop
    jar_path.pop
    resizer = "#{jar_path.join('/')}/java/ImageResize.jar"
    "java -jar #{resizer}"
  end
  
  def Image.resize(img_in, img_out, width, height)
    puts `#{Image.cmd} resize #{img_in} #{img_out} #{width} #{height}`
  end

  def Image.formats
    lines = `#{Image.cmd} formats`
    read_formats = nil
    write_formats = nil
    for line in lines.split(/[\r\n]/) do
      rw, format = line.split(/\:/)
      formats = format.split(/,/).map{|f|f.downcase}.uniq.sort
      if rw == 'read'
        read_formats = formats
      elsif rw == 'write'
        write_formats = formats
      end
    end
    return read_formats, write_formats
  end

  def Image.read_formats
    r,w = Image.formats
    r
  end
  
  def Image.write_formats
    r,w = Image.formats
    w
  end
  
end
