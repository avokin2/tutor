class UserCategory < ActiveRecord::Base
  has_many :user_word_categories, :dependent => :delete_all
  has_many :user_words, :through => :user_word_categories
  belongs_to :user

  def self.find_by_user_and_name(user, name)
    UserCategory.where(:user_id => user.id).where(:name => name)
  end
end
