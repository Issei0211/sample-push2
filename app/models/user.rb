class User < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_secure_password
  # nameカラムに空の値を保存できないバリデーション
  validates:name, {presence:true}
  
  # emailカラムに空の値、重複したメールアドレスを保存できないバリデーションを作成してください
  validates:email, {presence:true, uniqueness: true}
  
  def posts
    return Post.where(user_id: self.id)
  end
end
