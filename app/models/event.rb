class Event < ApplicationRecord
    enum event_type: [:deceased,:adopted,:abandoned,:hurt,:other]
    belongs_to :cat
end
