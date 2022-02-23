# PDF Keywords and sentences finder application based on R

## Overview
Dockerized R application to find keywords and/or sentences from PDF files and find which ones are a match. The structure of the program is as follows:
- pdf2text.R script converts the .pdf files into .txt, which are saved into the txt-files folder.
- keyword-finder.R script searches for case-insentive matches from keywords and sentences saved in the keywords.txt file. Matches are saved into an excel file that indicates what word/sentence has been matched and in which file(s).
- The output excel file has the matched words/sentences as the columns.

## How to get started
Docker must be installed:

- Check TSH's [building block](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/docker/)
 on how to set it up
 
## Running the application

1. Save the PDF files that you want to search for inside the "pdf-files" folder (*files/pdf-files*)
2. Input in the **keywords.txt** file any keywords or sentences that you want to search for in the previosuly saved .pdf files (inside the pdf-files folder).
      - Each keyword or sentence must be saved on a different line
      - The search is case-insensitive

4. Build the image from the directory where there Dockerfile is located by typing in the command line:
      ```bash
      docker build -t myname/myimage .
      ```
4. Once built (it might take a few minutes) run the image inside the container
      ```bash
      docker run -it --rm  -v "PATH on local computer":"container working directory" myname/myimage
      ```
5. Results are presented in the "search_results.xls" file (inside the output folder)



Note: .gitkeep files added in empty folders

