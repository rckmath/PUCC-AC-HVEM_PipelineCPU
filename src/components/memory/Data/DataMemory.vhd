LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY DataMemory IS
	PORT (

		ADDRESS : IN STD_LOGIC_VECTOR(0 TO 31);
		CLOCK : IN STD_LOGIC;
		MEM_WRITE : IN STD_LOGIC;
		WRITE_DATA : IN STD_LOGIC_VECTOR(0 TO 31);
		MEM_READ : IN STD_LOGIC;
		READ_DATA : OUT STD_LOGIC_VECTOR(0 TO 31));

END DataMemory;

ARCHITECTURE MEM OF DataMemory IS
	TYPE MEM_TYPE IS ARRAY(0 TO 400) OF STD_LOGIC_VECTOR(0 TO 7);
	SIGNAL MEMORY : MEM_TYPE;
BEGIN
	PROCESS (CLOCK)
	BEGIN
		IF (CLOCK'EVENT AND CLOCK = '1') THEN
			IF (MEM_WRITE = '1') THEN

				MEMORY(TO_INTEGER(UNSIGNED(ADDRESS))) <= WRITE_DATA(0 TO 7);
				MEMORY(TO_INTEGER(UNSIGNED(ADDRESS)) + 1) <= WRITE_DATA(8 TO 15);
				MEMORY(TO_INTEGER(UNSIGNED(ADDRESS)) + 2) <= WRITE_DATA(16 TO 23);
				MEMORY(TO_INTEGER(UNSIGNED(ADDRESS)) + 3) <= WRITE_DATA(24 TO 31);

			END IF;

			IF (MEM_READ = '1') THEN

			READ_DATA <= MEMORY(TO_INTEGER(UNSIGNED(ADDRESS))) &
					MEMORY(TO_INTEGER(UNSIGNED(ADDRESS)) + 1) &
					MEMORY(TO_INTEGER(UNSIGNED(ADDRESS)) + 2) &
					MEMORY(TO_INTEGER(UNSIGNED(ADDRESS)) + 3);

			ELSE

				READ_DATA <= "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

			END IF;
		END IF;
	END PROCESS;
END;