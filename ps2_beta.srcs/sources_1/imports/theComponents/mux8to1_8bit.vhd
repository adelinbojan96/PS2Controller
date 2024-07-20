LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux8to1_8bit IS
  PORT (
  	in0	: IN std_logic_vector(7 downto 0);
  	in1	: IN std_logic_vector(7 downto 0);
  	in2	: IN std_logic_vector(7 downto 0);
  	in3	: IN std_logic_vector(7 downto 0);
  	in4	: IN std_logic_vector(7 downto 0);
  	in5	: IN std_logic_vector(7 downto 0);
  	in6	: IN std_logic_vector(7 downto 0);
  	in7	: IN std_logic_vector(7 downto 0);
  	sel  : IN std_logic_vector(2 downto 0);

	y	: OUT std_logic_vector(7 downto 0)
    );
END mux8to1_8bit;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF mux8to1_8bit IS
BEGIN

process(sel,in0,in1,in2,in3,in4,in5,in6,in7)
begin
	case sel is
	when "000" =>
		y <= NOT in0;
	when "001" =>
		y <= NOT in1;
	when "010" =>
		y <= NOT in2;
	when "011" =>
		y <= NOT in3;
	when "100" =>
		y <= NOT in4;
	when "101" =>
		y <= NOT in5;
	when "110" =>
		y <= NOT in6;
	when "111" =>
		y <= NOT in7;
	when others =>
		y<= (others => '0');
	end case;
end process;

END TypeArchitecture;
