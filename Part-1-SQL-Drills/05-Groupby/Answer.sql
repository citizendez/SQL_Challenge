
/*DRILL 5 GROUPBY
-The below are a pandas data frame preview and a query for the total duration 
(in seconds) of UFO sightings by state, respectively.
-What is an equivalent SQL query? Instead of the sum, find the mean duration by state.*/


--ANSWER: if i had access to the database this is the query I would have run to run an equivialant SQL query 
--fo find the mean duration by state.
SELECT 
	state,
	AVG(duration)
FROM ufo_by_state
GROUP BY state;