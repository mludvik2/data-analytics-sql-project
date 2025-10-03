1. **Answer to question 1**

**Do wages increase in all industry branches over the years or some decrease?**



I choose to review data from all the years available, year by year, industry by industry, for years **2006 through to year 2018**.

I grouped them into the difference calculation to see if there was a increase or decrease from the current wage versus the previous wage using the LAG function.



*My findings:*

There were *25 occurrences* where the wages declined that show that not all industry branches increased over this period.



Of the 19 industry branches:

* the wage trend in **16** industry branches declined
* the wage trend in **3** industry branches increased throughout the years of 2006 and 2018, these were: Zdravotní a sociální péče, Zpracovatelský průmysl and činnosti související s odpady a sanacemi

 

An anomaly was found 19 industry branches that have a decline in wages usually occurred in the **year 2013**.



**2. Answer to question 2**

**How much milk (liters) and bread (kilograms) can a person buy with the average wage comparing the first available year vs. the last available year?**

* in year 2006 you could buy 2 772,37 liters of milk
* in year 20018  you could buy 2862,5 liters of milk
* in year 2006 you could buy 2482,5kg of bread
* in year 2018 you could buy 2340,4kg of bread



According to the data difference, you can buy *90.13 liters more of milk* and you can buy *142.11 kg less of bread*.



**3. Answer to question 3**



**Formula:** 



food\_growth → get average price per category/year.



food\_growth\_calc → compute year-on-year growth % for each category.



Final SELECT → average the growth % across years, then sort ascending.



LIMIT 1 → picks the slowest growing category.



average growth percent = summarizes over the whole period by taking the average yearly growth per category. collapse all years into a single representative number per category → easy to rank slowest → fastest.it transforms many year-by-year growth values into one comparable measure for each category across the whole period.



"The category that increases the slowest is sugar, which in fact did not increase but decreased in price, with an average year-on-year growth of -1.92%."

