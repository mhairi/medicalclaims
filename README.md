
<!-- README.md is generated from README.Rmd. Please edit that file -->

# medicalclaims

A data package with a sample of 100,000 anonymised medical claims New
Hampshire’s Comprehensive Health Information System
(<https://nhchis.com/>).

## Installation

You can install though GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("mhairi/medicalclaims")
```

## Example

Once you’ve loaded the package, the data is in an object called
`claims`. The data frame has 100,000 rows and 57 variables.

``` r
library(medicalclaims)
head(claims)
#>   coverage_class form_year claim_id_key cs_claim_id_key services_key
#> 1            MED      2016    140080841       140080841    284130245
#> 2            MED      2016    140080841       140080841    284130249
#> 3            MED      2016    194338559       194338559    238447503
#> 4            MED      2016     23570691        23570691    159659802
#> 5            MED      2016     23570691        23570691    159659805
#> 6            MED      2016     23570691        23570691    159659809
#>   sv_line form_type sv_stat dis_stat pos age sex member_county
#> 1       2         H       P       NA  81  64   M            11
#> 2       1         H       P       NA  81  64   M            11
#> 3      10         H       P       NA  22  62   M            11
#> 4      20         H       P       NA  20  20   F            11
#> 5      10         H       P       NA  20  20   F            11
#> 6      30         H       P       NA  20  20   F            11
#>   member_state product_type        lob insurance_type proc_code cdt_mod1
#> 1           NH          HMO COMMERCIAL             HM     36415       N/
#> 2           NH          HMO COMMERCIAL             HM     85610       N/
#> 3           NH          HMO COMMERCIAL             HM     93010       N/
#> 4           NH          HMO COMMERCIAL             HM     87081       N/
#> 5           NH          HMO COMMERCIAL             HM     87880       N/
#> 6           NH          HMO COMMERCIAL             HM     99213       25
#>   cdt_mod2 rev_code ub_bill_type adm_src adm_type client_los
#> 1       N/       NA           NA      NA       NA         NA
#> 2       N/       NA           NA      NA       NA         NA
#> 3       N/       NA           NA      NA       NA         NA
#> 4       N/       NA           NA      NA       NA         NA
#> 5       N/       NA           NA      NA       NA         NA
#> 6       N/       NA           NA      NA       NA         NA
#>   icd_10_or_higher icd_proc_01_pri icd_diag_01_primary icd_diag_admit
#> 1                1              NA               D6852           <NA>
#> 2                1              NA               D6852           <NA>
#> 3                1              NA               G5602           <NA>
#> 4                1              NA                J029           <NA>
#> 5                1              NA                J029           <NA>
#> 6                1              NA                J029           <NA>
#>   icd_diag_02 serv_prov_cw_key bill_prov_cw_key qty amt_billed amt_paid
#> 1        I776          3613074          1477238   1      25.00     0.00
#> 2        I776          3613074          1477238   1      35.00     0.00
#> 3        <NA>           659123           330257   1      21.00    20.08
#> 4        J069           919693           919693   1       9.54     9.03
#> 5        J069           919693           919693   1      18.94    15.60
#> 6        J069           919693           919693   1     165.00    87.54
#>   amt_deduct amt_coins amt_copay amt_prepaid inpatient_flag
#> 1       2.28         0         0           0              N
#> 2       4.29         0         0           0              N
#> 3       0.00         0         0           0              N
#> 4       0.00         0         0           0              N
#> 5       0.00         0         0           0              N
#> 6       0.00         0         0           0              N
#>   mr_line_case_key cases utils ndc claim_status_orig ecode_orig
#> 1              638    NA     1  NA                 1       <NA>
#> 2              638    NA     1  NA                 1       <NA>
#> 3              613    NA     1  NA                 1       <NA>
#> 4              636    NA     1  NA                 1       <NA>
#> 5              636    NA     1  NA                 1       <NA>
#> 6              586    NA     1  NA                 1       <NA>
#>   claim_adjustment_logic imputed_service_key cash total
#> 1                   CAL2        2016_1560554 2.28  2.28
#> 2                   CAL2        2016_1560554 4.29  4.29
#> 3                   CAL2       2016_15605580 0.00 20.08
#> 4                   CAL2       2016_15605601 0.00  9.03
#> 5                   CAL2       2016_15605601 0.00 15.60
#> 6                   CAL2       2016_15605601 0.00 87.54
#>                                                     cpt_desc
#> 1            Needle insertion for collection of blood sample
#> 2                                  Blood test, clotting time
#> 3 EKG using at least 12 leads with interpretation and report
#> 4                    Screening test for pathogenic organisms
#> 5                        Strep test (Streptococcus, group A)
#> 6        Office or other outpatient visit, typically 15 mins
#>         mr_line_new_desc                      mr_line_setting
#> 1 Pathology/Lab - Office                      Independent Lab
#> 2 Pathology/Lab - Office                      Independent Lab
#> 3         Cardiovascular                   PHY Cardiovascular
#> 4 Pathology/Lab - Office PHY Pathology/Lab - Office - General
#> 5 Pathology/Lab - Office PHY Pathology/Lab - Office - General
#> 6     Urgent Care Visits       Urgent Care Visits:  Physician
#>   mr_line_abbrdesc     mr_line_hcg                           new_diag_desc
#> 1              PHY 3. Professional               Prothrombin gene mutation
#> 2              PHY 3. Professional               Prothrombin gene mutation
#> 3              PHY 3. Professional Carpal tunnel syndrome, left upper limb
#> 4              PHY 3. Professional                       Acute pharyngitis
#> 5              PHY 3. Professional                       Acute pharyngitis
#> 6              PHY 3. Professional                       Acute pharyngitis
#>   total_by_n
#> 1       2.28
#> 2       4.29
#> 3      20.08
#> 4       9.03
#> 5      15.60
#> 6      87.54
```

Here is how you find the procedures with the highest average cost, only
counting procedures that have appeared at least 10 times in the data.

``` r
library(tidyverse)

claims %>% 
  group_by(cpt_desc) %>%
  summarise(
    avg_cost = mean(total_by_n),
    n = n()
  ) %>% 
  filter(n > 10) %>% 
  arrange(desc(avg_cost)) %>% 
  top_n(10, avg_cost)
#> # A tibble: 10 x 3
#>    cpt_desc                                                  avg_cost     n
#>    <chr>                                                        <dbl> <int>
#>  1 OBGYN pre and postpartum care and vaginal delivery           3784.    20
#>  2 Sleep monitoring of patient (6 years or older) in sleep …    2484.    20
#>  3 Nuclear medicine study of vessels of heart                   2199.    14
#>  4 Biopsy of breast accessed through the skin with stereota…    2037.    11
#>  5 MRI scan of abdomen before and after contrast                1803.    11
#>  6 Radiation therapy delivery                                   1580.    43
#>  7 Diagnostic exam of large bowel using an endoscope            1562.    45
#>  8 MRI scan of brain before and after contrast                  1561.    63
#>  9 Removal of one knee cartilage using an endoscope             1537.    19
#> 10 CT scan of abdomen and pelvis with contrast                  1411.   129
```

If you want to look at how expensive different diagnoses are, then you
first need to summarise over `imputed_service_key` and
`icd_diag_01_primary`. This gives us the total spending for each patient
and each diagnosis.

``` r
by_individual <- 
claims %>% 
  group_by(new_diag_desc, imputed_service_key) %>% 
  summarise(spending = sum(total))  %>% 
  ungroup 
```

Then we can summarise to find the most expensive diagnoses.

``` r
by_individual %>% 
  group_by(new_diag_desc) %>%
  summarise(
    avg_cost = mean(spending),
    n = n()
  ) %>% 
  filter(n > 10) %>% 
  arrange(desc(avg_cost)) %>% 
  top_n(10, avg_cost)
#> # A tibble: 10 x 3
#>    new_diag_desc                                             avg_cost     n
#>    <chr>                                                        <dbl> <int>
#>  1 Antineoplastic Chemotherapy Session                          4041.    36
#>  2 Chronic inflammatory demyelinating polyneuritis              3848.    14
#>  3 Malignant neoplasm of ovrlp sites of left female breast      3017.    16
#>  4 Hydronephrosis with renal and ureteral calculous obstruc…    2811.    12
#>  5 Crohn's disease, without complications                       2536.    29
#>  6 Malignant neoplasm of unspecified site of left female br…    2439.    35
#>  7 Malignant neoplasm of brain                                  2158.    11
#>  8 Ulcerative colitis, without complications                    1919.    25
#>  9 Encounter for full-term uncomplicated delivery               1905.    40
#> 10 Encounter for antineoplastic radiation therapy               1707.    89
```
