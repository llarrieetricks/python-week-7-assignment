import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import load_iris

# Load dataset
iris = load_iris()
df = pd.DataFrame(iris.data, columns=iris.feature_names)
df['species'] = pd.Categorical.from_codes(iris.target, iris.target_names)

# Display basic info
print("First 5 rows:\n", df.head())
print("\nInfo:\n")
print(df.info())
print("\nMissing values:\n", df.isnull().sum())
print("\nStatistics:\n", df.describe())

# Group by species
print("\nMean per species:\n", df.groupby("species").mean())

# Plots
sns.set(style="whitegrid")

# Line chart
plt.figure()
plt.plot(df["sepal length (cm)"])
plt.title("Sepal Length Trend")
plt.savefig("line_chart.png")


# Bar chart
plt.figure()
sns.barplot(x="species", y="petal length (cm)", data=df)
plt.title("Avg Petal Length per Species")
plt.savefig("bar_chart.png")
plt.show()

# Histogram
plt.figure()
plt.hist(df["sepal width (cm)"], bins=10)
plt.title("Sepal Width Distribution")
plt.savefig("histogram.png")
plt.show()

# Scatter plot
plt.figure()
sns.scatterplot(x="sepal length (cm)", y="petal length (cm)", hue="species", data=df)
plt.title("Sepal Length vs Petal Length")
plt.savefig("scatter_plot.png")
plt.show()
