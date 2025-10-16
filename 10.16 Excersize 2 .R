gap_europe <- gapminder |> 
  filter(continent == "Europe") |> 
  mutate(gdp_tot = gdpPercap * pop)

country_list <- unique(gap_europe$country)


dir.create("gap_figs/europe")

for (cntry in country_list) {
  
  
  contient = "Europe
  "
  ## filter the country to plot
  gap_to_plot <- gap_europe |>
    filter(country == cntry)
  
  ## plot
  my_plot <- ggplot(data = gap_to_plot,
                    aes(x = year, 
                        y = gdp_per_cap * pop)) + 
    geom_point() +
    ## add title and save
    labs(title = str_c(cntry, 
                       "GDP per capita", 
                       sep = " "))
  
  ## add the gap_figs/ folder
 ggsave(filename = str_c("gap_figs/", cntry, 
                          "_gdp_per_cap.png", 
                          sep = ""), 
         plot = my_plot)
 
 print(str_c("Plotting", cntry))
} 




## in general when we're trying to change something in a loop, we like to assign something to our variable... what is going to be assigned is going to be the last country in the loop 
