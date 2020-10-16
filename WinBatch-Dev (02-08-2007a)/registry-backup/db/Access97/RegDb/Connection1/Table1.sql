IF EXISTS (SELECT * FROM sysobjects WHERE type = 'U' AND name = 'tRegistry')
	BEGIN
		PRINT 'Dropping Table tRegistry'
		DROP  Table tRegistry
	END
GO

/******************************************************************************
**		File: 
**		Name: tRegistry
**		Desc: 
**
**		This template can be customized:
**              
**
**		Auth: Ray Horn
**		Date: 06-27-99
*******************************************************************************
**		Change History
*******************************************************************************
**		Date:		Author:				Description:
**		--------		--------				-------------------------------------------
**    
*******************************************************************************/

PRINT 'Creating Table tRegistry'
GO
CREATE TABLE tRegistry
(
   


)
GO

GRANT SELECT ON tRegistry TO PUBLIC

GO
