LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CU_Outputs IS
  PORT (
	state 	: IN std_logic_vector(3 downto 0);
	en_shift 	: OUT std_logic;
	clear	: OUT std_logic;
	RESET : OUT STD_LOGIC
  );
END CU_Outputs;

ARCHITECTURE TypeArchitecture OF CU_Outputs IS

BEGIN


process(state) is
begin
    if state = "0011" then
        reset <= '1';
    elsif state = "0101" then
        reset <= '1';
    else
        reset <= '0';
    end if;
	if state = "1000" then 
		en_shift <= '1';
	else 
		en_shift <= '0';
	end if;
	if state = "1001" then
		clear <= '1';
	else 
		clear <= '0';
	end if;
end process;
END TypeArchitecture;