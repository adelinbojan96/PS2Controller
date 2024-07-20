LIBRARY ieee;
USE ieee.std_logic_1164.all;

USE IEEE.NUMERIC_STD.ALL;

ENTITY counter16bit IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
  ------------------------------------------------------------------------------
  --Insert output ports below
    tCount        : OUT std_logic                    -- output bit example
    );
END counter16bit;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF counter16bit IS

BEGIN


process(clock)
	variable internal_state : natural range 0 to 2**16-1 := 0;
	begin
	tCount <= '0';
	if(clock'event AND clock='1') then
		if(internal_state = 65535) then
			tCount <= '1';
			internal_state := 0;
		else
			tCount <= '0';
			internal_state := internal_state + 1;
		end if;
	end if;
end process;

END TypeArchitecture;
