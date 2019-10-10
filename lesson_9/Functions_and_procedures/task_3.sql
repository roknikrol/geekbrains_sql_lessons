CREATE PROCEDURE fibonacci2(val INT)
BEGIN
	DEClARE res INT DEFAULT 1;
	SET @z = val;
	IF (val  = 0) THEN SET val  = 0;
	ELSEIF (@z  = 1) THEN SET @z  = 1;
	ELSE 
		CALL fibonacci2(@z  - 1) INTO @x;
		CALL fibonacci2(@z  - 2) INTO @y;
		SET val = @x + @y;
	SELECT @z;
END