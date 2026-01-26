library("arrow")
setwd(dir = "/Users/alexanderporshnev/Documents/Julia")
df_a<-arrow::read_feather("out_step_02/t_2009_top10.arrow")
names(df_a)
