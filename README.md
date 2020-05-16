
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
`claims`.

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

The data frame has 100,000 rows and 57 variables. The variables
available are seen below.

``` r
for (var in names(claims)){
  print(var)
}
#> [1] "coverage_class"
#> [1] "form_year"
#> [1] "claim_id_key"
#> [1] "cs_claim_id_key"
#> [1] "services_key"
#> [1] "sv_line"
#> [1] "form_type"
#> [1] "sv_stat"
#> [1] "dis_stat"
#> [1] "pos"
#> [1] "age"
#> [1] "sex"
#> [1] "member_county"
#> [1] "member_state"
#> [1] "product_type"
#> [1] "lob"
#> [1] "insurance_type"
#> [1] "proc_code"
#> [1] "cdt_mod1"
#> [1] "cdt_mod2"
#> [1] "rev_code"
#> [1] "ub_bill_type"
#> [1] "adm_src"
#> [1] "adm_type"
#> [1] "client_los"
#> [1] "icd_10_or_higher"
#> [1] "icd_proc_01_pri"
#> [1] "icd_diag_01_primary"
#> [1] "icd_diag_admit"
#> [1] "icd_diag_02"
#> [1] "serv_prov_cw_key"
#> [1] "bill_prov_cw_key"
#> [1] "qty"
#> [1] "amt_billed"
#> [1] "amt_paid"
#> [1] "amt_deduct"
#> [1] "amt_coins"
#> [1] "amt_copay"
#> [1] "amt_prepaid"
#> [1] "inpatient_flag"
#> [1] "mr_line_case_key"
#> [1] "cases"
#> [1] "utils"
#> [1] "ndc"
#> [1] "claim_status_orig"
#> [1] "ecode_orig"
#> [1] "claim_adjustment_logic"
#> [1] "imputed_service_key"
#> [1] "cash"
#> [1] "total"
#> [1] "cpt_desc"
#> [1] "mr_line_new_desc"
#> [1] "mr_line_setting"
#> [1] "mr_line_abbrdesc"
#> [1] "mr_line_hcg"
#> [1] "new_diag_desc"
#> [1] "total_by_n"
```
