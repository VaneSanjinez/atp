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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is

Port(	clk : in STD_LOGIC;
		enableALU: in STD_LOGIC;
		operandOne: in STD_LOGIC_VECTOR(7 downto 0);
		operandTwo: in STD_LOGIC_VECTOR(7 downto 0);
		selfControl: in STD_LOGIC_VECTOR(3 downto 0);
		dataout: out STD_LOGIC_VECTOR(7 downto 0));
end ALU;

architecture Behavioral of ALU is

begin

process (clk, enableALU, operandOne, operandTwo, selfControl)
	variable A : STD_LOGIC_VECTOR (7 downto 0);
	variable B : STD_LOGIC_VECTOR (7 downto 0);
	variable C : STD_LOGIC_VECTOR (7 downto 0);
begin
--if enableAlu = '1' then
	if clk'event and clk = '1' then
	case selfControl is
		when "0001" => --variable asignation
			A := operandOne;
		when "0010" =>
			B := operandTwo; --variable asignation
		when "0011" => --add
			C := STD_LOGIC_VECTOR(UNSIGNED(A) + UNSIGNED(B)); --suma
		when "0100" =>
			C := A and B; -- and 
		when "0101" =>
			C := not A;
		when "0110" =>
			C := not B;
		when "0111" =>
			C := STD_LOGIC_VECTOR(UNSIGNED(A) - 1);
		when "1000" => --comparator
			if A = B then
				C := "00000001";
			else 
				C := "00000000";
			end if;
		when "1001" => 
			C := A or B;
		when others =>
	end case;
		if enableALU = '1' then
			dataout <= C;
		end if;
	end if;
dataout <= C;
--end if;
end process;


end Behavioral;

