class AddRemoteTokenToLoginAccounts < ActiveRecord::Migration
  def change
    add_column :login_accounts, :remote_token, :string
  end
end
