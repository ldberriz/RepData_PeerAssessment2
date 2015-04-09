# Load the file reading routines

source("prepData.R")

# Read the data file

f.in <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
f.out <- "repdata-data-StormData.csv"

getbZFile(f.in,f.out)
dta <- read.csv(f.out)

ddply(dta, STATE, 
      N    = length(PROPDMG),
      mean = mean(PROPDMG),
      sd   = sd(PROPDMG),
      se   = sd / sqrt(N) )


NEI.stats <- ddply(NEI.Baltimore, c("type","year"), summarise,
                   N    = length(Emissions),
                   mean = mean(Emissions),
                   sd   = sd(Emissions),
                   se   = sd / sqrt(N) )

attach(dta)
dtw <- data.frame(BGN_DATE, STATE, EVTYPE, FATALITIES, 
                  INJURIES, PROPDMG, PROPDMGEXP, CROPDMG, 
                  CROPDMGEXP)



events <- as.vector(names(head(dtw.f,10)))
y_vals <- as.vector(head(dtw.f,10))
df <- data.frame(events, y_vals)
ggplot(data = df, aes(x = df$events, y = df$y_vals)) + geom_bar(stat = "identity") + 
  theme(axis.text.x = element_text(angle = 90, hjust = 1)) + xlab("Event Type") + 
  ylab("# of Fatalities") + ggtitle("NOAA Storm Data Base\ Top 10: Highest Fatality Counts, 1950-2011")
