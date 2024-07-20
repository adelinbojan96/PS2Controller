LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dmux8to1 IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    val        : IN  std_logic;
    sel		: IN  std_logic_vector(2 downto 0);
  ------------------------------------------------------------------------------
  --Insert output ports below
    y0		: OUT std_logic;
    y1		: OUT std_logic;
    y2		: OUT std_logic;
    y3		: OUT std_logic;
    y4		: OUT std_logic;
    y5		: OUT std_logic;
    y6		: OUT std_logic;
    y7		: OUT std_logic
    );
END dmux8to1;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF dmux8to1 IS
	
BEGIN

process(val,sel)
begin
	y0<='1';
	y1<='1';
	y2<='1';
	y3<='1';
	y4<='1';
	y5<='1';
	y6<='1';
	y7<='1';
	case sel is
	when "000" =>
		y0 <= val;
	when "001" =>
		y1 <= val;
	when "010" =>
		y2 <= val;
	when "011" =>
		y3 <= val;
	when "100" =>
		y4 <= val;
	when "101" =>
		y5 <= val;
	when "110" =>
		y6 <= val;
	when "111" =>
		y7 <= val;
	when others =>
	y0<='1';
	y1<='1';
	y2<='1';
	y3<='1';
	y4<='1';
	y5<='1';
	y6<='1';
	y7<='1';
	end case;
end process;

END TypeArchitecture;
