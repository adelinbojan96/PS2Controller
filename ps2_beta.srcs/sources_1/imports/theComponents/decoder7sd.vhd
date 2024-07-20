-- Project :
-- File    :
-- Autor   :
-- Date    :
--
--------------------------------------------------------------------------------
-- Description :
--
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY decoder7sd IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    address      : IN  std_logic_vector (7 downto 0);                    -- input bit example
  ------------------------------------------------------------------------------
  --Insert output ports below
    content        : OUT std_logic_vector (7 DOWNTO 0)  -- output vector example
    );
END decoder7sd;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF decoder7sd IS
BEGIN

	process(address)
		begin
			case address is 
				when x"16" => content <= b"01100000"; --1
				when x"1E" => content <= b"11011010"; --2
				when x"26" => content <= b"11110010"; --3
				when x"25" => content <= b"01100110"; --4
				when x"2E" => content <= b"10110110"; --5
				when x"36" => content <= b"10111110"; --6
				when x"3D" => content <= b"11100000"; --7
				when x"3E" => content <= b"11111110"; --8
				when x"46" => content <= b"11110110"; --9
				when x"45" => content <= b"11111100"; --0
				when x"15" => content <= b"11111101"; --q
				when x"44" => content <= b"11111100"; --o
				when x"1D" => content <= b"01111110"; --w
				when x"24" => content <= b"10011110"; --e
				when x"2D" => content <= b"00001010"; --small r
				when x"2C" => content <= b"00011110"; --small t
				when x"35" => content <= b"01110110"; --small y
				when x"3C" => content <= b"01111100"; --U
				when x"43" => content <= b"00001100"; --I
				when x"4D" => content <= b"11001110"; --P
				when x"1C" => content <= b"11101110"; --A
				when x"1B" => content <= b"10110110"; --S
				when x"23" => content <= b"11111100"; --D
				when x"2B" => content <= b"10001110"; --F
				when x"34" => content <= b"10111100"; --G
				when x"33" => content <= b"01101110"; --H
				when x"3B" => content <= b"01111000"; --J
				when x"42" => content <= b"10101110"; --K 
				when x"4B" => content <= b"00011100"; --L
				when x"1A" => content <= b"00001100"; --Z
				when x"22" => content <= b"10010010"; --x
				when x"21" => content <= b"10011100"; --C
				when x"2A" => content <= b"01010100"; --V
				when x"32" => content <= b"11111110"; --B
				when x"31" => content <= b"00101010"; --small N
				when x"3A" => content <= b"11010100"; --M
				when x"41" => content <= b"00000001"; --,
				when x"49" => content <= b"00000001"; --.

				when others =>content<=  b"00000000"; 
		end case;
	end process;
END TypeArchitecture;