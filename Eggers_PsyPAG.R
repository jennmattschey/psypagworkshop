# ========================================================================
# Funnel Plot & Egger's Test of Asymmetry
# ========================================================================

# This code was generated for a workshop given at PsyPAG 2016 by
# Jennifer Mattschey (r02jm15@abdn.ac.uk).
# To access more of the workshop materials and the workshop slides, please
# visit jennmattschey.wordpress.com

# This analysis requires the metafor package. If you've not already
# installed it, have a look at the "Basic R Stuff" cheat sheet to find out
# how to install it.


# Load the metafor package
library("metafor")

# Import your data
# You can do so by clicking on "Import Dataset" in the environment window and 
# selecting "Local File"
# or de-comment (delete the '#') this line and insert your file location:
# File.Drawer_Table <- read.csv("C:/Users/Desktop/File-Drawer_Table.csv")
# This is also explained in the "Basic R Stuff" cheat sheet.

# ========================================================================
# Analysis
# ========================================================================

# STEP 1:

# Apply random-effects model
# You need to apply the random-effects model to your data before you can 
# run Egger's test of asymmetry and get your funnel plot.
# The setting below are specified for the table layout used in the workshop, i.e.
# a table including the study title, Cohen's d (DE) and the Standard Error (SE)

RMA_Model <- rma(yi=File.Drawer_Table$DE, sei=File.Drawer_Table$SE)
RMA_Model


# STEP 2:
# Get your funnel plot

# specify where you want to have the funnel plot saved to, 
# e.g. C:/Users/Desktop/name.png, in the line below

png(filename="C:/Users/Desktop/name.png", width=1500, height=800)
funnel(RMA_Model, yaxis = "sei", shade = "#FCE8B0", back = "white")
dev.off()

# Note: You can resize the image by playing with the width and height

# STEP 3:

# Conduct Egger's Test of Asymmetry
eggers <- regtest(RMA_Model, model="rma", predictor = "sei", ret.fit = FALSE)
eggers

# You can type "help(regtest)" in the console to get more information on the 
# function

# Optional Step 4:
# You can also make a forest plot:

# specify where you want to have the funnel plot saved to, 
# e.g. C:/Users/Desktop/name.png, in the line starting with png
# and de-comment (delete the '#') all 4 lines:

# png(filename="C:/Users/Desktop/name2.png", width=800, height=1500)
# forest(RMA_Model)
# par(cex=1, font=3)
# dev.off()

# ========================================================================
# Remember to report the results you get from applying the random-effects 
# model HERE if you report the funnel plot and Egger's test of asymmetry
# (i.e. don't use the funnel plot and values from MetaXL if you ran
# the Egger's test here)

RMA_Model

# should get you all the info you need. 
# The effect size is listed in the "Model Results" section under "estimate".
# The lower (ci.lb) and upper (ci.up) limit of the effect size confidence interval 
# are stated and the end of that section.


