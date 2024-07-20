----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2023 05:45:58 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb is
end tb;

architecture Behavioral of tb is

component ps2 is
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
           ca : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal Serial_input :  STD_LOGIC;
signal Clk_int :  STD_LOGIC;
signal Clk_ps2 :  STD_LOGIC;
signal reset    : STD_LOGIC;
signal an0 : STD_LOGIC;
signal an1 : sTD_LOGIC;
signal an2 : sTD_LOGIC;
signal an3 : STD_LOGIC;
signal an4 : STD_LOGIC;
signal an5 : STD_LOGIC;
signal an6 : STD_LOGIC;
signal an7 : STD_LOGIC;
signal ca : STD_LOGIC_VECTOR (7 downto 0);

begin
--component initialization
interface : ps2
Port map ( Serial_input => Serial_input,
           Clk_int => Clk_int,
           Clk_ps2 => Clk_ps2 ,
           reset => reset,
           an0 => an0,
           an1 => an1,
           an2 => an2,
           an3 => an3,
           an4 => an4,
           an5 => an5,
           an6 => an6,
           an7 => an7,
           ca => ca);
           
clock: process
begin
    clk_int <= '0';
    wait for 10 ns;
    clk_int <= '1';
    wait for 10 ns;
end process clock;


stimuli: process
begin
    
    --start bit
    serial_input<='0';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500ns;
    
    
    --data bits
    --1
    serial_input<='1';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    
    --2
    serial_input<='0';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    --3
    serial_input<='1';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    --4
    serial_input<='1';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    
    --5
    serial_input<='1';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    
    --6
    serial_input<='0';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    
    --7
    serial_input<='0';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    --8
    serial_input<='0';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    --parity bit
    serial_input<='1';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;

    --stop bit
    serial_input<='1';
    clk_ps2 <= '1';
    wait for 500 ns;
    clk_ps2 <= '0';
    wait for 500 ns;
    
    --timeout between keypresses
    wait for 1000ns;

end process stimuli;

end Behavioral;