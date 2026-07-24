--Lab 13 Implement SQL Joins to Combine Multiple Tables
--From the table STUDENT_INFO and RESULT perform the following queries:
--Part – A:
--1. Combine information from Student and Result table using cross join (Cartesian product).
SELECT *  FROM
STUDENT_INFO AS S, RESULT AS R
--2. Perform inner join on Student and Result tables.
SELECT * FROM STUDENT_INFO AS S
INNER JOIN RESULT AS R
ON S.RNO=R.RNO
--3. Perform the left outer join on Student and Result tables.
SELECT * FROM STUDENT_INFO AS S
LEFT OUTER JOIN RESULT AS R
ON S.RNO=R.RNO
--4. Perform the right outer join on Student and Result tables.
SELECT * FROM STUDENT_INFO AS S
RIGHT OUTER JOIN RESULT AS R
ON S.RNO=R.RNO
--5. Perform the full outer join on Student and Result tables.
SELECT * FROM STUDENT_INFO AS S
FULL OUTER JOIN RESULT AS R
ON S.RNO=R.RNO
--6. Display Rno, Name, Branch and SPI of all students.
SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
--7. Display Rno, Name, Branch and SPI of CE branch students only.
SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
WHERE S.BRANCH='CE'
--8. Display Rno, Name, Branch and SPI of students other than EC branch.
SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
WHERE NOT S.BRANCH='EC'
--9. Display Rno, Name and SPI of students whose SPI is greater than 8.
SELECT S.RNO,S.NAME,S.BRANCH,R.SPI
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
WHERE SPI>8
--10. Display Rno, Name and Branch of students whose SPI is less than 8.
SELECT S.RNO,S.NAME,S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
WHERE SPI<8
--11. Display average result of each branch.
SELECT AVG(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
--12. Display average result of CE and ME branch.
SELECT AVG(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
WHERE BRANCH IN ('CE','ME')
GROUP BY BRANCH
--13. Display maximum and minimum SPI of each branch.
SELECT MIN(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
--14. Display branch-wise student count in descending order.
SELECT COUNT(*),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
ORDER BY COUNT(*) DESC
--15. Display branch-wise total SPI of students.
SELECT SUM(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
--Part – B:
--16. Display branch-wise number of students having SPI greater than 8.
SELECT COUNT(*),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
WHERE SPI>8
GROUP BY BRANCH
--17. Display branch-wise number of students having SPI less than 8.
SELECT COUNT(*),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
WHERE SPI<8
GROUP BY BRANCH
--18. Display branch-wise average SPI greater than 7.
SELECT AVG(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING AVG(SPI)>7
--19. Display branches having more than 1 students.
SELECT S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING COUNT(*)>1
--20. Display branches where maximum SPI is greater than 9.
SELECT S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING MAX(SPI)>9
--Part – C:
--21. Display average result of each branch and sort them in ascending order by SPI.
SELECT AVG(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
ORDER BY AVG(R.SPI)
--22. Display highest SPI from each branch and sort them in descending order.
SELECT MAX(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
ORDER BY MAX(R.SPI)
--23. Display average result of each branch and sort them in ascending order by SPI.
SELECT AVG(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
ORDER BY AVG(R.SPI)
--24. Display highest SPI from each branch and sort them in descending order.
SELECT MAX(R.SPI),S.BRANCH
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
ORDER BY MAX(R.SPI)
--25. Display branches where difference between max and min SPI is greater than 1.
SELECT S.BRANCH,MAX(R.SPI)-MIN(R.SPI) AS DIFF_SPI
FROM STUDENT_INFO AS S
JOIN RESULT AS R
ON S.RNO=R.RNO
GROUP BY BRANCH
HAVING MAX(R.SPI)-MIN(R.SPI) >1