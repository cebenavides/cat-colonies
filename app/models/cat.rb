class Cat < ApplicationRecord
    belongs_to :colony
    has_many :events
    validates :code, uniqueness: true
    
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    
    enum personality: [:docile, :aggressive]
    enum sex: [:female, :male]
    enum age: [:baby, :adult]
end
