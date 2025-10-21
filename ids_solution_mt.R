#QUESTION 2.......

# Create the employee dataset
emp_data <- data.frame(
  Emp_ID = c("E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8"),
  Name = c("X", "Y", "Z", "X", "Y", "Z", "X", "Y"),
  Age = c(34, 29, 40, 30, 35, 27, 41, 30),
  Dept = c("HR", "IT", "Finance", "Marketing", "HR", "IT", "Finance", "Marketing"),
  Salary = c(50000, 60000, 70000, 80000, 50000, 65000, 45000, 60000),
  Gender = c("Male", "Female", "Male", "Female", "Male", "Female", "Male", "Female"),
  Experience = c(5, 3, 10, 4, 2, 7, 9, 6)
)

# Display the dataset
print(emp_data)

salary_vector <- emp_data$Salary
average_salary <- mean(salary_vector)
average_salary
 
age_vector <- emp_data$Age
min_age <- min(age_vector)
max_age <- max(age_vector)

min_age
max_age

employee_list <- list(
  Name = "X",
  Department = "HR",
  Age = 34,
  Salary = 50000
)

# Display each element
employee_list

# Mean of salary and age
mean_salary <- mean(emp_data$Salary)
mean_age <- mean(emp_data$Age)

# Standard deviation
sd_salary <- sd(emp_data$Salary)
sd_age <- sd(emp_data$Age)

# Correlation between Salary and Age
correlation <- cor(emp_data$Salary, emp_data$Age)

mean_salary
sd_salary
correlation


