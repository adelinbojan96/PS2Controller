LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY enter_verif_unit IS
  PORT (
  c		: IN std_logic_vector(10 downto 0);--code read from the keyboard
  valid 	: OUT std_logic
   );
END enter_verif_unit;


ARCHITECTURE TypeArchitecture OF enter_verif_unit IS
BEGIN
process(c)
begin
	if(c(8 downto 1) = x"5A") then
		valid <= '1';
	else
		valid <= '0';
	end if;
end process;
END TypeArchitecture;
