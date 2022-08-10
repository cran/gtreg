## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
# install.packages("gtreg")
library(gtreg)

## ----create-data--------------------------------------------------------------
dat <- tibble::tribble(
    ~subject, ~visit,  ~soc, ~ae, ~grade,
    # Subject 1 ----------------------------------------------------------------
    "001", 1, "Eye disorders", "Eye irritation", 1,
    "001", 1, "Gastrointestinal disorders", "Difficult digestion", NA,
    "001", 2, "Eye disorders", "Eye irritation", 1,
    "001", 3, "Eye disorders", "Eye irritation", 2,
    "001", 4, "Eye disorders", "Vision blurred", 2,
    # Subject 2 ----------------------------------------------------------------
    "002", 1, "Gastrointestinal disorders", "Difficult digestion", 2,
    "002", 1, "Gastrointestinal disorders", "Reflux", 2,
    "002", 2, "Eye disorders", "Vision blurred", 2,
    "002", 2, "Gastrointestinal disorders", "Reflux", 2,
    "002", 3, "Gastrointestinal disorders", "Reflux", NA
  )

## ----print-data---------------------------------------------------------------
dat

## ----count-all----------------------------------------------------------------
dat %>% 
  tbl_ae_count(
    ae = ae,
    soc = soc,
    by = grade
  ) %>% 
  modify_header(all_ae_cols() ~ "**Grade {by}**") %>% 
  add_overall() %>% 
  bold_labels()

## ----count-max-1--------------------------------------------------------------
dat %>% 
  tbl_ae(
    id = subject,
    ae = ae,
    soc = soc,
    by = grade,
    statistic = "{n}"
  ) %>% 
  modify_header(all_ae_cols() ~ "**Grade {by}**") %>% 
  add_overall() %>% 
  bold_labels()

## ----count-max-2--------------------------------------------------------------
dat %>% 
  tbl_ae(
    id = subject,
    ae = ae,
    soc = soc,
    by = grade
  ) %>% 
  modify_header(all_ae_cols() ~ "**Grade {by}**") %>%
  modify_spanning_header(all_ae_cols() ~ "**N = {N}**") %>% 
  add_overall() %>% 
  bold_labels()

## ----count-max-3--------------------------------------------------------------
dat %>% 
  tbl_ae(
    id = subject,
    id_df = tibble::tibble(subject = c("001", "002", "003")),
    ae = ae,
    soc = soc,
    by = grade
  ) %>% 
  modify_header(all_ae_cols() ~ "**Grade {by}**") %>% 
  modify_spanning_header(all_ae_cols() ~ "**N = {N}**") %>% 
  add_overall() %>% 
  bold_labels()

