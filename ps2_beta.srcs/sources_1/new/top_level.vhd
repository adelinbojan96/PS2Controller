library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TheBigSource is
    Port ( Serial_input : in STD_LOGIC;
           Clk_int : in STD_LOGIC;
           Clk_ps2 : in STD_LOGIC;
           reset    :in STD_LOGIC;
           an0 : out STD_LOGIC;
           an1 : out STD_LOGIC;
           an2 : out STD_LOGIC;
           an3 : out STD_LOGIC;
           an4 : out STD_LOGIC;
           an5 : out STD_LOGIC;
           an6 : out STD_LOGIC;
           an7 : out STD_LOGIC;
           ca : out STD_LOGIC_VECTOR (7 downto 0);
           
           --debugging purpose
           state_out : out std_logic_vector(3 downto 0);
           shift_out : out std_logic_vector(10 downto 0);
           decoder_out: out std_logic_vector(7 downto 0)
           );
end TheBigSource;

architecture Behavioral of TheBigSource is
component clk_sync IS
  PORT (
  sys_clk : IN std_logic;
  ps2_clk : IN	std_logic;

  synced  : OUT std_logic
  );
END component clk_sync;
component counter3bit IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    enable      : IN std_logic;
  ------------------------------------------------------------------------------
  --Insert output ports below
  	value	   : OUT std_logic_vector (2 downto 0)
    );
END component counter3bit;

component counter16bit IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
  ------------------------------------------------------------------------------
  --Insert output ports below
    tCount        : OUT std_logic                    -- output bit example
    );
END component counter16bit;
component shift_register_11bit IS
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
END component shift_register_11bit;
component CU_Outputs IS
  PORT (
	state 	: IN std_logic_vector(2 downto 0);
	en_shift 	: OUT std_logic;
	clear	: OUT std_logic
  );
END component CU_Outputs;
component CU_ROM IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    address        : IN  std_logic_vector(3 DOWNTO 0); -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
    content        : OUT std_logic_vector(2 DOWNTO 0)  -- output vector example
    );
END component CU_ROM;
component decoder7sd IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    address      : IN  std_logic_vector (7 downto 0);                    -- input bit example
  ------------------------------------------------------------------------------
  --Insert output ports below
    content        : OUT std_logic_vector (7 DOWNTO 0)  -- output vector example
    );
END component decoder7sd;

component display_buffer IS
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
END component display_buffer;
component dmux8to1 IS
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
END component dmux8to1;

component enter_verif_unit IS
  PORT (
  c		: IN std_logic_vector(10 downto 0);--code read from the keyboard
  valid 	: OUT std_logic
   );
END component enter_verif_unit;
component modulo11_counter IS
  PORT (
    clk	: IN  std_logic;--clock signal
    reset : IN std_logic;
    tc	: OUT std_logic--terminal count
    );
END component modulo11_counter;
component MUX8TO1WHICHIS1BIT IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    val        : IN  std_logic_vector(7 DOWNTO 0); -- input vector example
    sel 		: IN  std_logic_vector(2 downto 0); -- selection bit
  ------------------------------------------------------------------------------
  --Insert output ports below
    output        : OUT std_logic                -- output bit example
    );
END component MUX8TO1WHICHIS1BIT;
component validation_unit IS
  PORT (
  c		: IN std_logic_vector(10 downto 0);--code read from the keyboard
  valid 	: OUT std_logic
   );
END component validation_unit;
component mux8to1_8bit IS
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
END component mux8to1_8bit;
component eo_verif_unit IS
  PORT (
  c		: IN std_logic_vector(10 downto 0);--code read from the keyboard
  valid 	: OUT std_logic
   );
END component eo_verif_unit;
component fo_verif_unit IS
  PORT (
  c		: IN std_logic_vector(10 downto 0);--code read from the keyboard
  valid 	: OUT std_logic
   );
END component fo_verif_unit;
component d_flip_flop0 IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    d        	: IN  std_logic; -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
    q        : OUT std_logic
    );
END component d_flip_flop0;
component d_flip_flop1 IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    d        	: IN  std_logic; -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
    q        : OUT std_logic
    );
END component d_flip_flop1;
component d_flip_flop2 IS
  PORT (
  ------------------------------------------------------------------------------
  --Insert input ports below
    clock      : IN  std_logic;                    -- input bit example
    d        	: IN  std_logic; -- input vector example
  ------------------------------------------------------------------------------
  --Insert output ports below
    q        : OUT std_logic
    );
END component d_flip_flop2;
signal tCount, en_shift,clear, outMUX8TO1WHICHIS1BIT,tc, sync_clk, valid_validationUnit, valid_eo_verification, valid_fo_verification,valid_enter: std_logic;
signal shiftreg_output_11bits: std_logic_vector(10 downto 0);
signal shiftreg_output_8bits: std_logic_vector(8 downto 1);
signal mux8TO1WHICHIS1BIT_values, outputDecoder,p7,p6,p5,p4,p3,p2,p1,p0: std_logic_vector(7 downto 0);
signal c,q, counter3bitsValue: std_logic_vector(2 downto 0);
signal address: std_logic_vector(3 downto 0);
signal constant_0: std_logic;
begin
--debug
state_out <= outMux8to1whichis1bit & q(2 downto 0);
shift_out <= shiftreg_output_11bits;
decoder_out <= outputDecoder;

synchroniser: clk_sync port map(Clk_int, Clk_ps2,sync_clk);
serialReader: shift_register_11bit port map(sync_clk, Serial_input, reset, shiftreg_output_11bits, shiftreg_output_8bits);
validationUnit: validation_unit port map(shiftreg_output_11bits, valid_validationUnit);
e0_verification: eo_verif_unit port map(shiftreg_output_11bits, valid_eo_verification);
f0_verification: fo_verif_unit port map(shiftreg_output_11bits, valid_fo_verification);
enter_verification: enter_verif_unit port map(shiftreg_output_11bits, valid_enter);
CU_counter: modulo11_counter port map(sync_clk, reset, tc);
address <= outMUX8TO1WHICHIS1BIT & q(2) & q(1) & q(0);
CU_MEMORY: CU_ROM port map(address, c);
D_flipflop0: d_flip_flop0 port map(Clk_int, c(0), q(0));
D_flipflop1: d_flip_flop1 port map(Clk_int, c(1), q(1));
D_flipflop2: d_flip_flop2 port map(Clk_int, c(2), q(2));
mux8TO1WHICHIS1BIT_values <= '0' & '0' & valid_enter & tc & valid_fo_verification & (valid_validationUnit and (not valid_eo_verification)) & tc & sync_clk;
CU_MUX: MUX8TO1WHICHIS1BIT port map(mux8TO1WHICHIS1BIT_values, q, outMUX8TO1WHICHIS1BIT);
MEMORY_FOR_DECODER: decoder7sd port map(shiftreg_output_8bits, outputDecoder);
OutputsOfMemory : CU_Outputs port map(q, en_shift, clear);
displayingBUFFER: display_buffer port map(outputDecoder, en_shift, Clk_int, clear, p7, p6, p5, p4, p3 ,p2 ,p1 ,p0);
FrequencyDivider: counter16bit port map(Clk_int, tCount);
counterOn3bits: counter3bit port map(Clk_int, tCount, counter3bitsValue);
Mux8to1bitWhichIs8bits: mux8to1_8bit port map( p0, p1, p2, p3, p4 , p5 , p6, p7, counter3bitsValue, ca);
constant_0 <= '0';
Dmux8to1bitWhichis1bit: dmux8to1 port map(constant_0, counter3bitsValue, an0, an1, an2, an3, an4, an5, an6, an7);

end Behavioral;