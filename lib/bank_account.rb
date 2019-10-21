class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def self.deposit(amount)
        @balance += amount
    end

    def self.display_balance
        "Your balance is #{self.balance}"
    end

    def self.valid? # account is valid if balance > 0 and is open
        if @status == 'open' && @balance > 0
            true
        else
            false
        end
    end

    def self.close_account
        @status = "closed"
    end

end # end of BankAccount class
