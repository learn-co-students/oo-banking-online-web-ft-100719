class Transfer
  
  attr_accessor: :sender, :reciever, :amount, :status
  
  def initialize(sender, reciever, amount)
    @sender = sender
    @reciever = reciever 
    @amount = amount 
    @status = status
  end
  
  def valid?
    @sender.valid? && @reciever.valid? ? true : false 
  end
  
  def execute_transaction
    
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @reciever.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end
