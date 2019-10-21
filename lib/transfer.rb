class Transfer

  attr_reader :sender, :reciver, :amount
  attr_accessor :status

  def initialize(sender, reciver, amount)
    @sender = sender
    @reciver = reciver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @reciver.valid?
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