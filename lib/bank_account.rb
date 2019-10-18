class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

  def initialize(name)
    @name = name
    self.balance = 1000
    self.status = 'open'
  end

  def deposit(deposit_amount)
    self.balance += deposit_amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.status == 'open' && balance > 0
  end

  def close_account
    self.status = 'closed'
  end

end
