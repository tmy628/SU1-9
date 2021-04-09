class Batch::DataReset
  def self.data_reset
    # 投稿を全て削除
    Book.delete_all
    p "投稿を全て削除しました"
    # bundle exec rails runner Batch::DataReset.data_resetが上手くいかない → Book.delete_all p "投稿を全て削除しました" 正しく改行できていなかった
  end
end