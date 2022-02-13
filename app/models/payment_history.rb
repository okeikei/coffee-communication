class PaymentHistory < ApplicationRecord
    
    # == Schema Information
#
# Table name: orders
#
#  id                                  :uuid             not null, primary key
#  amount                              :integer          default(0), not null
#  error_detail                        :string
#  error_message                       :string
#  status(決済ステータス)                :integer          default("before_payment"), not null
#  created_at                          :datetime         not null
#  updated_at                          :datetime         not null
#  charge_id(Payjp決済ID)               :string           default(""), not null
#  user_id                             :uuid             not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)

class PaymentHistory
  belongs_to :user

  enum status: {
    before_payment: 0, # 未決済
    completed: 1, # 決済完了
    failed: 2, # 決済失敗
  }
end
    
end
