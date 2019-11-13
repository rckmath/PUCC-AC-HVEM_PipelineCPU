LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY PIPELINEREGIDEX IS
	PORT (
		-- Portas de entrada
		CLOCK : 			IN STD_LOGIC;
		IN_WB : 			IN STD_LOGIC_VECTOR(0 TO 1);
		IN_ME : 			IN STD_LOGIC_VECTOR(0 TO 2);
		IN_EX : 			IN STD_LOGIC_VECTOR(0 TO 3);
		IN_PC : 			IN STD_LOGIC_VECTOR(0 TO 31);
		IN_READ1 : 			IN STD_LOGIC_VECTOR(0 TO 31);
		IN_READ2 : 			IN STD_LOGIC_VECTOR(0 TO 31);
		IN_IMED : 			IN STD_LOGIC_VECTOR(0 TO 31);
		IN_RT : 			IN STD_LOGIC_VECTOR(0 TO 4);
		IN_RD : 			IN STD_LOGIC_VECTOR(0 TO 4);

		-- Portas de saída
		OUT_WB : 			OUT STD_LOGIC_VECTOR(0 TO 1) := "00";
		OUT_ME : 			OUT STD_LOGIC_VECTOR(0 TO 2) := "000";
		OUT_EX : 			OUT STD_LOGIC_VECTOR(0 TO 3) := "0000";
		OUT_PC : 			OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		OUT_READ1 : 		OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		OUT_READ2 : 		OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		OUT_IMED : 			OUT STD_LOGIC_VECTOR(0 TO 31) := "00000000000000000000000000000000";
		OUT_RT : 			OUT STD_LOGIC_VECTOR(0 TO 4) := "00000";
		OUT_RD : 			OUT STD_LOGIC_VECTOR(0 TO 4) := "00000");
END PIPELINEREGIDEX;

ARCHITECTURE A OF PIPELINEREGIDEX IS

BEGIN
	PROCESS (CLOCK)
	BEGIN
		IF (CLOCK'EVENT AND CLOCK = '1') THEN
			OUT_WB <= IN_WB;
			OUT_ME <= IN_ME;
			OUT_EX <= IN_EX;
			OUT_PC <= IN_PC;
			OUT_READ1 <= IN_READ1;
			OUT_READ2 <= IN_READ2;
			OUT_IMED <= IN_IMED;
			OUT_RT <= IN_RT;
			OUT_RD <= IN_RD;
		END IF;
	END PROCESS;
END;