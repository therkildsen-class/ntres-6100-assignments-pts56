# Assignment 6


# Assignment 6: Data import and tidy data

## Instructions: Please read through this before you begin

-   This homework is due by **10pm on Thursday 10/09/2025**. Please
    upload it using your personal GitHub repository for this class.

-   Please name your Quarto file `assignment_6.qmd` and the rendered
    markdown file `assignment_6.md`.

-   For this assignment, please **reproduce this markdown file** using
    Quarto. This includes the followings:

    -   **Reproduce this markdown template**, except for this list of
        instructions which you **don’t** have to include. Pay attention
        to all the formatting in this file, including bullet points,
        bolded characters, inserted code chunks, headings, text colors,
        blank lines, etc.

    -   Have all your code embedded within the Quarto file, and show
        **BOTH your code and plots** in the knitted markdown file.

    -   Use Quarto functionalities to **hide messages and warnings when
        needed**. (Suggestion: messages and warnings can often be
        informative and important, so please examine them carefully and
        only turn them off when you finish the exercise).

-   Please note that you only need to finish **three out of the five**
    questions in **Exercise 1** in order to get credit for that
    exercise. Also, **Exercise 3** is **optional**.

-   To start, first load all the required packages with the following
    code. Install them if they are not installed yet.

``` r
library(tidyverse)
library(knitr)
```

``` r
library(tidyverse)
```

    ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ✔ ggplot2   3.5.2     ✔ tibble    3.3.0
    ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ✔ purrr     1.1.0     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(knitr)
```

## Exercise 1. Tibble and Data Import

Import the data frames listed below into R and
[parse](https://r4ds.had.co.nz/data-import.html#parsing-a-vector) the
columns appropriately when needed. Watch out for the formatting oddities
of each dataset. Print the results directly, **without** using
`kable()`.

**You only need to finish any three out of the five questions in this
exercise in order to get credit.**

#### 1.1 Create the following tibble manually, first using `tribble()` and then using `tibble()`. Print both results. \[We didn’t have time to cover this in class, but look up how these functions work [here](https://r4ds.had.co.nz/tibbles.html#creating-tibbles)\]

`tribble()`:

    ## # A tibble: 2 × 3
    ##       a     b c     
    ##   <dbl> <dbl> <chr> 
    ## 1     1   2.1 apple 
    ## 2     2   3.2 orange

``` r
table1 <- tribble(
  ~a, ~b, ~c,
  1, 2.1, "apple", 
  2, 3.2, "Orange"
)
table1
```

    # A tibble: 2 × 3
          a     b c     
      <dbl> <dbl> <chr> 
    1     1   2.1 apple 
    2     2   3.2 Orange

`tibble()`:

    ## # A tibble: 2 × 3
    ##       a     b c     
    ##   <int> <dbl> <chr> 
    ## 1     1   2.1 apple 
    ## 2     2   3.2 orange

``` r
table2 <- tibble(
  a = c(1L, 2L), 
  b = c(2.1, 3.2), 
  c = c("apple", "orange")
)
table2
```

    # A tibble: 2 × 3
          a     b c     
      <int> <dbl> <chr> 
    1     1   2.1 apple 
    2     2   3.2 orange

#### 1.2 Import `https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/dataset2.txt` into R. Change the column names into “Name”, “Weight”, “Price”.

    ## # A tibble: 3 × 3
    ##   Name   Weight Price
    ##   <chr>   <dbl> <dbl>
    ## 1 apple       1   2.9
    ## 2 orange      2   4.9
    ## 3 durian     10  19.9

``` r
dataset2 <- read_csv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/dataset2.txt")
```

    Rows: 2 Columns: 3
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ","
    chr (1): apple
    dbl (2): 1, 2.9

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
view(dataset2)

dataset2 <- dataset2 |> 
  set_names(c("Names", "Weight", "Apple"))
```

#### 1.3 Import `https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/dataset3.txt` into R. Watch out for the first few lines, missing values, separators, quotation marks, and deliminaters.

    ## # A tibble: 3 × 3
    ##   Name   Weight Price
    ##   <chr>   <dbl> <dbl>
    ## 1 apple       1   2.9
    ## 2 orange      2  NA  
    ## 3 durian     NA  19.9

``` r
dataset3 <- read_csv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/dataset3.txt")
```

    Rows: 5 Columns: 1
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ","
    chr (1): Table of fruits

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
view(dataset3)
```

#### 1.4 Import `https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/dataset4.txt` into R. Watch out for comments, units, and decimal marks (which are `,` in this case).

    ## Warning: One or more parsing issues, call `problems()` on your data frame for details,
    ## e.g.:
    ##   dat <- vroom(...)
    ##   problems(dat)

    ## # A tibble: 3 × 3
    ##   Name   Weight Price
    ##   <chr>   <dbl> <dbl>
    ## 1 apple       1   2.9
    ## 2 orange      2   4.9
    ## 3 durian     10  19.9

#### 1.5 Import `https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/dataset5.txt` into R. Parse the columns properly. As a reminder, you can read about parsing date and time data [here](https://r4ds.had.co.nz/data-import.html#readr-datetimes). Write this imported and parsed data frame into a new csv file named `dataset5_new.csv` in your `problem_sets` folder.

    ## # A tibble: 3 × 3
    ##   Name   `Expiration Date` Time  
    ##   <chr>  <date>            <time>
    ## 1 apple  2018-09-26        01:00 
    ## 2 orange 2018-10-02        13:00 
    ## 3 durian 2018-10-21        11:00

## Exercise 2. Weather station

This dataset contains the weather and air quality data collected by a
weather station in Taiwan. It was obtained from the Environmental
Protection Administration, Executive Yuan, R.O.C. (Taiwan).

#### 2.1 Variable descriptions

-   The text file
    `https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/2015y_Weather_Station_notes.txt`
    contains descriptions of different variables collected by the
    station.

-   Import it into R and print it in a table as shown below with
    `kable()`.

-   

<table>
<colgroup>
<col style="width: 33%" />
<col style="width: 33%" />
<col style="width: 33%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Item</th>
<th style="text-align: left;">Unit</th>
<th style="text-align: left;">Description</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">AMB_TEMP</td>
<td style="text-align: left;">Celsius</td>
<td style="text-align: left;">Ambient air temperature</td>
</tr>
<tr>
<td style="text-align: left;">CO</td>
<td style="text-align: left;">ppm</td>
<td style="text-align: left;">Carbon monoxide</td>
</tr>
<tr>
<td style="text-align: left;">NO</td>
<td style="text-align: left;">ppb</td>
<td style="text-align: left;">Nitric oxide</td>
</tr>
<tr>
<td style="text-align: left;">NO2</td>
<td style="text-align: left;">ppb</td>
<td style="text-align: left;">Nitrogen dioxide</td>
</tr>
<tr>
<td style="text-align: left;">NOx</td>
<td style="text-align: left;">ppb</td>
<td style="text-align: left;">Nitrogen oxides</td>
</tr>
<tr>
<td style="text-align: left;">O3</td>
<td style="text-align: left;">ppb</td>
<td style="text-align: left;">Ozone</td>
</tr>
<tr>
<td style="text-align: left;">PM10</td>
<td style="text-align: left;">μg/m3</td>
<td style="text-align: left;">Particulate matter with a diameter between
2.5 and 10 μm</td>
</tr>
<tr>
<td style="text-align: left;">PM2.5</td>
<td style="text-align: left;">μg/m3</td>
<td style="text-align: left;">Particulate matter with a diameter of 2.5
μm or less</td>
</tr>
<tr>
<td style="text-align: left;">RAINFALL</td>
<td style="text-align: left;">mm</td>
<td style="text-align: left;">Rainfall</td>
</tr>
<tr>
<td style="text-align: left;">RH</td>
<td style="text-align: left;">%</td>
<td style="text-align: left;">Relative humidity</td>
</tr>
<tr>
<td style="text-align: left;">SO2</td>
<td style="text-align: left;">ppb</td>
<td style="text-align: left;">Sulfur dioxide</td>
</tr>
<tr>
<td style="text-align: left;">WD_HR</td>
<td style="text-align: left;">degress</td>
<td style="text-align: left;">Wind direction (The average of hour)</td>
</tr>
<tr>
<td style="text-align: left;">WIND_DIREC</td>
<td style="text-align: left;">degress</td>
<td style="text-align: left;">Wind direction (The average of last ten
minutes per hour)</td>
</tr>
<tr>
<td style="text-align: left;">WIND_SPEED</td>
<td style="text-align: left;">m/sec</td>
<td style="text-align: left;">Wind speed (The average of last ten
minutes per hour)</td>
</tr>
<tr>
<td style="text-align: left;">WS_HR</td>
<td style="text-align: left;">m/sec</td>
<td style="text-align: left;">Wind speed (The average of hour)</td>
</tr>
</tbody>
</table>

`#` indicates invalid value by equipment inspection  
`*` indicates invalid value by program inspection  
`x` indicates invalid value by human inspection  
`NR` indicates no rainfall  
blank indicates no data

<br>

#### 2.2 Data tidying

-   Import
    `https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/2015y_Weather_Station.csv`
    into R. As you can see, this dataset is a classic example of untidy
    data: values of a variable (i.e. hour of the day) are stored as
    column names; variable names are stored in the `item` column.

-   Clean this dataset up and restructure it into a tidy format.

-   Parse the `date` variable into date format and parse `hour` into
    time.

-   Turn all invalid values into `NA` and turn `NR` in rainfall into
    `0`.

-   Parse all values into numbers.

-   Show the first 6 rows and 10 columns of this cleaned dataset, as
    shown below, *without* using `kable()`.

*Hints: you don’t have to perform these tasks in the given order; also,
warning messages are not necessarily signs of trouble.*

Before cleaning:

    ## # A tibble: 6 × 10
    ##   date       station item     `00`  `01`  `02`  `03`  `04`  `05`  `06` 
    ##   <chr>      <chr>   <chr>    <chr> <chr> <chr> <chr> <chr> <chr> <chr>
    ## 1 2015/01/01 Cailiao AMB_TEMP 16    16    15    15    15    14    14   
    ## 2 2015/01/01 Cailiao CO       0.74  0.7   0.66  0.61  0.51  0.51  0.51 
    ## 3 2015/01/01 Cailiao NO       1     0.8   1.1   1.7   2     1.7   1.9  
    ## 4 2015/01/01 Cailiao NO2      15    13    13    12    11    13    13   
    ## 5 2015/01/01 Cailiao NOx      16    14    14    13    13    15    15   
    ## 6 2015/01/01 Cailiao O3       35    36    35    34    34    32    30

<br>

After cleaning:

    ## # A tibble: 6 × 10
    ##   date       station hour   AMB_TEMP    CO    NO   NO2   NOx    O3  PM10
    ##   <date>     <chr>   <time>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
    ## 1 2015-01-01 Cailiao 00:00        16  0.74   1      15    16    35   171
    ## 2 2015-01-01 Cailiao 01:00        16  0.7    0.8    13    14    36   174
    ## 3 2015-01-01 Cailiao 02:00        15  0.66   1.1    13    14    35   160
    ## 4 2015-01-01 Cailiao 03:00        15  0.61   1.7    12    13    34   142
    ## 5 2015-01-01 Cailiao 04:00        15  0.51   2      11    13    34   123
    ## 6 2015-01-01 Cailiao 05:00        14  0.51   1.7    13    15    32   110

#### 2.3 Using this cleaned dataset, plot the daily variation in ambient temperature on September 25, 2015, as shown below.

![](assignment_6_files/figure-gfm/unnamed-chunk-11-1.png)<!-- -->

#### 2.4 Plot the daily average ambient temperature throughout the year with a **continuous line**, as shown below.

![](assignment_6_files/figure-gfm/unnamed-chunk-12-1.png)<!-- -->

#### 2.5 Plot the total rainfall per month in a bar chart, as shown below.

*Hint: separating date into three columns might be helpful.*

![](assignment_6_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

#### 2.6 Plot the per hour variation in PM2.5 in the first week of September with a **continuous line**, as shown below.

*Hint: uniting the date and hour and parsing the new variable might be
helpful.*

## Exercise 3. Camera data (OPTIONAL)

This dataset contains information on 1038 camera models. It was obtained
from the following website:
<https://perso.telecom-paristech.fr/eagan/class/igr204/>

#### 3.1 Split brand names and model names

-   Import
    `https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/master/datasets/camera.csv`
    to R.

-   You will see that the `Model` columns contains both the brand names
    and model names of cameras. Split this column into two, one with
    brand name, and the other with model name, as shown below.

-   Print the first 6 rows of the new data frame with `kable()`.

*Hint: check the merge argument in `separate()`*

<br>

<table style="width:100%;">
<colgroup>
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
<col style="width: 7%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Brand</th>
<th style="text-align: left;">Model</th>
<th style="text-align: right;">Release date</th>
<th style="text-align: right;">Max resolution</th>
<th style="text-align: right;">Low resolution</th>
<th style="text-align: right;">Effective pixels</th>
<th style="text-align: right;">Zoom wide (W)</th>
<th style="text-align: right;">Zoom tele (T)</th>
<th style="text-align: right;">Normal focus range</th>
<th style="text-align: right;">Macro focus range</th>
<th style="text-align: right;">Storage included</th>
<th style="text-align: right;">Weight (inc. batteries)</th>
<th style="text-align: right;">Dimensions</th>
<th style="text-align: right;">Price</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Agfa</td>
<td style="text-align: left;">ePhoto 1280</td>
<td style="text-align: right;">1997</td>
<td style="text-align: right;">1024</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">38</td>
<td style="text-align: right;">114</td>
<td style="text-align: right;">70</td>
<td style="text-align: right;">40</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">420</td>
<td style="text-align: right;">95</td>
<td style="text-align: right;">179</td>
</tr>
<tr>
<td style="text-align: left;">Agfa</td>
<td style="text-align: left;">ePhoto 1680</td>
<td style="text-align: right;">1998</td>
<td style="text-align: right;">1280</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">38</td>
<td style="text-align: right;">114</td>
<td style="text-align: right;">50</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">420</td>
<td style="text-align: right;">158</td>
<td style="text-align: right;">179</td>
</tr>
<tr>
<td style="text-align: left;">Agfa</td>
<td style="text-align: left;">ePhoto CL18</td>
<td style="text-align: right;">2000</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">45</td>
<td style="text-align: right;">45</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">179</td>
</tr>
<tr>
<td style="text-align: left;">Agfa</td>
<td style="text-align: left;">ePhoto CL30</td>
<td style="text-align: right;">1999</td>
<td style="text-align: right;">1152</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">35</td>
<td style="text-align: right;">35</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">4</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">269</td>
</tr>
<tr>
<td style="text-align: left;">Agfa</td>
<td style="text-align: left;">ePhoto CL30 Clik!</td>
<td style="text-align: right;">1999</td>
<td style="text-align: right;">1152</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">43</td>
<td style="text-align: right;">43</td>
<td style="text-align: right;">50</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">40</td>
<td style="text-align: right;">300</td>
<td style="text-align: right;">128</td>
<td style="text-align: right;">1299</td>
</tr>
<tr>
<td style="text-align: left;">Agfa</td>
<td style="text-align: left;">ePhoto CL45</td>
<td style="text-align: right;">2001</td>
<td style="text-align: right;">1600</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">51</td>
<td style="text-align: right;">51</td>
<td style="text-align: right;">50</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">270</td>
<td style="text-align: right;">119</td>
<td style="text-align: right;">179</td>
</tr>
</tbody>
</table>

<br>

#### 3.2 Split product line names and model names

-   Many model names start with a name for the product line, which is
    then followed by a name for the particular model.

-   Select all Canon cameras, and further split the model names into
    product line names (in this case, they are either “Powershot” or
    “EOS”) and model names.

-   Show the first 6 lines of this new data frame with `kable()`.

*Hint: notice that there are more than one possible separators.*

<br>

<table style="width:100%;">
<colgroup>
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
<col style="width: 6%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">Brand</th>
<th style="text-align: left;">Line</th>
<th style="text-align: left;">Model</th>
<th style="text-align: right;">Release date</th>
<th style="text-align: right;">Max resolution</th>
<th style="text-align: right;">Low resolution</th>
<th style="text-align: right;">Effective pixels</th>
<th style="text-align: right;">Zoom wide (W)</th>
<th style="text-align: right;">Zoom tele (T)</th>
<th style="text-align: right;">Normal focus range</th>
<th style="text-align: right;">Macro focus range</th>
<th style="text-align: right;">Storage included</th>
<th style="text-align: right;">Weight (inc. batteries)</th>
<th style="text-align: right;">Dimensions</th>
<th style="text-align: right;">Price</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Canon</td>
<td style="text-align: left;">PowerShot</td>
<td style="text-align: left;">350</td>
<td style="text-align: right;">1997</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">42</td>
<td style="text-align: right;">42</td>
<td style="text-align: right;">70</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">2</td>
<td style="text-align: right;">320</td>
<td style="text-align: right;">93</td>
<td style="text-align: right;">149</td>
</tr>
<tr>
<td style="text-align: left;">Canon</td>
<td style="text-align: left;">PowerShot</td>
<td style="text-align: left;">600</td>
<td style="text-align: right;">1996</td>
<td style="text-align: right;">832</td>
<td style="text-align: right;">640</td>
<td style="text-align: right;">0</td>
<td style="text-align: right;">50</td>
<td style="text-align: right;">50</td>
<td style="text-align: right;">40</td>
<td style="text-align: right;">10</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">460</td>
<td style="text-align: right;">160</td>
<td style="text-align: right;">139</td>
</tr>
<tr>
<td style="text-align: left;">Canon</td>
<td style="text-align: left;">PowerShot</td>
<td style="text-align: left;">A10</td>
<td style="text-align: right;">2001</td>
<td style="text-align: right;">1280</td>
<td style="text-align: right;">1024</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">35</td>
<td style="text-align: right;">105</td>
<td style="text-align: right;">76</td>
<td style="text-align: right;">16</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">375</td>
<td style="text-align: right;">110</td>
<td style="text-align: right;">139</td>
</tr>
<tr>
<td style="text-align: left;">Canon</td>
<td style="text-align: left;">PowerShot</td>
<td style="text-align: left;">A100</td>
<td style="text-align: right;">2002</td>
<td style="text-align: right;">1280</td>
<td style="text-align: right;">1024</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">39</td>
<td style="text-align: right;">39</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">225</td>
<td style="text-align: right;">110</td>
<td style="text-align: right;">139</td>
</tr>
<tr>
<td style="text-align: left;">Canon</td>
<td style="text-align: left;">PowerShot</td>
<td style="text-align: left;">A20</td>
<td style="text-align: right;">2001</td>
<td style="text-align: right;">1600</td>
<td style="text-align: right;">1024</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">35</td>
<td style="text-align: right;">105</td>
<td style="text-align: right;">76</td>
<td style="text-align: right;">16</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">375</td>
<td style="text-align: right;">110</td>
<td style="text-align: right;">139</td>
</tr>
<tr>
<td style="text-align: left;">Canon</td>
<td style="text-align: left;">PowerShot</td>
<td style="text-align: left;">A200</td>
<td style="text-align: right;">2002</td>
<td style="text-align: right;">1600</td>
<td style="text-align: right;">1024</td>
<td style="text-align: right;">1</td>
<td style="text-align: right;">39</td>
<td style="text-align: right;">39</td>
<td style="text-align: right;">20</td>
<td style="text-align: right;">5</td>
<td style="text-align: right;">8</td>
<td style="text-align: right;">225</td>
<td style="text-align: right;">110</td>
<td style="text-align: right;">139</td>
</tr>
</tbody>
</table>

<br> <br>
