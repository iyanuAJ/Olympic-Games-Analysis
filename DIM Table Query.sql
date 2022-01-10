-- Olymic_Games_Table --
SELECT 
	   [ID]
      ,[Name] AS 'Competitor Name' -- Renamed column
      ,CASE WHEN SEX = 'M' THEN 'Male' ELSE 'Female' END AS Sex --User friendly filter
      ,[Age]
	  ,CASE WHEN [Age] < 18 THEN 'Under 18'
			WHEN [Age] BETWEEN 18 AND 25 THEN '18-25'
			WHEN [Age] BETWEEN 25 AND 30 THEN '25-30'
			WHEN [Age] > 30 THEN 'Over 30'
		END AS [Age Grouping] -- Age Groups
      ,[Height]
	  ,[Weight]
      ,[NOC] AS 'Nation Code' --Changing abbreviation
      --,[Games]
      ,LEFT(Games, CHARINDEX(' ', Games) -1) AS 'Year'
	  -- ,RIGHT(Games, CHARINDEX(' ', REVERSE(Games)) -1) AS 'Season'
	  --,[City]
      ,[Sport]
      ,[Event]
		,CASE WHEN Medal = 'NA' THEN 'Not Registered' ELSE Medal END AS Medal --NA replaced with Not Registered
	FROM [olympic_games].[dbo].[athletes_event_results]
	WHERE RIGHT (Games, CHARINDEX(' ', REVERSE(Games)) -1) = 'Summer' -- To show only Summer Season