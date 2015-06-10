class Post < ActiveRecord::Base
    FOTOS = File.join Rails.root, 'public', 'photo_store'
    /rails_code /
    after_save :guardar_foto
    
    def photo(file_data)
       unless file_data.blank? 
       @file_data = file_data
       self.extension = file_data.original.split('.').last.downcase
   end
        
    end    
    
    def photo_filename
       File.join  FOTOS, "#{id}.#{extension}"
    end    
    
    def photo_path
        "/photo_store/#{id}.#{extension}" 
    end    
    
    def has_photo?
     File.exists? photo_filename
     
    end    
    
    private 
    def guardar_foto
     if  @file_data 
          FileUtils.mkdir_p FOTOS 
          FILE.open(photo_filename, 'wb') do |f|
              f.write(@file_data.read)
             end
             @file_data = nill
         end
   end
end
