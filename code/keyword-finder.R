# Set files and keywords
files <- str_remove(list.files("../files/txt-files/", full.names = T), "../files/txt-files/")
keywords <- c(readLines("../keywords.txt"))

# Prepare table for search results
output <- data.frame(matrix(0, nrow = length(files), ncol = length(keywords)+1))
colnames(output) <- c("file", keywords)
output$file <- str_remove(files, ".pdf.txt")

# Search for matches and return 1 if found
for (i in length(output$file)){
  for (fn in files){
    for (kw in keywords) {
      if (length(grep(kw, readLines(paste("../files/txt-files/",fn, sep = "")), ignore.case = T)) > 0){
        output[i, kw] = 1
      }
    }
  }
}

# Save search results
library(writexl)
write_xlsx(output, "../output/search_results.xls")
