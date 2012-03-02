require 'digest/sha1'


ROLES = %w[please_select admin doctor patient]


class User < ActiveRecord::Base


  has_many :logs

#paperclip
  has_attached_file :pic,
                    :styles => {:thumb=> "300x300#", :small => "150x150>"},
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style.:extension",
                    :bucket => "dbfpic1"


  after_update :doLogStatus, :if => :pair_changed?

  def doLogStatus
    Log.find_all_by_own(self.name).each do |l|
      l.read = 0
      l.save
    end
  end


  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :password_confirmation
  validates_confirmation_of :password

  validate :password_non_blank


  def self.authenticate(name, password)
    user = self.find_by_name(name)
    if user
      expected_password = encrypted_password(password, user.salt)
      if user.hashed_password != expected_password
        user = nil
      end
    end
    user
  end


# 'password' is a virtual attribute

  def password
    @password
  end

  def password=(pwd)
    @password = pwd
    return if pwd.blank?
    create_new_salt
    self.hashed_password = User.encrypted_password(self.password, self.salt)
  end


  private

  def password_non_blank
    errors.add(:password, "Missing password") if hashed_password.blank?
  end


  def create_new_salt
    self.salt = self.object_id.to_s + rand.to_s
  end


  def self.encrypted_password(password, salt)
    string_to_hash = password + "wibble" + salt
    Digest::SHA1.hexdigest(string_to_hash)
  end


end