# e_mail:string
# password_digest:string

#

# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password
  validates :e_mail, presence: true
  validates :e_mail, presence: true
end
