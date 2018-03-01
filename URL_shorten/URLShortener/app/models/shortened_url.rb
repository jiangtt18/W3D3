# == Schema Information
#
# Table name: shortened_urls
#
#  id        :integer          not null, primary key
#  short_url :string
#  long_url  :string
#  user_id   :string
#
require 'securerandom'

class ShortenedUrl < ApplicationRecord
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  def self.random_code
    shortened = SecureRandom.base64(16)
    while ShortenedUrl.exists?(:short_url => shortened)
        shortened = SecureRandom.base64(16)
    end
    shortened
  end

  def self.generate_url(user, long_url)
    id = user.id
    ShortenedUrl.new(short_url: ShortenedUrl.random_code, long_url: long_url, user_id: id)
  end

  belongs_to :submitter,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id


  # factor_method
  #   calls random_code
  #
  # def self.factory(user,long_url)
  #   ShortenedUrl.new()
  # end
  #
  # def
  #
  #
  # def self.random_code
  #   @User
  #   -long

end
