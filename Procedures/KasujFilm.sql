CREATE OR ALTER  PROCEDURE KasujFilm 
  @FilmID int
AS
BEGIN

	SET NOCOUNT ON

	-- walidacja
	IF NOT EXISTS(SELECT * FROM Film WHERE FilmID = @FilmID)
	BEGIN
	  RAISERROR('Niepoprawny FilmID', 11, 1)
	  RETURN
	END

	BEGIN TRY
		BEGIN TRAN
		DELETE FROM FilmAktor WHERE FilmID = @FilmID

		DELETE FROM Film WHERE FilmID = @FilmID
		COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK;
		THROW
	END CATCH

END
GO