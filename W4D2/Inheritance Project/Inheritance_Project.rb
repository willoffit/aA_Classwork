class Employee
    attr_reader :salary

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
      bonus = self.salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss)
        @employees = []
        super
    end

    def bonus(multiplier)
      employee_salaries = 0

      employees.each do |employee|
        employee_salaries += employee.salary
      end

      employee_salaries * multiplier
    end

end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

ned.employees = [darren, shawna, david]
darren.employees = [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
