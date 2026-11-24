class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :id, presence: true, uniqueness: { case_sensitive: false } 
  validates :nickname, presence: true, uniqueness: true
  
  validates :github_url,
            format: {with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "正しい形式ではありません"},
            allow_blank: true

  validates :portfolio_url,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "正しい形式ではありません"},
            allow_blank: true
end

##presence: true : 値が空になったり、空白だけある場合、保存を止め、登録フォームにエラーメッセージを出力する
##uniqueness: { case_sensitive: false} :大文字、小文字だけ違うIDが重複登録されることを防ぐ
##allow_blank: true : github_urlとportfolio_urlは選択入力値なので、空にしてもエラーになれないし、値が入った時のみ、URL形式を検査する。
##validatableとの関係:Deviseが基本提供する :validatableモジュールがemailとpasswordの必須可否,email形式,パスワードの長さ/確認検証をすでに処理してくれる。

##注意) id: stringを基本キーとして使う時、既に存在するidで保存をするとActiveRecord検証だけではなく,DB基本キー制約(PG::UniqueViolation)もかかるので、
#新規登録フォームで重複IDを入力すると登録が拒絶され、フォームエラーに案内される