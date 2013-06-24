class User < ActiveRecord::Base
  attr_accessible :name, :email, :password
  has_many :events, :class_name => 'Event', :foreign_key => 'user_id'
  has_secure_password
  validates :name, :length  => {:minimum => 2, :too_short  => "must have at least 2 letters"}
  validates :email, :uniqueness => {:case_sensitive => false, :message => "has already been taken"}, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:message    => "must be a valid format" }
  validates :password, :length => {:minimum => 6, :too_short  => "must have at least 6 characters"}
  validates_confirmation_of :password

  after_save :registration_emails!

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.password = SecureRandom.hex(4)
      user.save!
    end
  end

  def registration_emails!
    # schedule_result_email unless self.result_date == nil
    send_email
  end

  # def schedule_result_email
  #   EmailWorker.perform_at(self.result_date, self.user_id, self.id, 'result')
  # end

  def send_email
    EmailWorker.perform_async(self.id)
  end

end
