LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ps2_simulator_bench IS
  PORT (
  
    max        : OUT std_logic;                    -- output bit example
    cpt        : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END ps2_simulator_bench;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF ps2_simulator_bench IS

BEGIN
process 
begin

	for i in 1 to 10 loop
		max<='0';
		wait for 10 ns;
		max<='1';
		wait for 10 ns;
	end loop;

wait;
end process;
END TypeArchitecture;
