
// Load dataset of 1000 samples (1 M&M pouch)
use "https://github.com/peterdutey/ictm0022-datasets/raw/385a3c37a4f8bd088bb785604d3a9c2330f809c4/m&m_1bag_samples.dta", clear

// Examine the dataset variables
describe

// Print first five observations
list in 1/5

// Histogram of proportion of red M&M's
histogram pr, start(0) width(0.01) xlabels(0(.05).3) percent 

// Save the plot
graph export "pr1.svg"


// Load dataset of 1000 samples (10 M&M pouches per sample)
use "https://github.com/peterdutey/ictm0022-datasets/raw/385a3c37a4f8bd088bb785604d3a9c2330f809c4/m&m_10bags_samples.dta", clear

// Examine the dataset variables
describe

// Print first five observations
list in 1/5

// Histogram of proportion of red M&M's
histogram pr, start(0) width(0.01) xlabels(0(.05).3) percent 

// Save the plot
graph export "pr10.svg"
