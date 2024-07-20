LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY modulo11_counter IS
  PORT (
    clk	: IN  std_logic;--clock signal
    reset : IN std_logic;
    tc	: OUT std_logic--terminal count
    );
END modulo11_counter;

ARCHITECTURE TypeArchitecture OF modulo11_counter IS

BEGIN

process(clk) is
variable count : natural range 0 to 11 := 0;--internal state of the counter

begin
	if(clk'event AND clk='0') then --detecting the falling edge
		if(reset = '1') then
			count := 0;
			tc <= '0';
		elsif(count = 11) then
			count := 0;
			tc <= '1';
		else 
			count := count + 1;
			tc <= '0';
		end if;
	end if;
end process;
END TypeArchitecture;
