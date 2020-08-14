class Post < ApplicationRecord
  # 空の投稿と文字数を制限するバリデーション
  validates :content, {presence: true, length:{maximum: 140}}
  validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

  def self.search(search)
    if search
      Post.where(['content LIKE ?', "%#{search}%"])
    else
      Post.all
    end
  end
end
