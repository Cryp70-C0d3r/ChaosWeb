class User < ApplicationRecord

  # Before Saving User Do #
  before_save { email.downcase! }

  # Validates User Name #
  validates :name, presence: true, length: { maximum: 50 }

  # Create Valid Email REGEX #
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # Validates User Email #
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  # Validates User Business #
  validates :biz, presence: true, length: { maximum: 100 }

  # Validates User Telephone #
  validates :tel, presence: true, length: { maximum: 14 }

  # Validates User Address #
  validates :adr, presence: true, length: { maximum: 50 }

  # Validates User City #
  validates :cty, presence: true, length: { maximum: 50 }

  # Validates User State #
  validates :ste, presence: true, length: { maximum: 50 }

  # Validates User Zip #
  validates :zip, presence: true, length: { maximum: 6 }

  # Validates User Web Type #
  validates :web_type, presence: true, length: { maximum: 15 }

  # Validates User Hosting Type #
  validates :hosting_type, presence: true, length: { maximum: 12 }

  # Validates User Security Type #
  validates :security_type, presence: true, length: { maximum: 12 }

  # Validates User SEO Type #
  validates :seo_type, presence: true, length: { maximum: 12 }

  # Validates User Date Started #
  validates :date_started, presence: true, length: { maximum: 14 }

  # Validates User Date Completed #
  validates :date_completed, presence: true, length: { maximum: 14 }

  # Validates User Order Total #
  validates :order_total, presence: true, length: { maximum: 14 }

  # Validates User Ongoing Total #
  validates :ongoing_total, presence: true, length: { maximum: 40 }

  # Validates User Due Date #
  validates :due_date, presence: true, length: { maximum: 40 }

  # Validates User Domain Name #
  validates :domain_name, presence: true, length: { maximum: 100 }

  # Validates User IP Address #
  validates :ip_adr, presence: true, length: { maximum: 20 }

  # Ensure Secured Password #
  has_secure_password

  # Validates User Password #
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

end
