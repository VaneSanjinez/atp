----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:54 03/20/2017 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
Port (clk : in  STD_LOGIC;
			  --reset: in STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  addr : in STD_LOGIC_VECTOR(7 downto 0);
			  readRAM : in STD_LOGIC;
			  writeRAM : in STD_LOGIC);

end RAM;

architecture Behavioral of RAM is

type matrix is array (255 downto 0) of STD_LOGIC_VECTOR(23 downto 0);


begin
process (clk, readRAM, writeRAM, datain, addr)

variable memory : matrix := (others => (others => '0'));

begin
if clk = '1' and clk'Event then
--memory(2) := "000001111010101010101010"; -- move RA, RB from RB to RA
--memory(2) := "000011111010101010101010"; -- move reg, Addr from addr to reg

--memory(2) := "001000000000001000000011"; -- move reg, Addr from addr to reg
--memory(2) := "001010000000001000000011"; -- move reg ctt
memory(2) := "001100000000001000000011";-- move regB ctte 00110
--	if reset = '1' then
--			memory <= (others => (others => '0'));
--	end if;
--	
	if readRAM = '1' then
		dataout <= memory(conv_integer(addr));
	end if;
	if writeRAM = '1' then
		memory(conv_integer(addr)) := datain;
	end if;

end if;
dataout <= memory(conv_integer(addr));
end process;

end Behavioral;

