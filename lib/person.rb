class Person
    attr_reader :name, :happiness, :hygiene
    attr_accessor :bank_account

    def initialize(name, bank_account = 25, happiness = 8, hygiene = 8)
        @name = name
        @bank_account = bank_account
        @happiness = happiness
        @hygiene = hygiene
    end

    def happiness=(value)
        @happiness = value.clamp(0, 10)
    end

    def hygiene=(value)
        @hygiene = value.clamp(0, 10)
    end

    def clean? 
        self.hygiene > 7
    end

    def happy?
        self.happiness > 7
    end

    def get_paid(amount)
        @bank_account += amount 
        return "all about the benjamins"
    end

    def take_bath
        self.hygiene += 4
        return "♪ Rub-a-dub just relaxing in the tub ♫"
    end

    def work_out
        self.happiness += 2
        self.hygiene -= 3
        return "♪ another one bites the dust ♫"
    end

    def call_friend(friend)
        self.happiness += 3
        friend.happiness += 3
        self.happiness = 10 if happiness > 10
        friend.happiness = 10 if friend.happiness > 10
        "Hi #{friend.name}! It's #{name}. How are you?"
    end

    def start_conversation(person, topic)
        if topic == 'politics'
            self.happiness -= 2
            person.happiness -= 2
            self.happiness = 0 if self.happiness.negative?
            person.happiness = 0 if person.happiness.negative?
            'blah blah partisan blah lobbyist'
          elsif topic == 'weather'
            self.happiness += 1
            person.happiness += 1
            self.happiness = 10 if self.happiness > 10
            person.happiness = 10 if person.happiness > 10
            'blah blah sun blah rain'
          else
            'blah blah blah blah blah'
          end
    end

end
