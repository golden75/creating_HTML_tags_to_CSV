library(splitstackshape)
# Copyright
# Neranjan Perera 
# Computational Biology Core
# Institute for Systems Genomics
# University of Connecticut
# 2018/01/12

### 1
## read csv file with software information 
# 4 columns= version : software : catogary : web-link
# eg: 
# bismark/0.19.0               - module 
# Bismark                      - Software
# ChIP-Seq/Methyl-Seq Analysis  - Catogory
# https://github.com/FelixKrueger/Bismark - link

### 2
## Once read the CSV file we need to get the following information:
# Catogary : ChIP-Seq/Methyl-Seq Analysis
# Software : Bismark ( with web link https://github.com/FelixKrueger/Bismark)
# Version  : 3.2.3
# module   : module load bismark/0.19.0

### 3
## Then organize it into HTML tags of
#<tr>
# <td style="width: 25%;"><span style="color: #ff6600;"><strong> </strong></span></td>
#   <td style="width: 25%;"></td>
#     <td style="width: 10%;"></td>
#       <td style="width: 35%;"></td>
#         </tr>

### 4
## To reflect:
#<tr>
# <td style="width: 25%;"><span style="color: #ff6600;"><strong>Alignment/Annotation</strong></span></td>
#   <td style="width: 25%;"><a href="http://bioinf.uni-greifswald.de/augustus/">Augustus</a></td>
#     <td style="width: 10%;">3.2.3</td>
#       <td style="width: 35%;">module load augustus</td>
#         </tr>

## read csv file with software information
df1 <- read.csv('../software_template.csv', header = F)

# rename the columns
colnames(df1) <- c("version","software","catogary","website")
# create the txt file to write the HTML code:
software_page <- file("software_html_code.txt")

# Read each row in in the CSV file using a for loop
for (i in 1:nrow(df1)){
  print(i) 
  # get each column data into variables
  version <- as.vector(df1$version[[i]])
  software <- as.vector(df1$software[[i]])
  catogary <- as.vector(df1$catogary[[i]])
  web <- as.vector(df1$website[[i]])

  nl=cSplit(df1, 'version', sep = "/", stripWhite = TRUE)
  nl <- strsplit(version, '/')
  #print(line_print)
  line1 <- paste0("<tr>")
  line2 <- paste0("<td style=\"width: 25%;\"><span style=\"color: #ff6600;\"><strong>",catogary,"</strong></span></td>")
  line3 <- paste0("<td style=\"width: 25%;\"><a href=\"",web,"\">",software,"</a></td>")
  line4 <- paste0("<td style=\"width: 10%;\">",version,"</td>")
  line5 <- paste0("<td style=\"width: 35%;\">module load ",version,"</td>")
  line6 <- paste0("</tr>")
  write(line1,file = "software_html_code.txt", append = TRUE)
  write(line2,file = "software_html_code.txt", append = TRUE)
  write(line3,file = "software_html_code.txt", append = TRUE)
  write(line4,file = "software_html_code.txt", append = TRUE)
  write(line5,file = "software_html_code.txt", append = TRUE)
  write(line6,file = "software_html_code.txt", append = TRUE)
}
