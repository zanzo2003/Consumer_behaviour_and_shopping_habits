# question 5


# matrix function to construct a matrix, nrow is no of rows and ncol is no of columns
matrix_1 <- matrix(runif(100), nrow = 10, ncol = 10)
matrix_1

row_means <- rowMeans(matrix_1)
row_means

sd_row_means <- sd(row_means)
sd_row_means


random_matrix <- matrix(runif(1000), nrow = 10)

# Calculate column means
column_means <- colMeans(random_matrix)

# Plot a histogram of the column means
hist(column_means, main = "Histogram of Column Means", xlab = "Column Means", ylab = "Frequency")


random_matrix_large <- matrix(runif(100000), nrow = 100)

# Calculate column means
column_means_large <- colMeans(random_matrix_large)

# Plot a histogram of the column means
hist(column_means_large, main = "Histogram of Column Means (Large Matrix)", xlab = "Column Means", ylab = "Frequency")

