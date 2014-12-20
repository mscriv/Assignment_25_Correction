class Company
attr_accessor :name
attr_accessor :city
attr_accessor :employees
def initialize
@employees = Array.new
end
# Adds the passed employee to the company employee list
def hire_employee(employee)
@employees << employee
end
# Removes the passed employee from the company employee list
def fire_employee(employee)
@employees.reject! { |emp| emp.idNum == employee.idNum}
end
end

class Employee
@@employee_number = 0
def initialize
@@employee_number += 1
@idNum = @@employee_number
end
attr_accessor :name
attr_accessor :city
attr_accessor :idNum
end

company = Company.new
print "Enter the name of the company: "
company.name = gets.strip
print "Enter the city where the company is located: "
company.city = gets.strip
loop do
employee = Employee.new
print "Enter the employee name: "
employee.name = gets.strip
break if employee.name == ""
print "Enter the employee's city: "
employee.city = gets.strip
company.hire_employee(employee)
end

puts "Employees of #{company.name} located in #{company.city}:"
company.employees.each do |emp|
puts "Name: #{emp.name}\tCity: #{emp.city}\tID: #{emp.idNum}"
end
print "\nEnter the ID number of the employee to fire (ENTER to skip): "
ans = gets.strip.to_i
if ans != ""
  term_emp = company.employees.select { |emp| emp.idNum == ans }.first
  puts "\n#{term_emp.name} has been terminated"
  company.fire_employee(term_emp)
puts "\nEmployees of #{company.name} located in #{company.city}:"
company.employees.each do |emp|
puts "Name: #{emp.name}\tCity: #{emp.city}\tID: #{emp.idNum}"
end
end