# e_mail:string
# password_digest:string

#

# password:string virtual
# password_confirmation:string virtual

class User < ApplicationRecord
  has_secure_password
  validates :e_mail, presence: true, uniqueness: { case_sensitive: false }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 7 }, presence: true
  validates :password_confirmation, length: { minimum: 7 }, presence: true
end
