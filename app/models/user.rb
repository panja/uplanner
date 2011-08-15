class User < ActiveRecord::Base
  
  validates_presence_of :first_name, :last_name

  validates_confirmation_of :password,
                            :if => :password_changed?,
                            :message => "Your two passwords do not match"

  validates_presence_of :password_confirmation,
                        :if => :password_changed?,
                        :message => "You did not enter your password in both fields"

  validates_uniqueness_of :username, :email

  validates_format_of :username,
                      :with => /^[-\w]+$/i,
                      :message => "You did not enter your username in the proper format"

  validates_format_of :password,
                      :with => /^[-\w]+$/i,
                      :if => :password_changed?,
                      :message => "You did not enter your password in the proper format"

  validates_format_of :email,
                      :on => :create,
                      :with => /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{1,3}$/i,
                      :message => "You did not enter your email in the proper format"

  scope :developers, where(:role => "developer")
  scope :customers, where(:role => "customer")

  $options = [
    ["Developer","developer"],
    ["Customer","customer"],
    ["Admin","admin"]
  ];

  belongs_to :project
end
