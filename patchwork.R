
# load packages
library(tidyverse)
library(patchwork)
theme_set(theme_bw(16))

# version check
packageVersion("patchwork")

# load data
mobile <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-10/mobile.csv')
landline <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-11-10/landline.csv')

## Parsed with column specification:
## cols(
##   entity = col_character(),
##   code = col_character(),
##   year = col_double(),
##   total_pop = col_double(),
##   gdp_per_cap = col_double(),
##   landline_subs = col_double(),
##   continent = col_character()
## )


# Slovenia mobile data
p1 <- mobile %>%
  filter(entity=="Slovenia") %>%
  ggplot(aes(x=year, y=mobile_subs, fill = year)) + 
  geom_col(show.legend = FALSE)+
  labs(title="Mobile subscriptions: Slovenia")

print(p1)

ggsave("mobile_Slovenia.png", width=9,height=8)

# Slovenia landline data
p2 <- landline %>%
  na.omit() %>% 
  filter(entity=="Slovenia") %>%
  ggplot(aes(x=year, y=landline_subs, fill = year)) + 
  geom_col(show.legend = FALSE)+
  labs(title="Landline subscriptions: Slovenia")

print(p2)

ggsave("landline_Slovenia.png", width=9,height=8)



# inset element
p1 + inset_element(p2, right = 0.40,
                   bottom = 0.60, 
                   left = 0.01,
                   top = 0.99) 

  plot_layout(widths = c(6, 1), heights = c(3, 1))
  


ggsave("insetting_with_patchwork_Slovenia.png", width=9,height=8)



