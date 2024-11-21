
# making model and caterpillar plot for each data subset that corresponds with each CART plot

# subset the whole df according to each taxa and response 
# note that that the outlier study (higgens et al?) has NOT been removed
fish_abundance <- EffectSizeCalculations %>%
  filter(Taxa == "Fish") %>% 
  filter(Outcome == "Abundance")

fish_biomass<- EffectSizeCalculations %>%
  filter(Taxa == "Fish") %>% 
  filter(Outcome == "Biomass")

fish_diversity<- EffectSizeCalculations %>%
  filter(Taxa == "Fish") %>% 
  filter(Outcome == "Diversity")

invert_abundance <- EffectSizeCalculations %>%
  filter(Taxa == "Invertebrate") %>% 
  filter(Outcome == "Abundance")

invert_diversity<- EffectSizeCalculations %>%
  filter(Taxa == "Invertebrate") %>% 
  filter(Outcome == "Diversity")

# create each df for model fitting
dat <- fish_abundance
dat <- fish_biomass
dat <- fish_diversity
dat <- invert_abundance
dat <- invert_diversity

# create the model for the plot 
mod0 = rma.mv(Hedgesg,
              HedgesSE,
              random = ~ 1 | StudyID/ESID,
              # data = EffectSizeCalculations,
              data = dat,
              test = "t",
              method = "REML")

resmod0 <- mod_results(mod0, data=dat, group="StudyID")

# create each caterpillar plot
invert_diversity_plot <- orchaRd::caterpillars(resmod0, mod = "Int", xlab = "Hedge's g")

# save the plot as a PNG file
ggsave("invert_diversity_plot.png", plot = invert_diversity_plot, width = 8, height = 6, dpi = 300)

