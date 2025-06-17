{\rtf1\ansi\ansicpg1252\cocoartf2821
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fmodern\fcharset0 CourierNewPSMT;\f1\froman\fcharset0 Times-Roman;\f2\fswiss\fcharset0 ArialMT;
}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf0 \cb2 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec3 \'97Calculating Revenuue\
\
SELECT\'a0 \cb1 \uc0\u8232 \cb2 \'a0 order_id,\'a0 \cb1 \uc0\u8232 \cb2 \'a0 SUM(meal_price * order_quantity) AS revenue\'a0 \cb1 \uc0\u8232 \cb2 FROM meals\'a0 \cb1 \uc0\u8232 \cb2 JOIN orders ON meals.meal_id = orders.meal_id\'a0 \cb1 \uc0\u8232 \cb2 GROUP BY order_id; \cb1 \uc0\u8232 \cb2 \'a0\cb1 \uc0\u8232 \cb2 --Calculating Cost\'a0\
SELECT\'a0 \cb1 \uc0\u8232 \cb2 \'a0 meals.meal_id, \'a0 \cb1 \uc0\u8232 \cb2 \'a0 SUM(meal_cost * stocked_quantity) AS cost \'a0 \cb1 \uc0\u8232 \cb2 FROM meals\'a0 \cb1 \uc0\u8232 \cb2 JOIN stock ON meals.meal_id = stock.meal_id\'a0 \cb1 \uc0\u8232 \cb2 GROUP BY meals.meal_id\'a0 \cb1 \uc0\u8232 \cb2 ORDER BY meals.cost DESC\'a0 \cb1 \uc0\u8232 \cb2 LIMIT 3;\
\
\'97Using Common Table Expression
\f1\fs24 \
\

\f0\fs32 WITH costs_and_quantities AS (\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0SELECT\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0\'a0\'a0meals.meal_id,\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0\'a0\'a0SUM(stocked_quantity) AS quantity,\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0\'a0\'a0SUM(meal_cost * stocked_quantity) AS cost\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0FROM meals\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0JOIN stock ON meals.meal_id = stock.meal_id\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0GROUP BY meals.meal_id\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 )\'a0\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 SELECT\'a0\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0meal_id,\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0quantity,\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0cost\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 FROM costs_and_quantities\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 ORDER BY cost DESC\'a0\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 LIMIT 3;\'a0
\f1\fs24 \cb1 \strokec3 \

\f0\fs32 \cb2 \strokec3 \'a0
\f1\fs24 \cb1 \strokec3 \
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf0 \cb2 \strokec3 \'97Bringing Revenue and Cost Together\
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
\cb1 \strokec3 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb2 \strokec3 \
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf0 \'a0\'97PART 2\
\
\'97Registration Setup\
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf0 \cb1 \strokec3 SELECT\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0user_id,\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0MIN(order_date) AS reg_date\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 FROM orders\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 GROUP BY user_id\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 ORDER BY user_id\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 LIMIT 3; 
\f1\fs24 \strokec3 \
\pard\pardeftab720\partightenfactor0

\f0\fs32 \cf0 \cb2 \strokec3 \
\'97Registration Query\
\pard\pardeftab720\partightenfactor0

\f2\fs29\fsmilli14667 \cf0 \cb1 \strokec3 WITH reg_dates AS (\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0SELECT\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0\'a0\'a0user_id,\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0\'a0\'a0MIN(order_date) AS reg_date\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0FROM orders\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0GROUP BY user_id)\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 SELECT\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0DATE_TRUNC('month', reg_date) :: DATE AS foodr_month,\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 \'a0\'a0COUNT(DISTINCT user_id) AS regs\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 FROM reg_dates\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 GROUP BY foodr_month\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 ORDER BY foodr_month ASC\'a0
\f1\fs24 \strokec3 \

\f2\fs29\fsmilli14667 \strokec3 LIMIT 3;\
\
\pard\pardeftab720\partightenfactor0

\f1\fs24 \cf0 \strokec3 \

\f0\fs32 \cb2 \strokec3 \
\
\pard\pardeftab720\partightenfactor0

\f1\fs24 \cf0 \
\pard\pardeftab720\partightenfactor0
\cf0 \cb1 \strokec3 \
\
\pard\pardeftab720\partightenfactor0
\cf0 \
}