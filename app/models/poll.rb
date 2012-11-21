class Poll < ActiveRecord::Base
  attr_accessible :title, :user_id, :admin_url, :public_url

  belongs_to :user
  has_many :questions, :dependent => :destroy

  before_save :set_admin_and_public_url

  private

  def set_admin_and_public_url
    url_a = (('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..5].join
    url_p = (('a'..'z').to_a + ('A'..'Z').to_a + (1..9).to_a).shuffle[0..5].join
    self.admin_url = url_a
    self.public_url = url_p
  end

end
