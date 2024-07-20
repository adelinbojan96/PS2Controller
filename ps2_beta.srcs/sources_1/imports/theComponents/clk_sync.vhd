LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY clk_sync IS
  PORT (
  sys_clk : IN std_logic;
  ps2_clk : IN	std_logic;

  synced  : OUT std_logic
  );

END clk_sync;

ARCHITECTURE TypeArchitecture OF clk_sync IS

BEGIN
process(sys_clk) is
variable internal_state : std_logic_vector(7 downto 0) := (others => '0'); -- 8 bit shift register for sampling the ps2 clock signal
begin
	if(sys_clk'event AND sys_clk='0') then
		internal_state := ps2_clk & internal_state (7 downto 1);
	end if;
	if internal_state = "11111111" then
		synced <= '1';
	elsif internal_state = "00000000" then
		synced <= '0';
	end if;	
end process;

END TypeArchitecture;
