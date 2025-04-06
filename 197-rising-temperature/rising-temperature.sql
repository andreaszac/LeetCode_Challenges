/* Write your PL/SQL query statement below */
WITH previous_day_temp AS(
SELECT id,temperature, recordDate, 
LAG(temperature) OVER(ORDER BY recordDate) previous_day_temperature,
LAG(recordDate) OVER (ORDER BY recordDate) previous_day
FROM Weather
)
SELECT id
FROM previous_day_temp
WHERE (temperature - previous_day_temperature) > 0 AND recordDate = previous_day + 1
