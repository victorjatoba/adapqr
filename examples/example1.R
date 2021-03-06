
if (!require('catR')) install.packages('catR')
require('catR')

# For this code I will use the catR package to generate my assessments 
# and responses.
library("catR")

path <- "."
setwd(path)

# Loading the 'tcals' parameters
enem_data_param = read.table("enem.par", header = TRUE, sep = " ", stringsAsFactors = FALSE)

# Change to Matrix
enem_data_param <- as.matrix(enem_data_param)

Start <- list(nrItems = 1, theta = 0, startSelect = "MFI")

Test <- list(method = "WL", itemSelect = "MFI")

Stop <- list(rule = "precision", thr = 0.4, alpha = 0.05)

Final <- list(method = "EAP", alpha = 0.05)

res <- randomCAT(trueTheta = rnorm(n=1,mean=0,sd=1), itemBank = Bank,
                 start = Start, test = Test,
                 stop = Stop, final = Final)

plot(res, ci = TRUE, trueTh = TRUE, classThr = 2)

res