# Define Question and Data Analysis

## Define Questions

1. ในแต่ละประเภท มียอดขายรวมกันมากที่สุดเท่าไร
1. บริษัทใดมียอดขายรวมกันเยอะที่สุด
1. บริษัทที่มียอดขายมากที่สุดในแต่ละทวีป
1. แพลตฟอร์มไหนมียอดขายเกมทุกเกมรวมกันมากที่สุด
1. ชื่อเกมที่มียอดขายรวมกันสูงที่สุด
1. ในทุก ๆ ปี มียอดขายรวมกันมากที่สุดเท่าไร
1. ปีที่มียอดขายเกมรวมกันมากที่สุดคือปีอะไร
1. เกมส่วนใหญ่เป็นเกมประเภทอะไร
1. บริษัทที่วางจำหน่ายเกมมากที่สุด
1. เกมส่วนใหญ่เล่นบน platform ใด
1. แต่ละปีไหนมีจำนวนเกมที่ขายเท่าใด
1. แต่ละทวีปมียอดขายเกมใดมากที่สุด
1. แต่ละแพลตฟอร์มมีเกมที่ขายจำนวนเท่าใด
1. แต่ละทวีปมียอดขายรวมทั้งหมดเท่าใด
1. เกมประเภทไหนขายดีที่สุด
1. แพลตฟอร์มเกมที่ขายดีที่สุดคืออะไร
1. ภูมิภาคใดมียอดขายมากที่สุด
1. ยอดขายเกมรวมกันทั้งหมดของ NA_Sales, EU_Sales, JP_Sales และ Other_Sales

## Answer Question with EDA

#### 1. ในแต่ละประเภท มียอดขายรวมกันมากที่สุดเท่าไร

คำสั่ง

```R
games %>%
group_by(Genre) %>%
summarize(max_globalsales = max(Global_Sales))
```

ผลลัพธ์
```R
# A tibble: 12 x 2
   Genre        max_globalsales
   <fct>                  <dbl>
 1 Action                 21.4 
 2 Adventure              11.2 
 3 Fighting               13.0 
 4 Misc                   29.0 
 5 Platform               40.2 
 6 Puzzle                 30.3 
 7 Racing                 35.8 
 8 Role-Playing           31.4 
 9 Shooter                28.3 
10 Simulation             24.8 
11 Sports                 82.7 
12 Strategy                5.45
```

> จากกลุ่มตัวอย่างเช่น ประเภทเกม Action มียอดขายรวมกันสูงสุดอยู่ที่ 21.4 ล้านดอลลาร์ ส่วนประเภทเกม Adventure มียอดขายรวมกันสูงสุดอยู่ที่ 11.2 ล้านดอลลาร์ และประเภทอื่น ๆ ตามผลลัพธ์

#### 2. บริษัทใดมียอดขายรวมกันเยอะที่สุด

คำสั่ง

```R
games %>%
group_by(Publisher) %>%
summarize(max_globalsales = max(Global_Sales)) %>% 
arrange(desc(max_globalsales))
```

ผลลัพธ์

```R
# A tibble: 579 x 2
   Publisher                   max_globalsales
   <chr>                                 <dbl>
 1 Nintendo                              82.7 
 2 Microsoft Game Studios                21.8 
 3 Take-Two Interactive                  21.4 
 4 Sony Computer Entertainment           15.0 
 5 Activision                            14.8 
 6 Ubisoft                               10.3 
 7 Bethesda Softworks                     8.84
 8 Electronic Arts                        8.49
 9 Sega                                   8.06
10 SquareSoft                             7.86
# ... with 569 more rows
```

> จากกลุ่มตัวอย่างพบว่า บริษัท Nintendo มียอดขายรวมกันมากที่สุดคือ 82.7 ล้านดอลลาร์ และบริษัทอื่น ๆ ไล่ลำดับลงไปตามผลลัพธ์

#### 3. บริษัทที่มียอดขายมากที่สุดในแต่ละทวีป

คำสั่ง(NA_Sales)

```R
games %>%
group_by(Publisher) %>%
summarize(max_NAsales = max(NA_Sales)) %>% 
arrange(desc(max_NAsales))
```

ผลลัพธ์

```R
# A tibble: 579 x 2
   Publisher                   max_NAsales
   <chr>                             <dbl>
 1 Nintendo                          41.5 
 2 Microsoft Game Studios            15.0 
 3 Activision                         9.67
 4 Take-Two Interactive               9.63
 5 Atari                              7.28
 6 Sony Computer Entertainment        6.85
 7 Ubisoft                            6.05
 8 Bethesda Softworks                 5.03
 9 Sega                               4.47
10 Electronic Arts                    4.46
# ... with 569 more rows
```

> จากกลุ่มตัวอย่างพบว่า บริษัท Nintendo มียอดขายภายในทวีปอเมริกาเหนือมากที่สุดคือ 41.5 ล้านดอลลาร์ และบริษัทอื่น ๆ ไล่ลำดับลงไปตามผลลัพธ์

คำสั่ง(EU_Sales)

```R
games %>%
group_by(Publisher) %>%
summarize(max_EUsales = max(EU_Sales)) %>% 
arrange(desc(max_EUsales))
```

ผลลัพธ์

```R
# A tibble: 579 x 2
   Publisher                   max_EUsales
   <chr>                             <dbl>
 1 Nintendo                          29.0 
 2 Take-Two Interactive               9.27
 3 Electronic Arts                    6.42
 4 Activision                         6.21
 5 Sony Computer Entertainment        5.09
 6 Microsoft Game Studios             4.94
 7 Sega                               3.9 
 8 Bethesda Softworks                 3.15
 9 Ubisoft                            3.15
10 GT Interactive                     2.8 
# ... with 569 more rows
```

> จากกลุ่มตัวอย่างพบว่า บริษัท Nintendo มียอดขายภายในทวีปยุโรปมากที่สุดคือ 29.0 ล้านดอลลาร์ และบริษัทอื่น ๆ ไล่ลำดับลงไปตามผลลัพธ์

คำสั่ง(JP_Sales)

```R
games %>%
group_by(Publisher) %>%
summarize(max_JPsales = max(JP_Sales)) %>% 
arrange(desc(max_JPsales))
```

ผลลัพธ์

```R
# A tibble: 579 x 2
   Publisher                    max_JPsales
   <chr>                              <dbl>
 1 Nintendo                           10.2 
 2 Capcom                              4.87
 3 Enix Corporation                    4.1 
 4 SquareSoft                          3.63
 5 Square Enix                         3.61
 6 Sony Computer Entertainment         3.28
 7 Level 5                             2.68
 8 Eidos Interactive                   2.34
 9 Konami Digital Entertainment        2.17
10 Electronic Arts                     2.11
```

> จากกลุ่มตัวอย่างพบว่า บริษัท Nintendo มียอดขายภายในประเทศญี่ปุ่นมากที่สุดคือ 10.2  ล้านดอลลาร์ และบริษัทอื่น ๆ ไล่ลำดับลงไปตามผลลัพธ์

#### 4. แพลตฟอร์มไหนมียอดขายเกมทุกเกมรวมกันมากที่สุด

คำสั่ง

```R
sumByPlatform <- games %>% 
group_by(Platform) %>% 
summarise(Total_Sale = sum(Global_Sales))
```

ผลลัพธ์

```R
# A tibble: 1 x 1
  Platform
  <chr>   
1 PS2
```

> จากกลุ่มตัวอย่างพบว่า แพลตฟอร์มที่มียอดขายเกมทุกเกมรวมกันมากที่สุด คือ PS2

#### 5. ชื่อเกมที่มียอดขายรวมกันสูงที่สุด

คำสั่ง

```R
games %>% filter(Global_Sales== max(Global_Sales)) %>% select(Name)
```

ผลลัพธ์

```R
# A tibble: 1 x 1
  Name      
  <chr>     
1 Wii Sports
```

> จากกลุ่มตัวอย่างพบว่า ชื่อเกมที่มียอดขายรวมกันสูงที่สุด คือ Wii Sports

#### 6. ในทุก ๆ ปี มียอดขายรวมกันมากที่สุดเท่าไร

คำสั่ง

```R
games %>% group_by(Year) %>% summarize(max_globalsales = max(Global_Sales))
```

ผลลัพธ์

```R
# A tibble: 40 x 2
   Year  max_globalsales
   <fct>           <dbl>
 1 1980             4.31
 2 1981             4.5 
 3 1982             7.81
 4 1983             3.2 
 5 1984            28.3 
 6 1985            40.2 
 7 1986             6.51
 8 1987             4.38
 9 1988            17.3 
10 1989            30.3 
# ... with 30 more rows
```

> จากกลุ่มตัวอย่างเช่น ในปี 1980 มียอดขายรวมกันสูงสุดอยู่ที่ 4.31 ล้านดอลลาร์ ส่วนปี 1981 มียอดขายรวมกันสูงสุดอยู่ที่ 4.5 ล้านดอลลาร์ และประเภทอื่น ๆ ตามผลลัพธ์

#### 7. ปีที่มียอดขายเกมรวมกันมากที่สุดคือปีอะไร

คำสั่ง

```R
 sumByYear <- games %>% group_by(Year) %>% summarise(Total_Sale = sum(Global_Sales))

```

ผลลัพธ์

```R
# A tibble: 1 x 1
  Year 
  <chr>
1 2008 
```

> จากกลุ่มตัวอย่างพบว่า ปีที่มียอดขายเกมรวมกันมากที่สุดคือปี 2008

#### 8. เกมส่วนใหญ่เป็นเกมประเภทอะไร

คำสั่ง

```R
Mode(games$Genre)
```

ผลลัพธ์

```R
[1] Action
attr(,"freq")
[1] 3316
12 Levels: Action Adventure Fighting Misc Platform ... Strategy
```

> จากกลุ่มตัวอย่างพบว่า เกมส่วนใหญ่นั้นเป็นเกมประเภท เกม Action โดยมีจำนวน 3,316 เกมจากกลุ่มตัวอย่างทั้งหมด

#### 9. บริษัทที่วางจำหน่ายเกมมากที่สุด

คำสั่ง

```R
Mode(games$Publisher)
```

ผลลัพธ์

```R
[1] "Electronic Arts"
attr(,"freq")
[1] 1351
```

> จากกลุ่มตัวอย่างพบว่า บริษัทที่วางจำหน่ายเกมได้มากที่สุด คือ บริษัท Electronic Arts โดยมีจำนวน 1,351 เกมจากกลุ่มตัวอย่างทั้งหมด

#### 10. เกมส่วนใหญ่เล่นบน platform ใด

คำสั่ง

```R
Mode(games$Platform)
```

ผลลัพธ์

```R
[1] "DS"
attr(,"freq")
[1] 2163

```

> จากกลุ่มตัวอย่างพบว่า เกมส่วนใหญ่นั้นเล่นบนแพลตฟอร์ม DS โดยมีจำนวน 2163 เกมจากกลุ่มตัวอย่างทั้งหมด

#### 11. แต่ละปีไหนมีจำนวนเกมที่ขายเท่าใด

คำสั่ง

```R
games %>% count(games$Year)
```

ผลลัพธ์

```R
# A tibble: 40 x 2
   `games$Year`     n
   <fct>        <int>
 1 1980             9
 2 1981            46
 3 1982            36
 4 1983            17
 5 1984            14
 6 1985            14
 7 1986            21
 8 1987            16
 9 1988            15
10 1989            17
# ... with 30 more rows

```

> จากกลุ่มตัวอย่าง แสดงให้เห็นถึงจำนวนของเกม (n) ที่ขายในแต่ละปี (games$year)

#### 12. แต่ละทวีปมียอดขายเกมใดมากที่สุด

คำสั่ง

```R
print("NA_Sales") 
games$Name[max(games$NA_Sales)]
print("EU_Sales") 
games$Name[max(games$EU_Sales)]
print("JP_Sales") 
games$Name[max(games$JP_Sales)]
```

ผลลัพธ์

```R
[1] "NA_Sales"
[1] "Call of Duty: Black Ops"
[1] "EU_Sales"
[1] "Gran Turismo 3: A-Spec"
[1] "็JP_Sales"
[1] "Duck Hunt"

```

> จากกลุ่มตัวอย่างพบว่า แต่ละทวีปมีเกมที่มียอดขายมากที่สุดต่างกันออกไป ซึ่งทำให้สามารถคาดเดาเกมที่แต่ละทวีปสนใจได้

#### 13. แต่ละแพลตฟอร์มมีเกมที่ขายจำนวนเท่าใด

คำสั่ง

```R
games %>% count(Platform)
```

ผลลัพธ์

```R
# A tibble: 31 x 2
Platform     n
<chr>    <int>
 1 2600       133
 2 3DO          3
 3 3DS        509
 4 DC          52
 5 DS        2163
 6 GB          98
 7 GBA        822
 8 GC         556
 9 GEN         27
10 GG           1
# ... with 21 more rows
```

>จากกลุ่มตัวอย่าง แสดงให้เห็นถึงจำนวนของเกม (n) ที่ขายในแต่ละแพลตฟอร์ม (Platform)

#### 14. แต่ละทวีปมียอดขายรวมทั้งหมดเท่าใด

คำสั่ง

```R
print("NA_Sales")
sum(games$NA_Sales)
print("EU_Sales") 
sum(games$EU_Sales)
print("็JP_Sales")
sum(games$JP_Sales)

```

ผลลัพธ์

```R
[1] "NA_Sales"
[1] 4392.95
[1] "EU_Sales"
[1] 2434.13
[1] "็JP_Sales"
[1] 1291.02
```

> จากกลุ่มตัวอย่างพบว่า ในแต่ละทวีปนั้นมียอดขายรวมแตกต่างกัน

#### 15. เกมประเภทไหนขายดีที่สุด

คำสั่ง

```R
games %>% filter(Global_Sales==max(Global_Sales)) %>% select(Genre)
```

ผลลัพธ์

```R
# A tibble: 1 x 1
  Genre 
  <chr> 
1 Sports
```

> จากกลุ่มตัวอย่างพบว่า เกมประเภท Sports ขายดีที่สุด

#### 16. แพลตฟอร์มเกมที่ขายดีที่สุดคืออะไร

คำสั่ง

```R
games %>% filter(Global_Sales==max(Global_Sales,na.rm = T)) %>% select(Platform)
```

ผลลัพธ์

```R
# A tibble: 1 x 1
  Platform
  <chr>   
1 Wii
```

> จากกลุ่มตัวอย่างพบว่า แพลตฟอร์มเกม Wii ขายดีที่สุด

#### 17. ภูมิภาคใดมียอดขายมากที่สุด

คำสั่ง (NA_Sales)

```R
games %>% summarise(sum = sum(NA_Sales))
```

ผลลัพธ์

```R
  sum
  <dbl>
1 4393.
```

คำสั่ง (JP_Sales)

```R
games %>% summarise(sum = sum(JP_Sales))
```

ผลลัพธ์

```R
  sum
  <dbl>
1 1291
```

คำสั่ง (EU_Sales)

```R
games %>% summarise(sum = sum(EU_Sales))
```

ผลลัพธ์

```R
  sum
  <dbl>
1 2434
```

คำสั่ง (Other_Sales)

```R
games %>% summarise(sum = sum(Other_Sales))
```

ผลลัพธ์

```R
  sum
  <dbl>
1  798

```

> จากกลุ่มตัวอย่างพบว่า NA_Sales มียอดขายมากที่สุดเป็นจำนวน 4393 ล้านดอลลาร์

#### 18. ในแต่ละประเภท มียอดขายรวมกันมากที่สุดเท่าไร

คำสั่ง

```R
games %>% summarise(sum = sum(NA_Sales,JP_Sales,EU_Sales,Other_Sales))
```

ผลลัพธ์

```R
 sum
1 8915.85

```

> จากกลุ่มตัวอย่างพบว่า ยอดขายเกมทั้งหมดของ NA_Sales, EU_Sales, JP_Sales และ Other_Sales รวมกันแล้วเป็นจำนวน 8915.85 ล้านดอลลาร์

---
