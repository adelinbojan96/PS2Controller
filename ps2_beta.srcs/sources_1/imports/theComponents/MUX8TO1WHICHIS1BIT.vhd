
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY MUX8TO1WHICHIS1BIT IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    val        : IN  std_logic_vector(7 DOWNTO 0); -- input vector example
    sel 		: IN  std_logic_vector(2 downto 0); -- selection bit
  ------------------------------------------------------------------------------
  --Insert output ports below
    output        : OUT std_logic                -- output bit example
    );
END MUX8TO1WHICHIS1BIT;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF MUX8TO1WHICHIS1BIT IS

BEGIN

	process(val, sel)
		begin
			case sel is
			when "000" => output <= val(0);
			when "001" => output <= val(1);
			when "010" => output <= val(2);
			when "011" => output <= val(3);
			when "100" => output <= val(4);
			when "101" => output <= val(5);
			when "110" => output <= val(6);
			when "111" => output <= val(7);
			when others => output <= '0';
	end case;

	end process;
END TypeArchitecture;