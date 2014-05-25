class TrainingContent < ActiveRecord::Base
   attr_accessible :description,:preconditions,:included_material,:necessary_material,:cost,
    :model_needed,:max_participants,:included_services,:comments,:level,:name
end
