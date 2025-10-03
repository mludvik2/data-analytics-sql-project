1. **Answer to question 1**

*Do wages increase in all industry branches over the years or some decrease?*



I chose to review data from all the years available, year by year, industry by industry, for years **2006 through to year 2018**.

I grouped them into the difference calculation to see if there was a increase or decrease from the current wage versus the previous wage using the LAG function.



*My findings:*

There were *25 occurrences* where the wages declined that show that not all industry branches increased over this period.



Of the 19 industry branches:

* the wage trend in **16** industry branches declined
* the wage trend in **3** industry branches increased throughout the years of 2006 and 2018, these were: Zdravotní a sociální péče, Zpracovatelský průmysl and činnosti související s odpady a sanacemi

 

An anomaly was found that there were 19 industry branches that have a decline in wages, usually occurred in the **year 2013**.



Link to SQL: [Question 1](https://github.com/mludvik2/data-analytics-sql-project/blob/main/Question_1.sql)



**2. Answer to question 2**

*How much milk (liters) and bread (kilograms) can a person buy with the average wage comparing the first available year vs. the last available year?*



*My findings:*

* in year **2006** you could buy **2 772,37 liters of milk**
* in year **20018**  you could buy **2862,5 liters of milk**
* in year **2006** you could buy **2482,5kg of bread**
* in year **2018** you could buy **2340,4kg of bread**



According to the data difference, you could buy *90.13 liters more of milk* and you could buy *142.11 kg lesAs of bread*.



Link to SQL: [Question 2](https://github.com/mludvik2/data-analytics-sql-project/blob/main/Question_2.sql)



**3. Answer to question 3**

*Which food category has the slowest long-term growth (the lowest average year-on-year % increase)?*



**Formula:** Growth rate = ((price - previous price)/previous price) x 100



*Steps*:

1. **food growth** to get the average price per category/year
2. **food growth calculation** to compute the year-on-year growth % for each category
3. **average** the growth % across years
4. **sort** the data



*My findings:*

The category that increases the slowest is **granulated** **sugar**, which in fact did not increase but **decreased in price**, with an average year-on-year growth of **-1.92%.**"



Link to SQL: [Question 3](https://github.com/mludvik2/data-analytics-sql-project/blob/main/Question_3.sql)



**4. Answer to question 4**

*Is there a year in which the growth of food prices was significantly (by more than 10%) higher than the growth of wages?*



Computes year-on-year growth for each food category (price\_growth\_perc).



Computes year-on-year growth for each industry wage (wage\_growth\_perc).



Aggregates both at the year level and compares them.



The HAVING ensures you only get years where food price growth > wage growth by more than 10%.







So this CTE block sets you up with two clean tables (food\_growth\_calc and wage\_growth\_calc) that you can now join and compare by year in the next query.

food\_growth → averages food prices per category and year.



food\_growth\_calc → calculates year-on-year % growth in food prices using LAG().



wage\_growth → averages wages per industry and year.



wage\_growth\_calc → calculates year-on-year % growth in wages using LAG().





join:

We bring together food price growth (f) and wage growth (w), matching them by year.



This way we can directly compare how fast prices and wages were growing in the same year.



where:

Removes the first year in the dataset for both wages and prices (since you can’t calculate growth without a previous value).



aggregation:

For each year, it calculates:



average % growth of all food categories (avg\_food\_growth)



average % growth of all wage industries (avg\_wage\_growth)



We take the average because there are many food categories and industries, and we want a single comparable value for each year.



having: 

Keeps only the years where food prices grew more than 10% faster than wages.





**link**

