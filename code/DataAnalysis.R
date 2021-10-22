#Data Analysis with Descriptive Statistics

#1. ในแต่ละประเภท มียอดขายรวมกันมากที่สุดเท่าไร

#คำสั่ง
games %>%
group_by(Genre) %>%
summarize(max_globalsales = max(Global_Sales))

#2. บริษัทใดมียอดขายรวมกันเยอะที่สุด

#คำสั่ง
games %>%
group_by(Publisher) %>%
summarize(max_globalsales = max(Global_Sales)) %>% 
arrange(desc(max_globalsales))

#3. บริษัทที่มียอดขายมากที่สุดในแต่ละทวีป

#คำสั่ง(NA_Sales)
games %>%
group_by(Publisher) %>%
summarize(max_NAsales = max(NA_Sales)) %>% 
arrange(desc(max_NAsales))

#คำสั่ง(EU_Sales)
games %>%
group_by(Publisher) %>%
summarize(max_EUsales = max(EU_Sales)) %>% 
arrange(desc(max_EUsales))

#คำสั่ง(JP_Sales)
games %>%
group_by(Publisher) %>%
summarize(max_JPsales = max(JP_Sales)) %>% 
arrange(desc(max_JPsales))

#4. แพลตฟอร์มไหนมียอดขายเกมทุกเกมรวมกันมากที่สุด
#คำสั่ง
sumByPlatform <- games %>% 
group_by(Platform) %>% 
summarise(Total_Sale = sum(Global_Sales))

sumByPlatform %>% filter(Total_Sale == max(Total_Sale)) %>% select(Platform)

#5. ชื่อเกมที่มียอดขายรวมกันสูงที่สุด
#คำสั่ง
games %>% filter(Global_Sales== max(Global_Sales)) %>% select(Name)

#6. ในทุก ๆ ปี มียอดขายรวมกันมากที่สุดเท่าไร
#คำสั่ง
games %>%
group_by(Year) %>%
summarize(max_globalsales = max(Global_Sales))

#7. ปีที่มียอดขายเกมรวมกันมากที่สุดคือปีอะไร 
#คำสั่ง
sumByYear <- games %>%  
group_by(Year) %>% 
summarise(Total_Sale = sum(Global_Sales))

#8. เกมส่วนใหญ่เป็นเกมประเภทอะไร
#คำสั่ง
Mode(games$Genre)

#9. บริษัทที่วางจำหน่ายเกมมากที่สุด
#คำสั่ง
Mode(games$Publisher)

#10. เกมส่วนใหญ่เล่นบน platform ใด
#คำสั่ง
Mode(games$Platform)

#11. แต่ละปีไหนมีจำนวนเกมที่ขายเท่าใด
#คำสั่ง
games %>% count(games$Year)

#12. แต่ละทวีปมียอดขายเกมใดมากที่สุด
#คำสั่ง
print("NA_Sales") 
games$Name[max(games$NA_Sales)]
print("EU_Sales") 
games$Name[max(games$EU_Sales)]
print("JP_Sales") 
games$Name[max(games$JP_Sales)]

#13. แต่ละแพลตฟอร์มมีเกมที่ขายจำนวนเท่าใด
#คำสั่ง
games %>% count(Platform)

#14. แต่ละทวีปมียอดขายรวมทั้งหมดเท่าใด
#คำสั่ง
print("NA_Sales")
sum(games$NA_Sales)
print("EU_Sales") 
sum(games$EU_Sales)
print("็JP_Sales")
sum(games$JP_Sales)

#15. เกมประเภทไหนขายดีที่สุด
#คำสั่ง
games %>% filter(Global_Sales==max(Global_Sales)) %>% select(Genre)

#16. แพลตฟอร์มเกมที่ขายดีที่สุดคืออะไร
#คำสั่ง
games %>% filter(Global_Sales==max(Global_Sales,na.rm = T)) %>% select(Platform)

#17. ภูมิภาคใดมียอดขายมากที่สุด
#คำสั่ง(NA_Sales)
games %>% summarise(sum = sum(NA_Sales))

#คำสั่ง(JP_Sales)
games %>% summarise(sum = sum(JP_Sales))

#คำสั่ง(EU_Sales)
games %>% summarise(sum = sum(EU_Sales))

#คำสั่ง(Other_Sales)
games %>% summarise(sum = sum(Other_Sales))

#18.ยอดขายเกมรวมกันทั้งหมดของ NA_Sales, EU_Sales, JP_Sales และ Other_Sales
#คำสั่ง
games %>% summarise(sum = sum(NA_Sales,JP_Sales,EU_Sales,Other_Sales))
