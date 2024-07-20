LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY validation_unit IS
  PORT (
  c		: IN std_logic_vector(10 downto 0);--code read from the keyboard
  valid 	: OUT std_logic
   );
END validation_unit;


ARCHITECTURE TypeArchitecture OF validation_unit IS
BEGIN
process(c)
variable parity : std_logic := '0';--here we store the parity of the 8 data bits
begin

	--calculate the parity of the data bits
	--for i in 1 to 9 loop--data bits are on position 1 to 8 of the code and pairty bit on 9
		parity := c(1) xor c(2) xor c(3) xor c(4) xor c(5) xor c(6) xor c(7) xor c(8) xor c(9);
	--end loop;
	--coditions for checking if the signal is valid
	if(c(0) = '0' AND C(10)='1' AND parity='1') then
		valid <= '1';
	else 
		valid <= '0';
	end if;
end process;
END TypeArchitecture;

