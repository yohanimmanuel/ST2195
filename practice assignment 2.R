library('rvest')

url <- "https://en.wikipedia.org/wiki/Delimiter-separated_values"
csv_wiki <- read_html(url)


xpath_string = "//*[@id=mw-content-text]/div[1]/pre"
csv_tables <- csv_wiki %>%
  html_nodes(xpath = xpath_string)
  html_text()
csv_tables

csv_table <- csv_tables[1]

write.table(csv_table, file="")

