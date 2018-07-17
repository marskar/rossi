library(dplyr)

readxl::read_excel("Master_rrbs super cut ELR.xlsx") %>% 
  rename(Gene_ID = mgi) %>%
  rename(threshold = "DIO.vs.SG.p.value") %>%
  mutate(threshold = as.numeric(threshold)) %>%
  filter(.$Gene_ID %in% rna$Gene_ID) %>%
  filter(threshold < 0.01) %>%
  readr::write_csv("Master_rrbs_super-cut_elr_common-set_sigthres0-01.csv")

readxl::read_excel("Master_rnaseq_norm elr 5.20 CUT.xlsx") %>% 
  rename(threshold = "SG vs DIO pvalue") %>%
  mutate(threshold = as.numeric(threshold)) %>%
  filter(.$Gene_ID %in% rrbs_trim$Gene_ID) %>% 
  filter(threshold < 0.01) %>%
  readr::write_csv("Master_rnaseq_norm_elr_5.20_CUT_common-set_sigthres0-01.csv")
