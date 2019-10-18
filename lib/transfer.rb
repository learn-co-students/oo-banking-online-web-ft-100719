class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.amount = amount
    self.status = 'pending'
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def money_transfer(sender, receiver, amount)
    sender.balance -= amount
    receiver.deposit(amount)
  end

  def execute_transaction
    if self.valid? && self.status == 'pending' && self.sender.balance >= self.amount
      self.money_transfer(self.sender, self.receiver, self.amount)
      self.status = 'complete'
    else
      self.status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if self.valid? && self.status == 'complete'
      self.money_transfer(self.receiver, self.sender, self.amount)
      self.status = 'reversed'
    end
  end
end
