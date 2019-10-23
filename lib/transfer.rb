class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    
  end
  
  def valid?
    if(@sender.valid? && @receiver.valid?)
      true
    else
      false
    end
  end
  
  def execute_transaction
    
    if(@amount > @sender.balance || @status != "pending" || !valid?)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    end
    
  end
  
  def reverse_transfer
    if(@status != "pending")
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end




