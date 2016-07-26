# ========================================================================
#  Fail-Safe N Analysis
# ========================================================================


# This code was generated for a workshop given at PsyPAG 2016 by
# Jennifer Mattschey (r02jm15@abdn.ac.uk).
# To access more of the workshop materials and the workshop slides, please
# visit jennmattschey.wordpress.com

# This analysis requires the metafor package. If you've not already
# installed it, have a look at the "Basic R Stuff" cheat sheet to find out
# how to install it.

# ========================================================================

# Load the metafor package
library("metafor")

# Import your data
# You can do so by clicking on "Import Dataset" in the environment window and 
# selecting "Local File"
# or de-comment (delete the '#') this line and insert your file location:
# File.Drawer_Table <- read.csv("C:/Users/Desktop/File-Drawer_Table.csv")

# ========================================================================

# Type "help (fsn)" in the command window for details and references
# and/or re-visit the workshop slides if you'd like a reminder of the
# differences between methods


# Rosenthal
Rosenthal <- fsn(File.Drawer_Table$DE, sei=File.Drawer_Table$SE, type="Rosenthal")
Rosenthal

# Rosenberg
Rosenberg <- fsn(File.Drawer_Table$DE, sei=File.Drawer_Table$SE, type="Rosenberg")
Rosenberg

# Orwin
Orwin <- fsn(File.Drawer_Table$DE, sei=File.Drawer_Table$SE, type="Orwin", target=0.01)
Orwin

