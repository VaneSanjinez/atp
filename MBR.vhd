----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:58 03/20/2017 
-- Design Name: 
-- Module Name:    MBR - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MBR is
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);
end MBR;

architecture Behavioral of MBR is

begin

process (clk, enableWrite, enableRead, datain)
variable regs : STD_LOGIC_VECTOR (23 downto 0);
begin
if clk = '1' and clk'EVENT then
	if enableWrite = '1' then   
			--regs :=	datain;
			dataout <= regs;
		elsif enableRead = '1' then 
			regs :=	datain;
			--dataout <= regs;
	end if;
end if;
dataout <= regs;
end process;

end Behavioral;

