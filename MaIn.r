
# Load necessary library
library(ggplot2)

# Set seed for reproducibility
set.seed(123)

# Generate sample data
states <- state.name
n_states <- length(states)
n <- 1000  # Number of observations

# Generate random housing costs
housing_costs <- rnorm(n, mean = 300000, sd = 50000)

# Generate random interest rates (e.g., between 2% and 8%)
interest_rates <- runif(n, min = 2, max = 8)

# Assign each cost and interest rate to a random state
df <- data.frame(
  State = sample(states, n, replace = TRUE),
  HousingCost = housing_costs,
  InterestRate = interest_rates
)

# Display first few rows of the dataset
head(df)

# Calculate mean housing cost and mean interest rate per state
mean_data <- aggregate(cbind(HousingCost, InterestRate) ~ State, data = df, mean)

# Create the line plot for mean housing cost
plot_cost <- ggplot(mean_data, aes(x = State, y = HousingCost, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  theme_minimal() +
  labs(title = "Mean Housing Cost by State", x = "State", y = "Mean Housing Cost") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

# Create the line plot for mean interest rate
plot_interest <- ggplot(mean_data, aes(x = State, y = InterestRate, group = 1)) +
  geom_line(color = "#ff4000") +
  geom_point(color = "#040401") +
  theme_minimal() +
  labs(title = "Mean Interest Rate by State", x = "State", y = "Mean Interest Rate (%)") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

# Display the plots
print(plot_cost)
print(plot_interest)
