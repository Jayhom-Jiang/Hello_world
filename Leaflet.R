

data2 = llply(data1, processChoroData, 
  x =cut(Adult_Obesity_Rate, 5, labels = F) ~ state | Mandates_BMI_Screening,
  pal = 'PuRd', map = 'usa'
)

