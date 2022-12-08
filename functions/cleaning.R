#clean column names, remove empty rows, remove columns called comment and delta

cleaning <- function(data_raw){
 data_raw %>%
   clean_names() %>%
   remove_empty(c("rows", "cols")) %>%
   select(-starts_with("delta")) %>%
   select(-comments)
}
 
#remove rows with missing data on flipper length and body mass, change species names
 
clean_flipper_body <- function(data_clean){
 data_clean %>%
   filter(!is.na(flipper_length_mm)) %>%
    filter(!is.na(body_mass_g)) %>%
      select(species, flipper_length_mm, body_mass_g)
}