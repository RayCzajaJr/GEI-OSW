library(metacart)

# Check the variable types
str(EffectSizeCalculations)

# Perform Meta-CART analysis
# Example assuming 'EffectSizeCalculations' includes predictors and the response variable

meta_tree <- REmrt(Hedgesg~ SeabedType + Location2 + MMSType2,  # Predictors
  data = EffectSizeCalculations, HedgesSE, c = 0.05)

# Inspect the results
print(meta_tree)
summary(meta_tree)

# Plot the tree
plot(meta_tree)