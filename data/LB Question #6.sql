--6. Find the player who had the most success stealing bases in 2016, where __success__ is measured as the percentage of stolen base attempts which are successful. (A stolen base attempt results either in a stolen base or 
--being caught stealing.) Consider only players who attempted _at least_ 20 stolen bases.
	

SELECT *
FROM teams 
WHERE yearid = 2016;

SELECT playerid, namefirst, namelast, sb,cs, sb+cs AS attempts, ROUND((sb::numeric/(sb+cs)::numeric), 4)*100 AS percent_of_success
FROM batting LEFT JOIN people USING (playerid)
WHERE yearid = 2016 AND sb+cs >= 20
ORDER BY percent_of_success DESC;

--------6 Chris Owings 21 sb, 2 cs for a 91.3%
