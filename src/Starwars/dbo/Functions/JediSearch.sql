
CREATE FUNCTION [dbo].[JediSearch](
	@PhraseSearch varchar(250) = '',
	--Order & Paging
	@Order varchar(250),
	@PagingOffSet int = 0,			
	@PagingCount int = 10		
	
)

RETURNS TABLE
AS

RETURN

(
	WITH JediCTE
	AS 
	(
		SELECT
			JediId, 
			[Name],
			RowNumber = ROW_NUMBER() OVER (ORDER BY [Name]),
			TotalRows = COUNT_BIG(*) OVER()
		FROM dbo.Jedi J
		WHERE J.Name LIKE '%'+@PhraseSearch+'%'
	)
               
	SELECT 
		JediId, 
		[Name],
		RowNumber,
		TotalRows
	FROM JediCTE
	ORDER BY RowNumber 		
	OFFSET @PagingOffSet ROWS
	FETCH NEXT @PagingCount ROWS ONLY
)