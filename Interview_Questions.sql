SELECT Extract(Day from post_date) AS DAY, count(post_text) As Total_Posts 
FROM facebook_posts
GROUP BY DAY
ORDER By DAY ASC;