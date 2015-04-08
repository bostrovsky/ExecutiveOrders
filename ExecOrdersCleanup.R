barack = read.csv(file = "documents_signed_by_barack_obama_of_type_presidential_document_and_of_presidential_document_type_executive_order.csv", header = TRUE)
bill = read.csv(file="documents_signed_by_william_j_clinton_of_type_presidential_document_and_of_presidential_document_type_executive_order.csv", header = TRUE)
george = read.csv(file="documents_signed_by_george_w_bush_of_type_presidential_document_and_of_presidential_document_type_executive_order.csv", header = TRUE)

barack$president = "Obama"
bill$president="Clinton"
george$president="Bush"


#install.packages("stringr")
library(stringr)

barack$year <- str_sub(barack$signing_date,-4,-1)
bill$year <- str_sub(bill$signing_date,-4,-1)
george$year <- str_sub(george$signing_date,-4,-1)

barack$year <- as.numeric(barack$year)
bill$year <- as.numeric(bill$year)
george$year <- as.numeric(george$year)

hist(barack$year)
hist(bill$year)
hist(george$year)

presidentData <- barack
presidentData <- rbind(presidentData,bill)
presidentData <- rbind(presidentData,george)

hist(presidentData$year)

write.csv(presidentData, file = "PresidentialExecutiveOrders.csv")
