LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY REGPIPE_MEMWB IS
    PORT (
    -- Portas de entrada
    CLOCK : IN STD_LOGIC;
    MEMWB_IN_WB : IN STD_LOGIC_VECTOR(0 TO 1);
    MEMWB_IN_RESULT_ULA : IN STD_LOGIC_VECTOR(0 TO 31);
    MEMWB_IN_REGDST : IN STD_LOGIC_VECTOR(0 TO 4);
    MEMWB_IN_READ_DATA : IN STD_LOGIC_VECTOR(0 TO 31);
    
    -- Portas de saída
    MEMWB_OUT_WB : OUT STD_LOGIC_VECTOR(0 TO 1);
    MEMWB_OUT_RESULT_ULA : OUT STD_LOGIC_VECTOR(0 TO 31);
    MEMWB_OUT_REGDST : OUT STD_LOGIC_VECTOR(0 TO 4);
    MEMWB_OUT_READ_DATA : OUT STD_LOGIC_VECTOR(0 TO 31));

END REGPIPE_MEMWB;

ARCHITECTURE A OF REGPIPE_MEMWB IS

BEGIN
    PROCESS (CLOCK)
    BEGIN
        IF (CLOCK'EVENT AND CLOCK = '1') THEN
            MEMWB_OUT_WB <= MEMWB_IN_WB;
                MEMWB_OUT_RESULT_ULA <= MEMWB_IN_RESULT_ULA;
                MEMWB_OUT_REGDST <= MEMWB_IN_REGDST;
                MEMWB_OUT_READ_DATA <= MEMWB_IN_READ_DATA;
            END IF;
        END PROCESS;
    END;