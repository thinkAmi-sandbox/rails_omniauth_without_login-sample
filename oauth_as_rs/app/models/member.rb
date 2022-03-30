# == Schema Information
#
# Table name: members
#
#  id                 :integer          not null, primary key
#  email              :string           default(""), not null
#  encrypted_password :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_members_on_email  (email) UNIQUE
#
class Member < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
end
