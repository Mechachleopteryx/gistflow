class Account::Twitter < ActiveRecord::Base
  belongs_to :user
  
  validates :user, :token, :secret, :twitter_id, presence: true
  validates :user_id, uniqueness: { scope: :twitter_id }
  
  def self.by_omniauth(omniauth)
    omniauth = omniauth.to_hash
    find_by_twitter_id(omniauth[:uid]) || create! do |account|
      account.token      = omniauth[:token]
      account.secret     = omniauth[:secret]
      account.twitter_id = omniauth[:uid]
    end
  end
  
end
