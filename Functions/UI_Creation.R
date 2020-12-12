
mdf <- read.csv("~/GitHub/mixology-app/Data/bartending_vertical.csv", stringsAsFactors = F)



end_string = ''
string_oupt = ''
vec_type = ''
final_oupt = ''
counter = 1
for (j in sort(unique(mdf$Ingredient.Type))){
  beginning_string = paste0('fluidRow( \n\t h4("', j, '"),\n')
  counter2 = 1
  end_string = ''
  for (i in sort(unique(mdf$Ingredient[mdf$Ingredient.Type==j]))){
    if (counter2 != length(unique(mdf$Ingredient[mdf$Ingredient.Type == j]))){
      cur_paste = paste0('\n box( \n\t title = "', i, '", \n\t width = 2, \n\t height = "100px", \n\t status = "info" \n ),')
      end_string = paste0(end_string, cur_paste, collapse = '')
    } else {
      cur_paste = paste0('\n box( \n\t title = "', i, '", \n\t width = 2, \n\t height = "100px", \n\t status = "info" \n ) \n)')
      end_string = paste0(end_string, cur_paste, collapse = '')
    }
    counter2 = counter2 + 1
  }
  full_string = paste0(beginning_string, end_string, collapse =  '')
  vec_type = c(vec_type, j)
  string_oupt = c(string_oupt, full_string)
  if (counter == length(unique(mdf$Ingredient.Type))){
    final_oupt = paste0(final_oupt, full_string)
  } else {
    final_oupt = paste0(final_oupt, full_string, ",\n\n")
  }
  counter = counter + 1
}
string_oupt = string_oupt[2:17]
to_shiny = ''
for (i in 1:length(string_oupt)){
  if (i < length(string_oupt)){
    to_shiny = paste0(to_shiny, string_oupt[i], ',\n')
  } else {
    to_shiny = paste0(to_shiny, string_oupt[i])
  }
}

pander::evals(c(string_oupt[1], string_oupt[2]))


df = as.data.frame(cbind("Type" = vec_type, 
                         "String" = string_oupt),
                   stringsAsFactors = F)
    




###############
# redo
###############

mdf <- read.csv("~/GitHub/mixology-app/Data/bartending_vertical.csv", stringsAsFactors = F)

i = 1
cur_it = sort(unique(mdf$Ingredient.Type))[i]
header_string = paste0("fluidRow( \n\th4(", cur_it, "),\n")
full_box_statement = ''
for (j in 1:length(unique(mdf$Ingredient[mdf$Ingredient.Type == cur_it]))){
  cur_i = sort(unique(mdf$Ingredient[mdf$Ingredient.Type == cur_it]))[j]
  print(cur_i)
  if (j < length(unique(mdf$Ingredient[mdf$Ingredient.Type == cur_it]))){
    box_statement = paste0('\n box( \n\t title = "', cur_i, '", \n\t width = 2, \n\t height = "100px", \n\t status = "info"),')
  } else {
    box_statement = paste0(' \n box( \n\t title = "', cur_i, '", \n\t width = 2, \n\t height = "100px", \n\t status = "info")')
  }
  full_box_statement = paste0(full_box_statement, box_statement)
}


for (i in 1:length(unique(mdf$Ingredient.Type))){
  cur_it = sort(unique(mdf$Ingredient.Type))[i]
  header_string = paste0("fluidRow( \n\th4(", cur_it, "),\n")
  full_box_statement = ''
  for (j in 1:length(unique(mdf$Ingredient[mdf$Ingredient.Type == cur_it]))){
    cur_i = sort(unique(mdf$Ingredient[mdf$Ingredient.Type == cur_it]))[j]
    if (j < length(unique(mdf$Ingredient[mdf$Ingredient.Type == cur_it]))){
      box_statement = paste0(' box( title = "', cur_i, '", width = 2, height = "100px", status = "info"),')
    } else {
      box_statement = paste0(' box( title = "', cur_i, '", width = 2, height = "100px", status = "info")')
    }
    full_box_statement = paste0(full_box_statement, box_statement)
  }
}





sample1 <- "fluidRow(box(title = 'Test Title', width = 2, height = '100px', status = 'info'),box(title = 'Test Title', width = 2, height = '100px', status = 'info'))"
sample2 <- "fluidRow(box(title = 'Test Title', width = 2, height = '100px', status = 'info'),box(title = 'Test Title', width = 2, height = '100px', status = 'info'))"
samples = c(sample1, sample2)
sapply(samples, function(x) eval(parse(text = x)))



##############################################




mdf <- read.csv("~/GitHub/mixology-app/Data/bartending_vertical.csv", stringsAsFactors = FALSE)
end_string = ''
string_oupt = list()
vec_type = ''
final_oupt = ''
counter = 1

for (j in sort(unique(mdf$Ingredient.Type))){
  counter2 = 1
  for (i in sort(unique(mdf$Ingredient[mdf$Ingredient.Type==j]))){
    
  }
}


for (j in sort(unique(mdf$Ingredient.Type))){
  beginning_string = paste0('fluidRow( \n\t h4("', j, '"),\n')
  counter2 = 1
  end_string = ''
  for (i in sort(unique(mdf$Ingredient[mdf$Ingredient.Type==j]))){
    if (counter2 != length(unique(mdf$Ingredient[mdf$Ingredient.Type == j]))){
      cur_paste = paste0('\n box( \n\t title = "', i, '", \n\t width = 2, \n\t height = "300px", \n\t status = "info", \n\t actionButton("add_to_cart", "Add to My List"), \n\t img(src = "images/', gsub(" ", "_", tolower(i)),'.jpg", height = "25%", width = "25%", align = "top") \n ),')
      end_string = paste0(end_string, cur_paste, collapse = '')
    } else {
      cur_paste = paste0('\n box( \n\t title = "', i, '", \n\t width = 2, \n\t height = "100px", \n\t status = "info" \n ) \n)')
      end_string = paste0(end_string, cur_paste, collapse = '')
    }
    counter2 = counter2 + 1
  }
  full_string = paste0(beginning_string, end_string, collapse =  '')
  vec_type = c(vec_type, j)
  string_oupt = c(string_oupt, full_string)
  if (counter == length(unique(mdf$Ingredient.Type))){
    final_oupt = paste0(final_oupt, full_string)
  } else {
    final_oupt = paste0(final_oupt, full_string, ",\n\n")
  }
  counter = counter + 1
}
string_oupt = string_oupt[2:17]
to_shiny = ''
for (i in 1:length(string_oupt)){
  if (i < length(string_oupt)){
    to_shiny = paste0(to_shiny, string_oupt[i], ',\n')
  } else {
    to_shiny = paste0(to_shiny, string_oupt[i])
  }
}








#########################


