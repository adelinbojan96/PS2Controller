LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY display_buffer IS
  PORT (
    data_in	: IN std_logic_vector(7 downto 0);
    enable	: IN std_logic;
    clk		: IN std_logic;
    reset		: IN std_logic;

    data_out0	: OUT std_logic_vector(7 downto 0);
    data_out1	: OUT std_logic_vector(7 downto 0);
    data_out2	: OUT std_logic_vector(7 downto 0);
    data_out3	: OUT std_logic_vector(7 downto 0);
    data_out4	: OUT std_logic_vector(7 downto 0);
    data_out5	: OUT std_logic_vector(7 downto 0);
    data_out6	: OUT std_logic_vector(7 downto 0);
    data_out7	: OUT std_logic_vector(7 downto 0)
    );
END display_buffer;


ARCHITECTURE TypeArchitecture OF display_buffer IS

type t_Memory is array (7 downto 0) of std_logic_vector(7 downto 0);--type of data to store the contents of the shift register

BEGIN


process(clk) is
variable reg : t_Memory := (others => "00000000");
begin
	if(clk'event AND clk='0') then
		if(reset = '1') then
			reg := (others => "00000000");
		elsif(enable = '1') then
			reg := data_in & reg(7 downto 1);
		end if;
		data_out0 <= reg(0);
		data_out1 <= reg(1);
		data_out2 <= reg(2);
		data_out3 <= reg(3);
		data_out4 <= reg(4);
		data_out5 <= reg(5);
		data_out6 <= reg(6);
		data_out7 <= reg(7);
		 
	end if;
end process;

END TypeArchitecture;
