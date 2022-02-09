# convert multiple pdf-files to txt
# install.packages(c("pdftools", "dplyr", "stringr", "httr", "jsonlite"))

library(pdftools)
library(dplyr)
library(stringr)

# Function
convertpdf2txt <- function(dirpath){
  files <- list.files(dirpath, full.names = T)
  x <- sapply(files, function(x){
    x <- pdftools::pdf_text(x) %>%
      paste(sep = " ") %>%
      stringr::str_replace_all(fixed("\n"), " ") %>%
      stringr::str_replace_all(fixed("\r"), " ") %>%
      stringr::str_replace_all(fixed("\t"), " ") %>%
      stringr::str_replace_all(fixed("\""), " ") %>%
      paste(sep = " ", collapse = " ") %>%
      stringr::str_squish() %>%
      stringr::str_replace_all("- ", "") 
    return(x)
  })
}

# Apply function
txts <- convertpdf2txt("../files/pdf-files/")

# Save the files
names(txts) <- str_remove(names(txts), "../files/pdf-files/")
lapply(seq_along(txts), function(i)writeLines(text = unlist(txts[i]),
     con = paste("../files/txt-files/", names(txts)[i],".txt", sep = "")))
