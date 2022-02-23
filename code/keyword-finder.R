# required libraries
library(stringr)
library(writexl)
# Set files and keywords
files <- str_remove(list.files("files/txt-files/", full.names = T), "files/txt-files/")
keywords <- c(readLines("keywords.txt"))

# Prepare table for search results
output <- data.frame(matrix(0, ncol = length(keywords)+1))
colnames(output) <- c("file", keywords)

# Search for matches and return 1 if found
for (fn in files) {
  for (kw in keywords) {
    if (length(grep(kw, readLines(paste("files/txt-files/",fn, sep = "")), ignore.case = T)) > 0){ # nolint
          output[fn, kw] = 1
    }
  }
}

# Save search results
output <- output[-1,]
output$file <- rownames(output)
output$file <- str_remove(output$file, ".pdf.txt")
write_xlsx(output, "output/search_results.xls")
