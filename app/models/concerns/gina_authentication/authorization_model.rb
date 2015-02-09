module GinaAuthentication
  module AuthorizationModel
    extend ActiveSupport::Concern

    included do
      belongs_to :user

      validates :user_id, :uid, :provider, presence: true
      validates :uid, uniqueness: { scope: :provider }
    end

    module ClassMethods
      def find_from_hash(hash)
        where(provider: hash['provider'], uid: hash['uid']).first
      end

      def create_from_hash(hash, user = nil)
        if user.nil? || user.new_record?
          user = User.create_from_hash!(hash)
        else
          user.update_from_hash!(hash)
        end

        create(user: user, uid: hash['uid'], provider: hash['provider'])
      end
    end
  end
end
