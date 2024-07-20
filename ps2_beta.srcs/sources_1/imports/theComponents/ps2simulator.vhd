LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ps2_simulator IS
  PORT (
	sys_clk : IN std_logic;
	ps2_ser : OUT std_logic;
	ps2_clk : OUT std_logic
    );
END ps2_simulator;


ARCHITECTURE TypeArchitecture OF ps2_simulator IS

signal continue : natural := 1;
BEGIN

ser: process(sys_clk)
variable code : std_logic_vector(10 downto 0) := "10000101100";
variable i : natural := 0;
begin
	if sys_clk'event and sys_clk='1' and i<11 then 
		ps2_ser <= code(i mod 11);
		i := i+1;
		if i = 10 then 
			continue <= 0;
		end if;
	end if;
end process ser;

clk: process(sys_clk)
begin
	if continue = 1 then
		ps2_clk <= sys_clk;
	end if;
end process clk;


END TypeArchitecture;
