## Step 1). Define a question
กลุ่มพวกเราชอบเล่นเกมจึงมีความสนใจและต้องการศึกษาเพิ่มเติมเกี่ยวกับข้อมูลของเกมที่เป็นที่นิยมในขณะนั้นว่า คือ เกมอะไร ประเภทอะไร นิยมขายบนแพลตฟอร์มไหน วางขายในปีที่เท่าไหร่ บริษัทใดทำยอดขายได้มากที่สุด และยอดขายในแต่ละทวีปมีเท่าไหร่ จากข้อมูลที่กล่าวมานั้นจึงทำให้ Video games sales datasets ชุดนี้มีความน่าสนใจในการศึกษาค้นคว้า และนำมาใช้ในการเรียนรู้นั่นเอง

## Step 2). Search datasets from Kaggle
พวกเราจึงได้หาข้อมูลที่เกี่ยวกับการเก็บข้อมูลต่าง ๆ ในการขึ้น charts ของ spotify จาก [kaggle](https://www.kaggle.com/gregorut/videogamesales)<br>
และใช้คำสั่ง `read.csv()` เพื่อ import dataset
```{R}
games <- as_tibble(read.csv("pathToFile/vgsales.csv"))
```


## Data Exploration
Video Games Sales datasets เป็นชุดข้อมูลที่รวบรวมข้อมูลเกี่ยวกับเกมคอนโซล มีการจัดแบ่งข้อมูลที่อยู่ใน datasets ดังนี้<br>

dataset นี้ ประกอบไปด้วยเพลงทั้งหมด เกมทั้งหมด 16,598 เกม โดยใช้คำสั่ง `glimpse()` เพื่อใช้ในการตรวจสอบ 
```{R}
glimpse(games)
```
ผลลัพธ์
```{txt}
Rows: 16,598
Columns: 11
$ Rank         <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20~
$ Name         <chr> "Wii Sports", "Super Mario Bros.", "Mario Kart Wii", "Wii Sports Reso~
$ Platform     <chr> "Wii", "NES", "Wii", "Wii", "GB", "GB", "DS", "Wii", "Wii", "NES", "D~
$ Year         <chr> "2006", "1985", "2008", "2009", "1996", "1989", "2006", "2006", "2009~
$ Genre        <chr> "Sports", "Platform", "Racing", "Sports", "Role-Playing", "Puzzle", "~
$ Publisher    <chr> "Nintendo", "Nintendo", "Nintendo", "Nintendo", "Nintendo", "Nintendo~
$ NA_Sales     <dbl> 41.49, 29.08, 15.85, 15.75, 11.27, 23.20, 11.38, 14.03, 14.59, 26.93,~
$ EU_Sales     <dbl> 29.02, 3.58, 12.88, 11.01, 8.89, 2.26, 9.23, 9.20, 7.06, 0.63, 11.00,~
$ JP_Sales     <dbl> 3.77, 6.81, 3.79, 3.28, 10.22, 4.22, 6.50, 2.93, 4.70, 0.28, 1.93, 4.~
$ Other_Sales  <dbl> 8.46, 0.77, 3.31, 2.96, 1.00, 0.58, 2.90, 2.85, 2.26, 0.47, 2.75, 1.9~
$ Global_Sales <dbl> 82.74, 40.24, 35.82, 33.00, 31.37, 30.26, 30.01, 29.02, 28.62, 28.31,~
```

ซึ่งความหมายในแต่ละ Column ดังนี้

| Column Name  | Describe                                        | Type                           |
| ------------ | ----------------------------------------------- | ------------------------------ |
| Rank         | เป็นลำดับเกมที่มียอดขายสูงที่สุด                | Qualitative                    |
| Name         | เป็นชื่อของเกม                                  | Nominal, Qualitative           |
| Platform     | เป็นแพลตฟอร์มของเกมที่สามารถเล่นได้             | Nominal, Qualitative           |
| Year         | เป็นปีที่เกมวางจำหน่าย                          | Ordinal, Qualitative           |
| Genre        | เป็นประเภทของเกม                                | Category, Ordinal, Qualitative |
| Publisher    | เป็นบริษัทที่วางจำหน่ายเกม                      | Nominal, Ordinal, Qualitative  |
| NA_Sales     | เป็นยอดขายที่อยู่ในอเมริกาเหนือ (North America) | Quantitative                   |
| EU_Sales     | เป็นยอดขายที่อยู่ในยุโรป (Europe)               | Quantitative                   |
| JP_Sales     | เป็นยอดขายที่อยู่ในญี่ปุ่น (Japan)              | Quantitative                   |
| Other_sales  | เป็นยอดขายส่วนที่เหลือ                          | Quantitative                   |
| Global_sales | เป็นยอดขายทั้งโลกรวมกัน                         | Quantitative                   |
