--1. Total count of applications
SELECT COUNT(id) AS Total_Loan_Applications FROM Bank_Loan_Data

--2. Month to Date Total loan applications
SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

--3. Previous Month to Date Total loan applications
SELECT COUNT(id) AS PMTD_Total_Loan_Applications FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

--4. Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM Bank_Loan_Data

--5. MOnth to Data Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

--6. Previous Month to Date Total Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

--7. Total Amount Received
SELECT SUM(total_payment) AS Total_Amount_Received FROM Bank_Loan_Data

--8. Month to Date Total Amount Received
SELECT SUM(total_payment) AS MTD_Total_Amount_Received FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

--9. Month to Date Total Amount Received
SELECT SUM(total_payment) AS PMTD_Total_Amount_Received FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

--10. Average Interest Rate
SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate FROM Bank_Loan_Data

--11. Month to Date Average Interest Rate
SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

--12. Month to Date Average Interest Rate
SELECT ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

--13. Average Debt to Income Ratio (DTI)
SELECT ROUND(AVG(dti), 4) * 100 AS AVG_DTI FROM Bank_Loan_Data

--14. MTD Average Debt to Income Ratio (DTI)
SELECT ROUND(AVG(dti), 4) * 100 AS MTD_AVG_DTI FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

--15. MTD Average Debt to Income Ratio (DTI)
SELECT ROUND(AVG(dti), 4) * 100 AS PMTD_AVG_DTI FROM Bank_Loan_Data
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

--16. Good Loan Percentage
SELECT
		(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)* 100)
		/
		COUNT (id) AS Good_Loan_Percentage
FROM Bank_Loan_Data

--17. Total Number of Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM Bank_Loan_Data
WHERE loan_status= 'Fully Paid' OR loan_status= 'Current'

--18. Total Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM Bank_Loan_Data
WHERE loan_status= 'Fully Paid' OR loan_status= 'Current'

--19. Total Good Loan Amount Received 
SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM Bank_Loan_Data
WHERE loan_status= 'Fully Paid' OR loan_status= 'Current'

 
--20. Loan Status wise Performance
SELECT 
		loan_status,
		COUNT(id) AS Total_Loan_Applications,
		SUM(total_payment) AS Total_Amount_Received,
		SUM(loan_amount) AS Total_Funded_Amount,
		ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate,
		ROUND(AVG(dti), 4) * 100 AS AVG_DTI
	FROM
		Bank_Loan_Data
	GROUP BY 
		loan_status


--21 MTD Loan Status wise Performance
SELECT 
		loan_status,
		SUM(total_payment) AS MTD_Total_Amount_Received,
		SUM(loan_amount) AS MTD_Total_Funded_Amount
	FROM
		Bank_Loan_Data
	WHERE 
		MONTH(issue_date) = 12
	GROUP BY 
		loan_status

--22. Monthly Trends by Issue Date
SELECT 
MONTH(issue_date) AS Month_Number,
DATENAME(MONTH, issue_date) AS Month_Name,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_Data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date) 
ORDER BY MONTH(issue_date)

--23. Regional Analysis by State 
SELECT 
address_state,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_Data
GROUP BY address_state
ORDER BY count(id) DESC

--24. Loan Term Analysis
SELECT 
term,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_Data
GROUP BY term
ORDER BY term

--25. Employee Length Analysis 
SELECT 
emp_length,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_Data
GROUP BY emp_length
ORDER BY emp_length

--26. Loan Purpose Breakdown 
SELECT 
purpose,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_Data
GROUP BY purpose
ORDER BY count(id) DESC

--27. Home Ownership Analysis 
SELECT 
home_ownership,
COUNT(id) AS Total_Loan_Applications,
SUM(loan_amount) AS Total_Funded_Amount,
SUM(total_payment) AS Total_Amount_Received
FROM Bank_Loan_Data
GROUP BY home_ownership

ORDER BY count(id) DESC
