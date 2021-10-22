# Data Cleaning and Data Transformation

Datasets from: [Video Game Sales](https://www.kaggle.com/gregorut/videogamesales)
Code : [DataCleaning.R](../code/DataCleaning.R)

### Step 1) Changing type  (แปลงเป็น factor)

```R
games$Publisher <- as.factor(games$Publisher)
summary(games$Publisher)

games$Genre <- as.factor(games$Genre)
summary(games$Genre)

games$Year <- as.factor(games$Year)
summary(games$Year)

games$Platform <- as.factor(games$Platform)
summary(games$Platform)

```

### Step 2) Eliminate the N/A year (ลบ N/A ออก)

```R
games <- games %>% filter(Year != "N/A")
```

---
