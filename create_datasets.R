

sim_bag <- function(n, pouch_per_sample = 1) {
  # https://joshmadison.com/2007/12/02/mms-color-distribution-analysis/
  p_red = 0.13
  p_orange = 0.20
  p_yellow = 0.14
  p_green = 0.16
  p_blue = 0.24
  p_brown = 0.13
   
  bag_mean = 55
  bag_sd = 1.30
  
  sim_n <- round(rnorm(n = n, mean = bag_mean*pouch_per_sample, sd = bag_sd/sqrt(pouch_per_sample)))
  
  sim_freq <- t(
    rmultinom(
      n = n, size = sim_n, 
      prob = c(p_red, p_orange, p_yellow, p_green, p_blue, p_brown) )
  ) |> 
    data.frame()
  colnames(sim_freq) <- c("r", "o", "y", "g", "bl", "br")
  sim_freq$tot <- sim_n
  
  dplyr::transmute(
    sim_freq,
    sid = haven::labelled(1:n, label = "Sample number"),
    tot = haven::labelled(tot, label = "Total number of M&M's"),
    r = haven::labelled(r, label = "Number of red M&M's"),
    o = haven::labelled(o, label = "Number of orange M&M's"),
    y = haven::labelled(y, label = "Number of yellow M&M's"),
    g = haven::labelled(g, label = "Number of green M&M's"),
    bl = haven::labelled(bl, label = "Number of blue M&M's"),
    br = haven::labelled(br, label = "Number of brown M&M's"),
    pr = haven::labelled(r/tot, label = "% red"),
    po = haven::labelled(o/tot, label = "% orange"),
    py = haven::labelled(y/tot, label = "% yellow"),
    pg = haven::labelled(g/tot, label = "% green"),
    pbl = haven::labelled(bl/tot, label = "% blue"),
    pbr = haven::labelled(br/tot, label = "% brown")
  )
}

set.seed(1957)
sim_bag(1000, pouch_per_sample = 1) |> 
  haven::write_dta(path = "m&m_1bag_samples.dta")

set.seed(1957)
sim_bag(1000, pouch_per_sample = 10) |> 
  haven::write_dta(path = "m&m_10bags_samples.dta")
 


