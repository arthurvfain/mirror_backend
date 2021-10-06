class Reflection < ApplicationRecord
    belongs_to :user
    belongs_to :mirror, class_name: "User"

    # validates :or, presence: true, message: 'missing attribute'
    # validates :ol, presence: true, message: 'missing attribute'
    # validates :cr, presence: true, message: 'missing attribute'
    # validates :cl, presence: true, message: 'missing attribute'
    # validates :er, presence: true, message: 'missing attribute'
    # validates :el, presence: true, message: 'missing attribute'
    # validates :ar, presence: true, message: 'missing attribute'
    # validates :al, presence: true, message: 'missing attribute'
    # validates :nr, presence: true, message: 'missing attribute'
    # validates :nl, presence: true, message: 'missing attribute'

end
