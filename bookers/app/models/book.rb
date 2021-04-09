class Book < ApplicationRecord
 validates :title,
   presence: true
 validates :body,
   presence: true
   # presence: trueは、空欄でないことを確認している
end