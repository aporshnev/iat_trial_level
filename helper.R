library("arrow")
library(dplyr)
setwd(dir = "/Users/alexanderporshnev/Documents/Julia")
df<-arrow::read_feather("../out_step_02/t_2009g+.arrow")
df_a<-arrow::read_feather("../out_step_02/t_2009_Ac.arrow")
df_b<-arrow::read_feather("../out_step_02/t_2009_Bc.arrow")

subj_all<-unique(df$subj)
length(subj_all)== length(subj_a)+length(subj_b)
subj_a<-unique(df_a$subj)
subj_b<-unique(df_b$subj)
subj_all 
intersect(subj_a, subj_b)
table(intersect(subj_a, subj_all) == subj_a)
table(intersect(subj_b, subj_all) == subj_b)

table(df_b$subj)
table(df %>% filter(subj %in% subj_b) %>%select(subj))
#10254057 10254233 10254587 10255058 10255213 10255326 10255348 10255407 10255449 10255543 10255549 10255570 10255689 10255702 10255739 10255779 
112      108      114      115      114      117       96      115      112      114      114      116      102      113      119      105 
10256185 10256235 10256322 10256411 10256754 10256769 10256773 10256776 10256777 10256795 10256812 10257575 10257861 10258086 10258787 10258819 
101      112      115      100      109      108      118      106      111      117      114      116      105      106      108       82 
10259800 10259957 10260139 10260348 10260516 10261208 10261401 10261624 
119      114      114      107      117      116      108      110 

#10254057 10254233 10254587 10255058 10255213 10255326 10255348 10255407 10255449 10255543 10255549 10255570 10255689 10255702 10255739 10255779 
112      108      114      115      114      117       96      115      112      114      114      116      102      113      119      105 
10256185 10256235 10256322 10256411 10256754 10256769 10256773 10256776 10256777 10256795 10256812 10257575 10257861 10258086 10258787 10258819 
101      112      115      100      109      108      118      106      111      117      114      116      105      106      108       82 
10259800 10259957 10260139 10260348 10260516 10261208 10261401 10261624 
119      114      114      107      117      116      108      110 
df_a<-arrow::read_feather("out_step_02/t_2009_clean.arrow")

df_a<-arrow::write_feather(df_a, "out_step_02/t_2009_clean.arrow")
df_a<-df_a %>% select(c(-"ldm"))
names(df_a)
View(df_a[1:10,])
d<-read.csv("../in_Distances/llms_systematic/cor_dolphin-2.8-mistral-7b-v02-Q8_0_pairs_names_Upper.csv")

names(d)<-c("N", "First word", "Second word", "ldm1")
d1=d[,2:4]
write.csv(d1,"../in_Distances/all/cor_dolphin-2.8-mistral-7b-v02-Q8_0_pairs_names_Upper.csv")

d<-read.csv("../in_Distances/all/cos_subtitles_skipgram_50_r3.csv")
names(d)<-c("First word", "Second word", "ldmX")
write.csv(d,"../in_Distances/all/cos_subtitles_skipgram_50_r3.csv", row.names = FALSE)

d<-read.csv("../in_Distances/all/cos_subtitles_skipgram_100_r5.csv")
names(d)<-c("First word", "Second word", "ldmX")
write.csv(d,"../in_Distances/all/cos_subtitles_skipgram_100_r5.csv",row.names = FALSE)

d<-read.csv("../in_Distances/all/cos_subtitles_skipgram_50_r5.csv")
names(d)<-c("First word", "Second word", "ldmX")
write.csv(d,"../in_Distances/all/cos_subtitles_skipgram_50_r5.csv",row.names = FALSE)
cos_subtitles_skipgram_50_r5

library(dplyr)
d<-read.csv("/Users/alexanderporshnev/Documents/iat_trial_level/results.csv")
results_summary <- d %>% group_by(by = model)%>%summarise(mCor = mean(Cor), mR2 = mean(R2_ldm_conditional), mF2 = mean(f2_conditional), m_Coef = mean(coef_lmd), mRMSEA = mean(RMSEA))
results_summary$abs_mCor<-abs(results_summary$mCor)
write.csv(results_summary, "/Users/alexanderporshnev/Documents/iat_trial_level/results_summary.csv")

head(results_summary %>% sort_by(results_summary$abs_mCor, decreasing = TRUE),10)
head(results_summary %>% sort_by(results_summary$mR2, decreasing = TRUE),10)
head(results_summary %>% sort_by(results_summary$mRMSEA, decreasing = FALSE),10)
