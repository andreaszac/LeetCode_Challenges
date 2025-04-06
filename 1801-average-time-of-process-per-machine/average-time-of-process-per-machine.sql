/* Write your PL/SQL query statement below */
WITH starting AS(
SELECT machine_id,process_id,timestamp
FROM Activity
WHERE activity_type = 'start'
)
SELECT a.machine_id, ROUND(SUM(a.timestamp - s.timestamp)/COUNT(a.process_id),3) AS processing_time 
FROM Activity a
INNER JOIN starting s
ON a.machine_id = s.machine_id AND a.process_id = s.process_id
WHERE activity_type = 'end'
GROUP BY a.machine_id