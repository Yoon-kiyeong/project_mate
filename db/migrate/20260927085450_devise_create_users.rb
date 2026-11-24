# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: :string, limit: 100 do |t|
## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: "" 
      
      ## Recoverable
      t.string   :reset_password_token  ##(一回用パスワード再設定認証キー)
      t.datetime :reset_password_sent_at  ##(再設定メールを送った時間)

      ## Rememberable
      t.datetime :remember_created_at  ##(ログイン情報を記憶した時間)

      ## Profile fields
      t.string :nickname,           null: false
      t.string :github_url
      t.string :portfolio_url

    end
    add_index :users, :email,                unique: true
    add_index :users, :nickname,             unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
