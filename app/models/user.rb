class User < ActiveRecord::Base
  attr_accessible :email, :name, :password_digest, :username, :password, :password_confirmation # [6] Here we are adding the password and password confirmation attributes to the model
  has_secure_password # [7] By adding this, we are making sure that :password and :password_confirmation, the passwords that a user enters, match up upon submission
  validates_presence_of :name, :email, :username, :password, :password_confirmation # [8] This line makes sure that a user has entered something into each field that you require.  Here, we required all fields to be filled out
  validates_uniqueness_of :username, :email # [9] This line makes sure that the username and email that a user enters is not already in use by another user.  It makes sure they are unique!
  # [10] We're finished in the User model - now, lets head to: your_app_name/app/views/model_name/_form.html.erb
end
