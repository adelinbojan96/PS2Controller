LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY shift_register_11bit IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clk      : IN  std_logic; --clk signal, synchronized to the ps2 clock               
    sin      : IN  std_logic; --serial input
    reset	   : IN 	std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
    q	   :	OUT std_logic_vector(10 downto 0); --output of the register
    q8	   : OUT std_logic_vector(8 downto 1)
    );
END shift_register_11bit;

ARCHITECTURE TypeArchitecture OF shift_register_11bit IS

BEGIN

process(clk) is
variable reg : std_logic_vector(10 downto 0) := (others=>'0'); --variable to store the internal state of the register
begin
	if(clk'event AND clk='0') then --detecting fallin edge
		if(reset = '1') then
			reg := (others => '0');	
		else
			reg := sin & reg(10 downto 1);
		end if;
	end if;
	q <= reg;
	q8 <= reg(8 downto 1);
end process;	

END TypeArchitecture;
