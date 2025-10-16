# Assignment 7


Assignment 7: Relational data plus revisiting data wrangling and
visualization ================

## Instructions: Please read through this before you begin

-   This homework is due by **10pm on Thursday 10/16/2025**. Please
    upload it using your personal GitHub repository for this class.

-   Please name your R markdown file `assignment_7.Rmd` and the knitted
    markdown file `assignment_7.md`.

-   For this assignment, please **reproduce this markdown file** using R
    markdown. This includes the followings:

    -   **Reproduce this markdown template**, except for this list of
        instructions which you **don’t** have to include. Pay attention
        to all the formating in this file, including bullet points,
        bolded characters, inserted code chunks, headings, text colors,
        blank lines, etc.

    -   Have all your code embedded within the R markdown file, and show
        **BOTH your code and plots** in the knitted markdown file.

    -   Use R Markdown functionalities to **hide messages and warnings
        when needed**. (Suggestion: messages and warnings can often be
        informative and important, so please examine them carefully and
        only turn them off when you finish the exercise).

-   To start, first load all the required packages with the following
    code. Install them if they are not installed yet.

``` r
library(tidyverse)
library(knitr)
library(dslabs)
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
library(dslabs) #install.packages("dslabs")
```

## Excercise: 2016 election result and polling

For this exercise, we will explore the result of the 2016 US
presidential election as well as the polling data. We will use the
following three datasets in the `dslabs` package, and use `join`
function to connect them together. As a reminder, you can use `?` to
learn more about these datasets.

-   `results_us_election_2016`: Election results (popular vote) and
    electoral college votes from the 2016 presidential election.

-   `polls_us_election_2016`: Poll results from the 2016 presidential
    elections.

-   `murders`: Gun murder data from FBI reports. It also contains the
    population of each state.

We will also use [this
dataset](https://raw.githubusercontent.com/kshaffer/election2016/master/2016ElectionResultsByState.csv)
to get the exact numbers of votes for question 3.

### Question 1. What is the relationship between the population size and the number of electoral votes each state has?

**1a.** Use a `join` function to combine the `murders` dataset, which
contains information on population size, and the
`results_us_election_2016` dataset, which contains information on the
number of electoral votes. Name this new dataset `q_1a`, and show its
first 6 rows.

<table>
<colgroup>
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
<col style="width: 8%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">state</th>
<th style="text-align: left;">abb</th>
<th style="text-align: left;">region</th>
<th style="text-align: right;">population</th>
<th style="text-align: right;">total</th>
<th style="text-align: right;">electoral_votes</th>
<th style="text-align: right;">clinton</th>
<th style="text-align: right;">trump</th>
<th style="text-align: right;">johnson</th>
<th style="text-align: right;">stein</th>
<th style="text-align: right;">mcmullin</th>
<th style="text-align: right;">others</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Alabama</td>
<td style="text-align: left;">AL</td>
<td style="text-align: left;">South</td>
<td style="text-align: right;">4779736</td>
<td style="text-align: right;">135</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">34.35795</td>
<td style="text-align: right;">62.08309</td>
<td style="text-align: right;">2.094169</td>
<td style="text-align: right;">0.4422682</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">1.0225246</td>
</tr>
<tr>
<td style="text-align: left;">Alaska</td>
<td style="text-align: left;">AK</td>
<td style="text-align: left;">West</td>
<td style="text-align: right;">710231</td>
<td style="text-align: right;">19</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">36.55087</td>
<td style="text-align: right;">51.28151</td>
<td style="text-align: right;">5.877128</td>
<td style="text-align: right;">1.8000176</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">4.4904710</td>
</tr>
<tr>
<td style="text-align: left;">Arizona</td>
<td style="text-align: left;">AZ</td>
<td style="text-align: left;">West</td>
<td style="text-align: right;">6392017</td>
<td style="text-align: right;">232</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">44.58042</td>
<td style="text-align: right;">48.08314</td>
<td style="text-align: right;">4.082188</td>
<td style="text-align: right;">1.3185997</td>
<td style="text-align: right;">0.6699155</td>
<td style="text-align: right;">1.2657329</td>
</tr>
<tr>
<td style="text-align: left;">Arkansas</td>
<td style="text-align: left;">AR</td>
<td style="text-align: left;">South</td>
<td style="text-align: right;">2915918</td>
<td style="text-align: right;">93</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">33.65190</td>
<td style="text-align: right;">60.57191</td>
<td style="text-align: right;">2.648769</td>
<td style="text-align: right;">0.8378174</td>
<td style="text-align: right;">1.1653206</td>
<td style="text-align: right;">1.1242832</td>
</tr>
<tr>
<td style="text-align: left;">California</td>
<td style="text-align: left;">CA</td>
<td style="text-align: left;">West</td>
<td style="text-align: right;">37253956</td>
<td style="text-align: right;">1257</td>
<td style="text-align: right;">55</td>
<td style="text-align: right;">61.72640</td>
<td style="text-align: right;">31.61711</td>
<td style="text-align: right;">3.374092</td>
<td style="text-align: right;">1.9649200</td>
<td style="text-align: right;">0.2792070</td>
<td style="text-align: right;">1.0382753</td>
</tr>
<tr>
<td style="text-align: left;">Colorado</td>
<td style="text-align: left;">CO</td>
<td style="text-align: left;">West</td>
<td style="text-align: right;">5029196</td>
<td style="text-align: right;">65</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">48.15651</td>
<td style="text-align: right;">43.25098</td>
<td style="text-align: right;">5.183748</td>
<td style="text-align: right;">1.3825031</td>
<td style="text-align: right;">1.0400874</td>
<td style="text-align: right;">0.9861714</td>
</tr>
</tbody>
</table>

``` r
q_1a <- murders |> 
  left_join(results_us_election_2016, murders, by = "state")
  
head(q_1a)
```

           state abb region population total electoral_votes  clinton    trump
    1    Alabama  AL  South    4779736   135               9 34.35795 62.08309
    2     Alaska  AK   West     710231    19               3 36.55087 51.28151
    3    Arizona  AZ   West    6392017   232              11 44.58042 48.08314
    4   Arkansas  AR  South    2915918    93               6 33.65190 60.57191
    5 California  CA   West   37253956  1257              55 61.72640 31.61711
    6   Colorado  CO   West    5029196    65               9 48.15651 43.25098
       johnson     stein  mcmullin    others
    1 2.094169 0.4422682 0.0000000 1.0225246
    2 5.877128 1.8000176 0.0000000 4.4904710
    3 4.082188 1.3185997 0.6699155 1.2657329
    4 2.648769 0.8378174 1.1653206 1.1242832
    5 3.374092 1.9649200 0.2792070 1.0382753
    6 5.183748 1.3825031 1.0400874 0.9861714

**1b.** Add a new variable in the `q_1a` dataset to indicate which
candidate won in each state, and remove the columns `abb`, `region`, and
`total`. Name this new dataset `q_1b`, and show its first 6 rows.

<table style="width:100%;">
<colgroup>
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">state</th>
<th style="text-align: right;">population</th>
<th style="text-align: right;">electoral_votes</th>
<th style="text-align: right;">clinton</th>
<th style="text-align: right;">trump</th>
<th style="text-align: right;">johnson</th>
<th style="text-align: right;">stein</th>
<th style="text-align: right;">mcmullin</th>
<th style="text-align: right;">others</th>
<th style="text-align: left;">winner</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Alabama</td>
<td style="text-align: right;">4779736</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">34.35795</td>
<td style="text-align: right;">62.08309</td>
<td style="text-align: right;">2.094169</td>
<td style="text-align: right;">0.4422682</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">1.0225246</td>
<td style="text-align: left;">trump</td>
</tr>
<tr>
<td style="text-align: left;">Alaska</td>
<td style="text-align: right;">710231</td>
<td style="text-align: right;">3</td>
<td style="text-align: right;">36.55087</td>
<td style="text-align: right;">51.28151</td>
<td style="text-align: right;">5.877128</td>
<td style="text-align: right;">1.8000176</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">4.4904710</td>
<td style="text-align: left;">trump</td>
</tr>
<tr>
<td style="text-align: left;">Arizona</td>
<td style="text-align: right;">6392017</td>
<td style="text-align: right;">11</td>
<td style="text-align: right;">44.58042</td>
<td style="text-align: right;">48.08314</td>
<td style="text-align: right;">4.082188</td>
<td style="text-align: right;">1.3185997</td>
<td style="text-align: right;">0.6699155</td>
<td style="text-align: right;">1.2657329</td>
<td style="text-align: left;">trump</td>
</tr>
<tr>
<td style="text-align: left;">Arkansas</td>
<td style="text-align: right;">2915918</td>
<td style="text-align: right;">6</td>
<td style="text-align: right;">33.65190</td>
<td style="text-align: right;">60.57191</td>
<td style="text-align: right;">2.648769</td>
<td style="text-align: right;">0.8378174</td>
<td style="text-align: right;">1.1653206</td>
<td style="text-align: right;">1.1242832</td>
<td style="text-align: left;">trump</td>
</tr>
<tr>
<td style="text-align: left;">California</td>
<td style="text-align: right;">37253956</td>
<td style="text-align: right;">55</td>
<td style="text-align: right;">61.72640</td>
<td style="text-align: right;">31.61711</td>
<td style="text-align: right;">3.374092</td>
<td style="text-align: right;">1.9649200</td>
<td style="text-align: right;">0.2792070</td>
<td style="text-align: right;">1.0382753</td>
<td style="text-align: left;">clinton</td>
</tr>
<tr>
<td style="text-align: left;">Colorado</td>
<td style="text-align: right;">5029196</td>
<td style="text-align: right;">9</td>
<td style="text-align: right;">48.15651</td>
<td style="text-align: right;">43.25098</td>
<td style="text-align: right;">5.183748</td>
<td style="text-align: right;">1.3825031</td>
<td style="text-align: right;">1.0400874</td>
<td style="text-align: right;">0.9861714</td>
<td style="text-align: left;">clinton</td>
</tr>
</tbody>
</table>

``` r
view(results_us_election_2016)
view(q_1a)
q_1b <- q_1a |> 
  mutate(
    winner = ifelse(trump > clinton, "trump", "clinton") ) |> 
  select(-abb, -region, -total)
  
head(q_1b)
```

           state population electoral_votes  clinton    trump  johnson     stein
    1    Alabama    4779736               9 34.35795 62.08309 2.094169 0.4422682
    2     Alaska     710231               3 36.55087 51.28151 5.877128 1.8000176
    3    Arizona    6392017              11 44.58042 48.08314 4.082188 1.3185997
    4   Arkansas    2915918               6 33.65190 60.57191 2.648769 0.8378174
    5 California   37253956              55 61.72640 31.61711 3.374092 1.9649200
    6   Colorado    5029196               9 48.15651 43.25098 5.183748 1.3825031
       mcmullin    others  winner
    1 0.0000000 1.0225246   trump
    2 0.0000000 4.4904710   trump
    3 0.6699155 1.2657329   trump
    4 1.1653206 1.1242832   trump
    5 0.2792070 1.0382753 clinton
    6 1.0400874 0.9861714 clinton

**1c.** Using the `q_1b` dataset, plot the relationship between
population size and number of electoral votes. Use color to indicate who
won the state. Fit a straight line to the data, set its color to black,
size to 0.1, and turn off its confidence interval.

``` r
##view(q_1b)
ggplot(q_1b, 
       aes( x = population,
            y = electoral_votes,
            color = winner)) + 
  geom_point(size = 2) + 
  geom_smooth(color = "black", size = 0.1, se = FALSE) + 
  labs(
    title = "Population Size and Electoral votes (2016)",
    x = "Populatoin", 
    y = "Electoral"
  )
```

    Warning: Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
    ℹ Please use `linewidth` instead.

    `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

![](Assignment_7.markdown_strict_files/figure-markdown_strict/unnamed-chunk-4-1.png)

### Question 2. Would the election result be any different if the number of electoral votes is exactly proportional to a state’s population size?

**2a.** First, convert the `q_1b` dataset to longer format such that the
`population` and `electoral_votes` columns are turned into rows as shown
below. Name this new dataset `q_2a`, and show its first 6 rows.

<table style="width:100%;">
<colgroup>
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
<col style="width: 10%" />
</colgroup>
<thead>
<tr>
<th style="text-align: left;">state</th>
<th style="text-align: right;">clinton</th>
<th style="text-align: right;">trump</th>
<th style="text-align: right;">johnson</th>
<th style="text-align: right;">stein</th>
<th style="text-align: right;">mcmullin</th>
<th style="text-align: right;">others</th>
<th style="text-align: left;">winner</th>
<th style="text-align: left;">metric</th>
<th style="text-align: right;">value</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Alabama</td>
<td style="text-align: right;">34.35795</td>
<td style="text-align: right;">62.08309</td>
<td style="text-align: right;">2.094169</td>
<td style="text-align: right;">0.4422682</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">1.022525</td>
<td style="text-align: left;">trump</td>
<td style="text-align: left;">population</td>
<td style="text-align: right;">4779736</td>
</tr>
<tr>
<td style="text-align: left;">Alabama</td>
<td style="text-align: right;">34.35795</td>
<td style="text-align: right;">62.08309</td>
<td style="text-align: right;">2.094169</td>
<td style="text-align: right;">0.4422682</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">1.022525</td>
<td style="text-align: left;">trump</td>
<td style="text-align: left;">electoral_votes</td>
<td style="text-align: right;">9</td>
</tr>
<tr>
<td style="text-align: left;">Alaska</td>
<td style="text-align: right;">36.55087</td>
<td style="text-align: right;">51.28151</td>
<td style="text-align: right;">5.877128</td>
<td style="text-align: right;">1.8000176</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">4.490471</td>
<td style="text-align: left;">trump</td>
<td style="text-align: left;">population</td>
<td style="text-align: right;">710231</td>
</tr>
<tr>
<td style="text-align: left;">Alaska</td>
<td style="text-align: right;">36.55087</td>
<td style="text-align: right;">51.28151</td>
<td style="text-align: right;">5.877128</td>
<td style="text-align: right;">1.8000176</td>
<td style="text-align: right;">0.0000000</td>
<td style="text-align: right;">4.490471</td>
<td style="text-align: left;">trump</td>
<td style="text-align: left;">electoral_votes</td>
<td style="text-align: right;">3</td>
</tr>
<tr>
<td style="text-align: left;">Arizona</td>
<td style="text-align: right;">44.58042</td>
<td style="text-align: right;">48.08314</td>
<td style="text-align: right;">4.082188</td>
<td style="text-align: right;">1.3185997</td>
<td style="text-align: right;">0.6699155</td>
<td style="text-align: right;">1.265733</td>
<td style="text-align: left;">trump</td>
<td style="text-align: left;">population</td>
<td style="text-align: right;">6392017</td>
</tr>
<tr>
<td style="text-align: left;">Arizona</td>
<td style="text-align: right;">44.58042</td>
<td style="text-align: right;">48.08314</td>
<td style="text-align: right;">4.082188</td>
<td style="text-align: right;">1.3185997</td>
<td style="text-align: right;">0.6699155</td>
<td style="text-align: right;">1.265733</td>
<td style="text-align: left;">trump</td>
<td style="text-align: left;">electoral_votes</td>
<td style="text-align: right;">11</td>
</tr>
</tbody>
</table>

``` r
q_2a <- q_1b |> 
  pivot_longer(
    cols = c(population, electoral_votes),
    names_to = "metric", 
    values_to = "value"
  )
head(q_2a) ##view(q_2a)
```

    # A tibble: 6 × 10
      state   clinton trump johnson stein mcmullin others winner metric        value
      <chr>     <dbl> <dbl>   <dbl> <dbl>    <dbl>  <dbl> <chr>  <chr>         <dbl>
    1 Alabama    34.4  62.1    2.09 0.442    0       1.02 trump  population   4.78e6
    2 Alabama    34.4  62.1    2.09 0.442    0       1.02 trump  electoral_v… 9   e0
    3 Alaska     36.6  51.3    5.88 1.80     0       4.49 trump  population   7.10e5
    4 Alaska     36.6  51.3    5.88 1.80     0       4.49 trump  electoral_v… 3   e0
    5 Arizona    44.6  48.1    4.08 1.32     0.670   1.27 trump  population   6.39e6
    6 Arizona    44.6  48.1    4.08 1.32     0.670   1.27 trump  electoral_v… 1.1 e1

**2b.** Then, sum up the number of electoral votes and population size
across all states for each candidate. Name this new dataset `q_2b`, and
print it as shown below.

<table>
<thead>
<tr>
<th style="text-align: left;">metric</th>
<th style="text-align: left;">winner</th>
<th style="text-align: right;">value</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">electoral_votes</td>
<td style="text-align: left;">clinton</td>
<td style="text-align: right;">231</td>
</tr>
<tr>
<td style="text-align: left;">electoral_votes</td>
<td style="text-align: left;">trump</td>
<td style="text-align: right;">302</td>
</tr>
<tr>
<td style="text-align: left;">population</td>
<td style="text-align: left;">clinton</td>
<td style="text-align: right;">134982448</td>
</tr>
<tr>
<td style="text-align: left;">population</td>
<td style="text-align: left;">trump</td>
<td style="text-align: right;">174881780</td>
</tr>
</tbody>
</table>

``` r
q_2b <- q_2a |> 
  group_by(metric, winner) |> 
  summarize(value = sum(value), 
.groups = "drop")

q_2b
```

    # A tibble: 4 × 3
      metric          winner      value
      <chr>           <chr>       <dbl>
    1 electoral_votes clinton       231
    2 electoral_votes trump         302
    3 population      clinton 134982448
    4 population      trump   174881780

**2c.** Use the `q_2b` dataset to contruct a bar plot to show the final
electoral vote share under the scenarios of **1)** each state has the
number of electoral votes that it currently has, and **2)** each state
has the number of electoral votes that is exactly proportional to its
population size. Here, assume that for each state, the winner will take
all its electoral votes.

*Hint: `geom_col(position = "fill")` might be helpful.*

``` r
ggplot(q_2b, aes(x = metric, y = value, fill = winner)) +
  geom_col(position = "fill") +  
  scale_y_continuous(labels = scales::percent_format()) + ## had to look this up 
  labs(
    x = "value",
    y = "metric",
    fill = "Winner",
  ) +
  theme_minimal()
```

![](Assignment_7.markdown_strict_files/figure-markdown_strict/unnamed-chunk-7-1.png)

### Question 3. What if the election was determined by popular votes?

**3a.** First, from [this dataset on
GitHub](https://raw.githubusercontent.com/kshaffer/election2016/master/2016ElectionResultsByState.csv),
calculate the number of popular votes each candidate received as shown
below. Name this new dataset `q_3a`, and print it.

*Note: Vote counts are listed for several other candidates. Please
combine the votes for all candidates other than Clinton and Trump into a
single `others` category (as shown in the table below)*

*Hint: `pivot_longer()` may be useful in here.*

<table>
<thead>
<tr>
<th style="text-align: left;">metric</th>
<th style="text-align: left;">winner</th>
<th style="text-align: right;">value</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">popular_votes</td>
<td style="text-align: left;">clinton</td>
<td style="text-align: right;">65125640</td>
</tr>
<tr>
<td style="text-align: left;">popular_votes</td>
<td style="text-align: left;">trump</td>
<td style="text-align: right;">62616675</td>
</tr>
<tr>
<td style="text-align: left;">popular_votes</td>
<td style="text-align: left;">others</td>
<td style="text-align: right;">7054974</td>
</tr>
</tbody>
</table>

``` r
votes_raw <- read_csv("https://raw.githubusercontent.com/kshaffer/election2016/master/2016ElectionResultsByState.csv")
```

    Rows: 51 Columns: 11
    ── Column specification ────────────────────────────────────────────────────────
    Delimiter: ","
    chr (2): state, postal
    dbl (9): clintonVotes, clintonElectors, trumpVotes, trumpElectors, johnsonVo...

    ℹ Use `spec()` to retrieve the full column specification for this data.
    ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.

``` r
##view(votes_raw)

votes_clean <- votes_raw |> 
  janitor::clean_names()
```

``` r
#view(votes_clean)

q_3a <- votes_clean |> 
  mutate(
    clinton = clinton_votes,
    trump   = trump_votes,
    others  = johnson_votes + stein_votes + mcmullin_votes + others_votes
  ) |> 
  summarize(
    clinton = sum(clinton, na.rm = TRUE),
    trump   = sum(trump, na.rm = TRUE),
    others  = sum(others, na.rm = TRUE)
  ) |> 
  pivot_longer(
    cols = everything(),
    names_to = "winner",
    values_to = "value"
  ) |> 
  mutate(metric = "popular_votes") |> 
  select(metric, winner, value)


q_3a
```

    # A tibble: 3 × 3
      metric        winner     value
      <chr>         <chr>      <dbl>
    1 popular_votes clinton 65125640
    2 popular_votes trump   62616675
    3 popular_votes others   7054974

**3b.** Combine the `q_2b` dataset with the `q_3a` dataset. Call this
new dataset `q_3b`, and print it as shown below.

<table>
<thead>
<tr>
<th style="text-align: left;">metric</th>
<th style="text-align: left;">winner</th>
<th style="text-align: right;">value</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">electoral_votes</td>
<td style="text-align: left;">clinton</td>
<td style="text-align: right;">231</td>
</tr>
<tr>
<td style="text-align: left;">electoral_votes</td>
<td style="text-align: left;">trump</td>
<td style="text-align: right;">302</td>
</tr>
<tr>
<td style="text-align: left;">population</td>
<td style="text-align: left;">clinton</td>
<td style="text-align: right;">134982448</td>
</tr>
<tr>
<td style="text-align: left;">population</td>
<td style="text-align: left;">trump</td>
<td style="text-align: right;">174881780</td>
</tr>
<tr>
<td style="text-align: left;">popular_votes</td>
<td style="text-align: left;">clinton</td>
<td style="text-align: right;">65125640</td>
</tr>
<tr>
<td style="text-align: left;">popular_votes</td>
<td style="text-align: left;">trump</td>
<td style="text-align: right;">62616675</td>
</tr>
<tr>
<td style="text-align: left;">popular_votes</td>
<td style="text-align: left;">others</td>
<td style="text-align: right;">7054974</td>
</tr>
</tbody>
</table>

``` r
q_3b <- bind_rows(q_2b, q_3a)
q_3b
```

    # A tibble: 7 × 3
      metric          winner      value
      <chr>           <chr>       <dbl>
    1 electoral_votes clinton       231
    2 electoral_votes trump         302
    3 population      clinton 134982448
    4 population      trump   174881780
    5 popular_votes   clinton  65125640
    6 popular_votes   trump    62616675
    7 popular_votes   others    7054974

**3c.** Lastly, use the `q_3b` dataset to contruct a bar plot to show
the final vote share under the scenarios of **1)** each state has the
number of electoral votes that it currently has, **2)** each state has
the number of electoral votes that is exactly proportional to its
population size, and **3)** the election result is determined by the
popular vote.

``` r
ggplot(q_3b, aes(x = metric, y = value, fill = winner)) +
  geom_col(position = "fill") +
  scale_y_continuous(labels = scales::percent_format())
```

![](Assignment_7.markdown_strict_files/figure-markdown_strict/unnamed-chunk-11-1.png)

### Question 4. The election result in 2016 came as a huge surprise to many people, especially given that most polls predicted Clinton would win before the election. Where did the polls get wrong?

**4a.** The polling data is stored in the data frame
`polls_us_election_2016`. For the sake of simplicity, we will only look
at the data from a single poll for each state. Subset the polling data
to include only the results from the pollster `Ipsos`. Exclude national
polls, and for each state, select the polling result with the `enddate`
closest to the election day (i.e. those with the lastest end date). Keep
only the columns `state`, `adjpoll_clinton`, and `adjpoll_trump`. Save
this new dataset as `q_4a`, and show its first 6 rows.

*Note: You should have 47 rows in `q_4a` because only 47 states were
polled at least once by Ipsos. You don’t need to worry about the 3
missing states and DC.*

*Hint: `group_by()` and `slice_max()` can be useful for this question.
Check out the help file for `slice_max()` for more info.*

<table>
<thead>
<tr>
<th style="text-align: left;">state</th>
<th style="text-align: right;">adjpoll_clinton</th>
<th style="text-align: right;">adjpoll_trump</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Alabama</td>
<td style="text-align: right;">37.54023</td>
<td style="text-align: right;">53.69718</td>
</tr>
<tr>
<td style="text-align: left;">Arizona</td>
<td style="text-align: right;">41.35774</td>
<td style="text-align: right;">46.17779</td>
</tr>
<tr>
<td style="text-align: left;">Arkansas</td>
<td style="text-align: right;">37.15339</td>
<td style="text-align: right;">53.28384</td>
</tr>
<tr>
<td style="text-align: left;">California</td>
<td style="text-align: right;">58.33806</td>
<td style="text-align: right;">31.00473</td>
</tr>
<tr>
<td style="text-align: left;">Colorado</td>
<td style="text-align: right;">46.00764</td>
<td style="text-align: right;">40.73571</td>
</tr>
<tr>
<td style="text-align: left;">Connecticut</td>
<td style="text-align: right;">48.81810</td>
<td style="text-align: right;">38.87069</td>
</tr>
</tbody>
</table>

**4b.** Combine the `q_4a` dataset with the `q_1b` dataset with a `join`
function. The resulting dataset should only have 47 rows. Create the
following new variables in this joined dataset.

-   `polling_margin`: difference between `adjpoll_clinton` and
    `adjpoll_trump`
-   `actual_margin`: difference between `clinton` and `trump`
-   `polling_error`: difference between `polling_margin` and
    `actual_margin`
-   `predicted_winner`: predicted winner based on `adjpoll_clinton` and
    `adjpoll_trump`
-   `result = ifelse(winner == predicted_winner, "correct prediction", str_c("unexpected ", winner, " win"))`

Keep only the columns `state`, `polling_error`, `result`,
`electoral_votes`. Name the new dataset `q_4b` and show its first 6
rows.

<table>
<thead>
<tr>
<th style="text-align: left;">state</th>
<th style="text-align: right;">polling_error</th>
<th style="text-align: left;">result</th>
<th style="text-align: right;">electoral_votes</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;">Alabama</td>
<td style="text-align: right;">11.5681966</td>
<td style="text-align: left;">correct prediction</td>
<td style="text-align: right;">9</td>
</tr>
<tr>
<td style="text-align: left;">Arizona</td>
<td style="text-align: right;">-1.3173239</td>
<td style="text-align: left;">correct prediction</td>
<td style="text-align: right;">11</td>
</tr>
<tr>
<td style="text-align: left;">Arkansas</td>
<td style="text-align: right;">10.7895518</td>
<td style="text-align: left;">correct prediction</td>
<td style="text-align: right;">6</td>
</tr>
<tr>
<td style="text-align: left;">California</td>
<td style="text-align: right;">-2.7759631</td>
<td style="text-align: left;">correct prediction</td>
<td style="text-align: right;">55</td>
</tr>
<tr>
<td style="text-align: left;">Colorado</td>
<td style="text-align: right;">0.3663946</td>
<td style="text-align: left;">correct prediction</td>
<td style="text-align: right;">9</td>
</tr>
<tr>
<td style="text-align: left;">Connecticut</td>
<td style="text-align: right;">-3.6919767</td>
<td style="text-align: left;">correct prediction</td>
<td style="text-align: right;">7</td>
</tr>
</tbody>
</table>

<br> <br>

**4c.** Generate the following plot with the `q_4b` dataset. Use chunk
options to adjust the dimensions of the plot to make it longer than the
default dimension. Based on this plot, where did the polls get wrong in
the 2016 election?

![](assignment_7_files/figure-gfm/unnamed-chunk-13-1.png)<!-- -->

<br> <br>
