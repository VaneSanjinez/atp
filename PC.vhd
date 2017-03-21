----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:14 03/20/2017 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);
end PC;

architecture Behavioral of PC is

begin

process (clk, enableWrite, enableRead, datain)
variable regs : STD_LOGIC_VECTOR (23 downto 0) := "000000000000000000000001";
begin
if clk = '1' and clk'EVENT then
	if enableWrite = '1' then  
		regs := std_logic_vector(unsigned(regs) + 1);
	elsif enableRead = '1' then
		dataout <= regs;
	end if;
end if;

dataout <= regs;
end process;



end Behavioral;

