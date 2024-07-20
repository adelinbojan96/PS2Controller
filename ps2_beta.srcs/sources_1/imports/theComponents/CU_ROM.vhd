LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY CU_ROM IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    address        : IN  std_logic_vector(4 DOWNTO 0); -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
    content        : OUT std_logic_vector(3 DOWNTO 0)  -- output vector example
    );
END CU_ROM;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE TypeArchitecture OF CU_ROM IS

BEGIN
        -- 0000 is the idle state
        -- 0001 is the reading state
        -- 0010 is the valid and not e0 state
        -- 0011 is the wait2 state
        -- 0100 is the f0 state
        -- 0101 is the wait1 state
        -- 0110 is the isEnter state
        -- 0111 is the readAndIgnore state
        -- 1000 is the printing state
        -- 1001 is the clear7SD state
        -- the MSB is given by the MUX8TO1WHICHIS1BIT
        
	process (address)
		begin
		case address is
		when "00000" => content <= "0001";
		when "10000" => content <= "0000";
		when "00001" => content <= "0001";
		when "10001" => content <= "0010";
		when "00010" => content <= "0011";
		when "10010" => content <= "0100";
		when "00011" => content <= "0011";
		when "10011" => content <= "0000";
		when "00100" => content <= "0110";
		when "10100" => content <= "0111";
		when "10101" => content <= "0111";
		when "00110" => content <= "1000";
		when "10110" => content <= "1001";
		when "00111" => content <= "0111";
		--when "10111" => content <= "0011";
		--when "00111" => content <= "0111";
		when "10111" => content <= "0011";
		when "01000" => content <= "0011";
		when "11000" => content <= "0011";
		when "01001" => content <= "0011";
		when "11001" => content <= "0011";
		when others => content <= "0000";

		end case;
	end process;
END TypeArchitecture;
