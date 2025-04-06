/* Write your PL/SQL query statement below */
SELECT customer_id, COUNT(*) count_no_trans 
FROM Visits v
LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
WHERE t.transaction_id IS NULL
GROUP BY customer_id