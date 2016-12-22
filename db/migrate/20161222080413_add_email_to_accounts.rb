class AddEmailToAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :email, :text
  end

  def self.down
    add_column :accounts, :email
  end
end
