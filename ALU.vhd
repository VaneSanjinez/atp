----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:37:53 03/22/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is

Port(	enableALU: in STD_LOGIC;
		operandOne: in STD_LOGIC_VECTOR(7 downto 0);
		operandTwo: in STD_LOGIC_VECTOR(7 downto 0);
		instructionOpcode: in STD_LOGIC_VECTOR(4 downto 0);
		dataout: out STD_LOGIC_VECTOR(7 downto 0));
end ALU;

end ALU;

architecture Behavioral of ALU is

begin


end Behavioral;

