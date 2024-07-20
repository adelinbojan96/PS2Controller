LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d_flip_flop1 IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    d        	: IN  std_logic; -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
    q        : OUT std_logic
    );
END d_flip_flop1;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF d_flip_flop1 IS

BEGIN

	process(clock) is
	variable internal_state : std_logic := '0';
	begin
		if(rising_edge(clock)) then
			internal_state := d;
		end if;
		q <= internal_state;
	end process;
END TypeArchitecture;