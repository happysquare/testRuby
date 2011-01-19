#encryption lib
require 'digest'

class User < ActiveRecord::Base
  validates :email, :uniqueness => true,
                    :length => { :within => 5..50 } ,
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}
  validates :password,  :confirmation => true,
                        :length => { :within => 4..20 },
                        :presence => true,
                        :if => :password_required? #if statement applies to whole block. executes validation
  
  #relational tables
  has_one :profile
  has_many :articles, :order => "published_at DESC, title ASC", :dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments
  
  #observer
  before_save :encrypt_new_password #run before saving the record to the db
  
  #create a read write... getter setter for password.
  attr_accessor :password
  
  #override method called explicitly
  def self.authenticate(email,password)
    user=find_by_email(email)
    return user if user && user.authenticated?(password)
  end
  
  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end
  
  protected
    def encrypt_new_password
      return if password.blank?#if empty field return. The password should only be there if the user is registering or changing their password.
      self.hashed_password = encrypt(password)
    end
    
    def password_required?
      logger.debug "checking authentication"
      logger.debug hashed_password.blank?
      logger.debug password.present?
      logger.debug "finished checking the authentication"
      hashed_password.blank? || password.present? #called by validation to assess whether we need to validate. 
                                                  #so if we have already got a hashed password, or their is a value in the password field return true.
                                                  
    end
    
    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
  
end
