library(tidyverse)
library(ggplot2)
# use the iris dataset
# 1. pass plots as parameters
plot1 <- ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width))

plot2 <- ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species))

plot3 <- ggplot(data = iris) +
  geom_bar(mapping = aes(x = Species, fill = Species))

rmarkdown::render(input = "test_params.Rmd",
                  output_file = "test.html",
                  params = list(plot1 = plot1,
                                plot2 = plot2,
                                plot3 = plot3))

# 2. Pass a string of Species that will be used to filter the lines
# use sapply to loop through each vector
species <- c("setosa", "versicolor", "virginica")
sapply(species, function(x) {
  rmarkdown::render(input = "iris_params_early.Rmd",
                    output_file = sprintf("iris_params_%s.html", x),
                    params = list(species = x))
})
