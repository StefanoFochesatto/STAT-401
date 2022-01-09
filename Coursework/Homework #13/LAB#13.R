dfLots <- read.csv('4-H lots (13).csv')
dfBids <- read.csv('4-H bids (13).csv', header = FALSE)
LastBid <- apply(dfBids, MARGIN = 1, FUN = max, na.rm = TRUE)
dfLots$Price <- LastBid
MixedModel <- lmer(Price ~ Animal + Weight + Age + Sex + Homeschooled + (1|Club), data = dfLots)
summary(MixedModel)
