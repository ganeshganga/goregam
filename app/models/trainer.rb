class Trainer < ActiveRecord::Base
   attr_accessible :name,:contact,:website,:facebook_site,:rating,:specialities,
    :home_town,:products,:qualifications,:image
    
end
