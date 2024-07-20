LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY eo_verif_unit IS
  PORT (
  c		: IN std_logic_vector(10 downto 0);--code read from the keyboard
  valid 	: OUT std_logic
   );
END eo_verif_unit;


ARCHITECTURE TypeArchitecture OF eo_verif_unit IS
BEGIN
process(c)
begin
	if(c(8 downto 1) = x"E0") then
		valid <= '1';
	else
		valid <= '0';
	end if;
end process;
END TypeArchitecture;
