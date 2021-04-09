class Batch::DataReset
  def self.data_reset
  # 投稿を全て削除
  Book.dalete_all
  p "投稿を全て削除しました"
  end
end