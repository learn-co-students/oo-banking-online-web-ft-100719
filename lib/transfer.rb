class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
    @sender=sender
    @receiver=receiver
    @status='pending'
    @amount=amount
  end

  def valid?
    @sender.valid? && @receiver.valid? 
  end

  def execute_transaction
    if @sender.balance < @amount || !self.valid?
      @status='rejected'
      "Transaction rejected. Please check your account balance."
    elsif @status=='complete'
      "Completed"
    else
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status='complete'
    end
  end

  def reverse_transfer
    if self.status=='complete'
    @sender.deposit(@amount)
    @receiver.deposit(-@amount)
    @status='reversed'
    end
  end

end
