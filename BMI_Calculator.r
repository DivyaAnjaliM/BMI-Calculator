# Install necessary packages
# Uncomment these lines if you haven't installed the packages
# install.packages("shiny")
# install.packages("ggplot2")

library(shiny)
library(ggplot2)

# Function to calculate BMI
calculate_bmi <- function(weight_kg, height_m) {
  bmi <- weight_kg / (height_m^2)
  return(bmi)
}

# Function to determine BMI category
determine_bmi_category <- function(bmi) {
  if (bmi < 18.5) {
    return("Underweight")
  } else if (bmi >= 18.5 && bmi <= 24.9) {
    return("Normal Weight")
  } else if (bmi >= 25 && bmi <= 29.9) {
    return("Overweight")
  } else {
    return("Obese")
  }
}

# Function to get user details and store them in a CSV file
record_user_details <- function() {
  # Prompt the user for their details
  cat("**Welcome to the BMI Calculator**\n")
  name <- readline("Enter your name: ")
  age <- as.numeric(readline("Enter your age: "))
  weight_kg <- as.numeric(readline("Enter your weight in kilograms: "))
  height_m <- as.numeric(readline("Enter your height in meters: "))

  # Calculate BMI
  bmi <- calculate_bmi(weight_kg, height_m)

  # Determine BMI category
  bmi_category <- determine_bmi_category(bmi)

  # Create a data frame with user details
  user_data <- data.frame(Name = name, Age = age, Weight_kg = weight_kg, Height_m = height_m, BMI = bmi, Category = bmi_category)

  # Check if the CSV file exists
  if (file.exists("user_details1.csv")) {
    # If it exists, read the existing data
    existing_data <- read.csv("user_details1.csv")

    # Append the new data to the existing data using rbind
    updated_data <- rbind(existing_data, user_data)

    # Write the updated data back to the CSV file
    write.csv(updated_data, "user_details1.csv", row.names = FALSE)
    cat("User details added to the CSV file.\n")

    # Create a BMI distribution graph
    ggplot(updated_data, aes(x = BMI)) +
      geom_histogram(binwidth = 1, fill = "blue", color = "black", alpha = 0.7) +
      labs(title = "BMI Distribution", x = "BMI", y = "No. of persons") +
      theme_minimal()

    # Save the graph as an image
    ggsave("bmi_distribution.png", width = 6, height = 4)
    cat("BMI distribution graph saved as 'bmi_distribution.png'.\n")
  } else {
    # If the CSV file doesn't exist, create it and write the data
    write.csv(user_data, "user_details1.csv", row.names = FALSE)
    cat("CSV file created and user details added.\n")
  }
}

# Main program loop
while (TRUE) {
  record_user_details()

  # Ask the user if they want to add more user details
  add_more <- tolower(readline("Do you want to add more user details? (yes/no): "))
  if (add_more != "yes") {
    break
  }
}

cat("Thank you for using the BMI calculator.\n")
