function (df, col.No) {
  require (stringr)
  require (data.table)
  name_df <- read.csv ("name_dict.csv", header = T, stringsAsFactors = F)
  for (i in 1:nrow(df)) {
    str_ext <- str_to_lower (df [i, col.No])
    str_loc <- str_locate_all (str_ext, "[a-z]+") [[1]]
    str_get <- str_sub (str_ext, str_loc [,"start"], str_loc [,"end"])
    en_word <- data.frame (name_en = str_get, stringsAsFactors = F)
    all_name <-left_join(en_word, name_df)
    df$name_my [i] <- paste0 (all_name$name_my, collapse = "")
    df
  }
}