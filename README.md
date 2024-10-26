# Overview of the Code:
•	BMI Calculation: The function calculate_bmi takes weight (in kilograms) and height (in meters) as input and calculates the BMI.

•	BMI Category: The function determine_bmi_category categorizes the BMI into "Underweight," "Normal Weight," "Overweight," or "Obese."

•	CSV Handling: The user details (name, age, weight, height, BMI, and BMI category) are stored in a CSV file. If the file user_details1.csv already exists, new data    is appended to it.

•	Visualization: Using ggplot2, a BMI distribution graph is generated and saved as an image file (bmi_distribution.png).

•	Main Loop: The program continues to ask for user details, calculates BMI, records the data, and creates a graph until the user decides to stop.
