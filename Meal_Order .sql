{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 CourierNewPSMT;\f1\froman\fcharset0 Times-Roman;\f2\fswiss\fcharset0 ArialMT;
}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c100000;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf0 \cb2 \expnd0\expndtw0\kerning0
\'97Calculating Revenuue\
\
SELECT\'a0 \cb1 \uc0\u8232 \cb2 \'a0 order_id,\'a0 \cb1 \uc0\u8232 \cb2 \'a0 SUM(meal_price * order_quantity) AS revenue\'a0 \cb1 \uc0\u8232 \cb2 FROM meals\'a0 \cb1 \uc0\u8232 \cb2 JOIN orders ON meals.meal_id = orders.meal_id\'a0 \cb1 \uc0\u8232 \cb2 GROUP BY order_id; \cb1 \uc0\u8232 \cb2 \'a0\cb1 \uc0\u8232 \cb2 --Calculating Cost\'a0\
SELECT\'a0 \cb1 \uc0\u8232 \cb2 \'a0 meals.meal_id, \'a0 \cb1 \uc0\u8232 \cb2 \'a0 SUM(meal_cost * stocked_quantity) AS cost \'a0 \cb1 \uc0\u8232 \cb2 FROM meals\'a0 \cb1 \uc0\u8232 \cb2 JOIN stock ON meals.meal_id = stock.meal_id\'a0 \cb1 \uc0\u8232 \cb2 GROUP BY meals.meal_id\'a0 \cb1 \uc0\u8232 \cb2 ORDER BY meals.cost DESC\'a0 \cb1 \uc0\u8232 \cb2 LIMIT 3;\
\
\'97Using Common Table Expression
\f1\fs24 \
\

\f0\fs32 WITH costs_and_quantities AS (\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0SELECT\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0\'a0\'a0meals.meal_id,\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0\'a0\'a0SUM(stocked_quantity) AS quantity,\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0\'a0\'a0SUM(meal_cost * stocked_quantity) AS cost\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0FROM meals\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0JOIN stock ON meals.meal_id = stock.meal_id\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0GROUP BY meals.meal_id\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 )\'a0\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 SELECT\'a0\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0meal_id,\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0quantity,\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0cost\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 FROM costs_and_quantities\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 ORDER BY cost DESC\'a0\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 LIMIT 3;\'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'a0
\f1\fs24 \cb1 \

\f0\fs32 \cb2 \'97Bringing Revenue and Cost Together\
\
WITH revenue AS (\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0SELECT\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0\'a0\'a0meals.meal_id,\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0\'a0\'a0SUM(meal_price * order_quantity) AS revenue\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0FROM meals\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0JOIN orders ON meals.meal_id = orders.meal_id\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0GROUP BY meals.meal_id\'a0
\f1\fs24 \

\f0\fs32 ),\'a0\'a0\'a0
\f1\fs24 \

\f0\fs32 cost AS (\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0SELECT\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0\'a0\'a0meals.meal_id,\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0\'a0\'a0SUM(meal_cost * stocked_quantity) AS cost\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0FROM meals\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0JOIN stock ON meals.meal_id = stock.meal_id\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0GROUP BY meals.meal_id\'a0
\f1\fs24 \

\f0\fs32 )
\f1\fs24 \

\f0\fs32 SELECT\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0revenue.meal_id,\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0revenue,\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0cost,\'a0\'a0
\f1\fs24 \

\f0\fs32 \'a0\'a0revenue - cost AS profit\'a0\'a0
\f1\fs24 \

\f0\fs32 FROM revenue\'a0\'a0
\f1\fs24 \

\f0\fs32 JOIN cost ON revenue.meal_id = cost.meal_id\'a0\'a0
\f1\fs24 \

\f0\fs32 ORDER BY profit DESC\'a0\'a0
\f1\fs24 \

\f0\fs32 LIMIT 3;\'a0
\f1\fs24 \
\cb1 \
\cb2 \

\f0\fs32 \'a0\'97PART 2\
\
\'97Registration Setup\
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf0 \cb1 SELECT\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0user_id,\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0MIN(order_date) AS reg_date\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 FROM orders\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 GROUP BY user_id\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 ORDER BY user_id\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 LIMIT 3; 
\f1\fs24 \
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf0 \cb2 \
\'97Registration Query\
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf0 \cb1 WITH reg_dates AS (\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0SELECT\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0\'a0\'a0user_id,\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0\'a0\'a0MIN(order_date) AS reg_date\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0FROM orders\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0GROUP BY user_id)\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 SELECT\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0DATE_TRUNC('month', reg_date) :: DATE AS foodr_month,\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0COUNT(DISTINCT user_id) AS regs\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 FROM reg_dates\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 GROUP BY foodr_month\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 ORDER BY foodr_month ASC\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 LIMIT 3;\
\
\'97Active User Query\
SELECT\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0DATE_TRUNC('month', order_date) :: DATE AS foodr_month,\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 \'a0\'a0COUNT(DISTINCT user_id) AS mau\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 FROM orders\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 GROUP BY foodr_month\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 ORDER BY foodr_month ASC\'a0
\f1\fs24 \

\f2\fs29\fsmilli14667 LIMIT 3;
\f1\fs24 \
\
\

\f2\fs29\fsmilli14667 \'97Registrations Running Total\
WITH reg_dates AS (\
SELECT user_id, MIN(order_date) AS reg_date\
FROM orders\
GROUP BY user_id), registrations AS (\
SELECT DATE_TRUNC('month', reg_date) :: DATE AS foodr_month,\
COUNT(DISTINCT user_id) AS regs\
FROM reg_dates\
GROUP BY foodr_month)\
SELECT foodr_month, regs,\
SUM(regs) OVER (ORDER BY foodr_month ASC) AS regs_rt\
FROM registrations\
ORDER BY foodr_month ASC\
LIMIT 3;\
\
--Lagged MAU-query\
WITH maus AS(\
SELECT \
DATE_TRUNC('month', order_date):: DATE AS foodr_month,\
COUNT(DISTINCT user_id) AS mau\
FROM orders\
GROUP BY foodr_month)\
SELECT\
foodr_month,\
mau,\
COALESCE(\
LAG(mau) OVER (ORDER BY foodr_month ASC),\
1) AS last_mau\
FROM maus\
ORDER BY foodr_month ASC\
LIMIT 3;\
\
---Deltas - query\
WITH maus AS (SELECT DATE_TRUNC('month', order_date) :: DATE AS foodr_month,\
COUNT(DISTINCT user_id) AS mau \
FROM orders\
GROUP BY foodr_month),\
maus_lag AS ( \
SELECT foodr_month, mau, \
COALESCE(LAG(mau) OVER (ORDER BY foodr_month ASC), \
1) AS last_mau\
FROM maus)\
SELECT foodr_month, mau, mau - last_mau AS mau_delta \
FROM maus_lag\
ORDER BY foodr_month\
LIMIT 3;\
\
\
---Growth rate - query\
WITH maus AS (\
SELECT DATE_TRUNC('month', order_date) :: DATE AS foodr_month,\
COUNT(DISTINCT user_id) AS mau\
FROM orders\
GROUP BY foodr_month),\
maus_lag AS (\
SELECT foodr_month, mau,\
COALESCE(\
LAG(mau) OVER (ORDER BY foodr_month ASC),\
1) AS last_mau\
FROM maus)\
SELECT foodr_month, mau,\
ROUND(\
(mau - last_mau) :: NUMERIC / last_mau,\
2) AS growth\
FROM maus_lag\
ORDER BY foodr_month\
LIMIT 3;\
\
---Retention rate - query\
WITH user_activity AS ( \
SELECT DISTINCT DATE_TRUNC('month', order_date) :: DATE AS foodr_month, user_id \
FROM orders)\
SELECT previous.foodr_month,\
ROUND(\
COUNT(DISTINCT current.user_id) :: NUMERIC / \
GREATEST(COUNT(DISTINCT previous.user_id), 1), \
  2) AS retention\
FROM user_activity AS previous\
LEFT JOIN user_activity AS current\
ON previous.user_id = current.user_id\
AND previous.foodr_month = (current.foodr_month - INTERVAL '1 month')\
GROUP BY previous.foodr_month\
ORDER BY previous.foodr_month ASC\
LIMIT 3;\
\
\'97User Engagement\
\
---Create a table to store user activity by month\
DROP TABLE IF EXISTS USER_ACTIVITY;\
CREATE TABLE USER_ACTIVITY AS\
SELECT DISTINCT DATE_TRUNC('month', ORDER_DATE)::DATE AS DELIVR_MONTH,\
    USER_ID\
FROM ORDERS;\
\
SELECT *\
FROM USER_ACTIVITY\
\
\
\
---Create a table for previous month\'92s user activity\
CREATE TABLE USER_ACTIVITY_PREVIOUS AS\
SELECT DELIVR_MONTH, USER_ID\
FROM USER_ACTIVITY_PREVIOUS;\
\
\
\
---Create a table for current month\'92s user activity\
DROP TABLE IF EXISTS USER_ACTIVITY_CURRENT;\
CREATE TABLE USER_ACTIVITY_CURRENT AS\
SELECT DELIVR_MONTH, USER_ID\
FROM USER_ACTIVITY;\
\
---DROP TABLE IF EXISTS USER_ACTIVITY_CURRENT\
SELECT *\
FROM USER_ACTIVITY_CURRENT;\
\
\pard\pardeftab720\partightenfactor0

\f1\fs24 \cf0 \
--Self Joining\
SELECT *\
FROM USER_ACTIVITY_PREVIOUS AS PREVIOUS\
LEFT JOIN USER_ACTIVITY_CURRENT AS CURRENT\
ON PREVIOUS.USER_ID = CURRENT.USER_ID\
AND PREVIOUS.DELIVR_MONTH = (CURRENT.DELIVR_MONTH - INTERVAL '1 month')\
ORDER BY PREVIOUS.DELIVR_MONTH ASC\
LIMIT 3;\

\f0\fs32 \cb2 \
\

\f1\fs24 \
\cb1 \
\
\
}