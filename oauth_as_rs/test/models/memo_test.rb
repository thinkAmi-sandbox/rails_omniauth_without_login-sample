# == Schema Information
#
# Table name: memos
#
#  id         :integer          not null, primary key
#  favorite   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  member_id  :integer          not null
#
# Indexes
#
#  index_memos_on_member_id  (member_id)
#
# Foreign Keys
#
#  member_id  (member_id => members.id)
#
require "test_helper"

class MemoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
