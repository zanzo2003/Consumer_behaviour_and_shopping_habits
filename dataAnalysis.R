library(dplyr)
library(ggplot2)

View(shopping_behavior_updated)
data <- shopping_behavior_updated


head(data)
summary(data)

# Group data by Location and calculate statistics for purchase amount
location_purchase_info <- data %>%
  group_by(Location) %>%
  summarize(
    mean = mean(`Purchase.Amount..USD.`),
    median = median(`Purchase.Amount..USD.`),
    sum = sum(`Purchase.Amount..USD.`)
  )

# Display the top 10 rows
head(location_purchase_info, 10)

# grouping and box plot - 1
demo_data <- data[, c("Age", "Gender", "Purchase.Amount..USD.", "Review.Rating")]
print(demo_data)
demo_data <- data[, c("Age","Purchase.Amount..USD.", "Review.Rating")]
boxplot(demo_data)
df <- data.frame(demo_data)
df

#PLOT - 2
demo_data <- data[, c("Age","Purchase.Amount..USD.")]

ggplot(demo_data, aes(x = Age, y = `Purchase.Amount..USD.`)) +
  geom_violin(alpha = 0.5) +  # Semi-transparent violin plots
  geom_point(position = position_jitter(width = 0.1), alpha = 0.3) +  # Jittered individual data points
  labs(title = "Distribution of Purchase Amount by Age (Violin Plots)",
       x = "Age", y = "Purchase Amount (USD)") +
  theme_bw() 

#plot - 3
seasonal_purchase <- data %>%
  group_by(Season) %>%
  summarize(mean_purchase_amount = mean(`Purchase.Amount..USD.`))
seasonal_purchase

ggplot(seasonal_purchase, aes(x = Season, y = mean_purchase_amount)) +
  geom_point() +  # Add data points
  labs(title = "Mean Purchase Amount by Season",
       x = "Season", y = "Mean Purchase Amount (USD)") +
  theme_bw() +
  scale_x_discrete(labels = unique(seasonal_purchase$Season))

#plot - 4
discount_col <- data["Discount.Applied"]
discount_applied <- table(discount_col)
discount_applied
pie_labels <- paste0(round(100 * discount_applied/sum(discount_applied), 2), "%")
pie(discount_applied, labels = pie_labels, main = "Purchases with Discount Applied")

#plot - 5
promo_col <- data["Promo.Code.Used"]
promo_applied <- table(promo_col)

pie_labels <- paste0(round(100 * promo_applied/sum(promo_applied), 2), "%")
pie(promo_applied, labels = pie_labels, main = "Purchases with Promo Codes")

#plot - 6
category_col <- data["Category"]
category_applied <- table(category_col)

cat_labels <- paste0(round(100 * category_applied/sum(category_applied), 2), "%")
pie(category_applied, labels = cat_labels, main = "Purchases per Category")
pie(category_applied, main = "Purchases per Category")

