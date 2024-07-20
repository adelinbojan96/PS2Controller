LIBRARY ieee;
USE ieee.std_logic_1164.all;

USE IEEE.NUMERIC_STD.ALL;

ENTITY counter3bit IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    enable      : IN std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
  	value	   : OUT std_logic_vector (2 downto 0)
    );
END counter3bit;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF counter3bit IS

BEGIN


process(clock, enable)
	variable internal_state : natural range 0 to 7 := 0;
	begin
	if(clock'event AND clock='0' AND enable='1') then
		if(internal_state = 7) then
			internal_state := 0;
		else
			internal_state := internal_state + 1;
		end if;
	end if;
	value <= std_logic_vector(to_unsigned(internal_state,3));
end process;

END TypeArchitecture;
