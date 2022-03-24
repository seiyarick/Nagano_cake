class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordering_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }#{ credit_card: 0, transfer: 1 }{ クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { awaiting_payment: 0, confirmation: 1, manufacture: 2, preparation: 3, settled: 4 }
                  # { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }





end
