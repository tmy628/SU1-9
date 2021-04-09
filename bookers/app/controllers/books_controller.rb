class BooksController < ApplicationController
 def index
   @books = Book.all
   # 投稿一覧
   @book = Book.new
   # 新規投稿
 end

 def create
  @book = Book.new(book_params)
  if @book.save
   # 投稿に成功した場合
   # Rails form_withでのバリデーションチェックのエラーメッセージが表示されない
   # @を付けていなかった
   flash[:notice] = "Book was successfully created."
   redirect_to book_path(@book)
   #  redirect_to…ルーティングを通り、新たにviewページを呼び出す
   # データの更新/削除、inputやformなど何かデータを送る処理はredirect_to
  else
   #書き込み失敗
   @books = Book.all
   # Rails form_withでのバリデーションチェックのエラーメッセージが表示されない
   # renderする前に@booksに値を与える必要があった
   render :index
   # renderをしてindex.htmlに画面遷移
   # render…ルーティングを通らず、viewページに飛ぶ
   # ログインや入力形式に失敗した場合など、ただエラーを表示させる時はrender
  end
 end

 def show
  @book = Book.find(params[:id])
 end

 def new
 end

 def edit
  @book = Book.find(params[:id])
 end

 def update
  @book = Book.find(params[:id])
  if @book.update(book_params)
   # 投稿に成功した場合
   # bookではなく@book
   flash[:notice] = "Book was successfully updated."
  redirect_to book_path(@book)
  # 詳細画面へリダイレクト
  else
   #書き込み失敗
   render :edit
   # renderをしてedit.htmlに画面遷移
  end
 end

 def destroy
  book = Book.find(params[:id]) #データ(レコード)を1件取得
  if book.destroy #データ（レコード）を削除
   flash[:notice] = "Book was successfully destroyed."
   redirect_to books_path(@book)
   # 一覧画面へリダイレクト
  end
 end

 private
  #ストロングパラメータ
 def book_params
  params.require(:book).permit(:title, :body)
 end
end