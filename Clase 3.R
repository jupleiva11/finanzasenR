library(tidyverse)
library(httr)
library(readxl)
library(tidyverse)
library(httr)
library(readxl)

# Define the URL for the raw Excel file Para buscar en github se debe usar el view raw para trabajar directamente del portal

url <- "https://raw.githubusercontent.com/stringfestdata/advancing-into-analytics-book/main/datasets/star/star.xlsx"
# Get the data from the URL
response <- httr::GET(url)

# Ensure the response status is 200 (OK)
if (response$status_code == 200) {
  
  # Read data from the raw binary content
  temp_file <- tempfile(fileext = ".xlsx")
  writeBin(httr::content(response, "raw"), temp_file)
  data <- readxl::read_excel(temp_file)
  # Optionally, delete the temporary file after reading
  unlink(temp_file)
  # Use the data
  print(head(data))
} else {
  print("Failed to download file: HTTP status code is not 200")
}
data %>% 
group_by(classk) %>% 
summarise(n())


agrupacion <- data %>% 
group_by(race) %>% 
summarise(n())
data %>% group_by(classk) %>% summarise(mean(tmathssk))
# Define the URL for the raw CSV file
url <- "https://raw.githubusercontent.com/stringfestdata/advancing-into-analytics-book/main/datasets/star/districts.csv"

# Get the data from the URL
response <- httr::GET(url)
# Ensure the response status is 200 (OK)
if (response$status_code == 200) {
  # Read data directly from the raw binary content into a CSV format
  temp_file <- tempfile(fileext = ".csv")
  writeBin(httr::content(response, "raw"), temp_file)
  data_01 <- read.csv(temp_file) # Change to read.csv for CSV files
  # Optionally, delete the temporary file after reading
  unlink(temp_file)
  # Use the data
  print(head(data_01))
} else {
  print("Failed to download file: HTTP status code is not 200")
}

union_01 = data %>% 
  left_join(data_01, by = "schidkn")
data %>% left_join(data_01, by = "schidkn")
data %>% left_join(data_01, by = "schidkn") %>% group_by(county) %>% summarise(n())
data_join = data %>% left_join(data_01, by = "schidkn")
data_join %>% group_by(county) %>% summarise(n())  