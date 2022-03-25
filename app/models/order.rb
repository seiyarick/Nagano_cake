class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordering_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }#{ credit_card: 0, transfer: 1 }{ クレジットカード: 0, 銀行振込: 1 }
  enum order_status: { awaiting_payment: 0, confirmation: 1, manufacture: 2, preparation: 3, settled: 4 }
                  # { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

def total_amount#独自で作るメソッドの場合はモデル内に書き込む
  ordering_details = self.ordering_details#selfはtopのオーダーとつながっている。モデル内はself表記
  amount = 0
  ordering_details.each do |ordering_detail|
   amount = amount + ordering_detail.amount#右辺のamountは11業目の0が入った状態,注文詳細が順番に入っていき最終１６行目に入り9行目のtotal_amountに入ってビュー画面へ

  end
  amount
end

def add_tax_price
        (self.price * 1.1).round
end



end
