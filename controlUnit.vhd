----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:21:23 03/20/2017 
-- Design Name: 
-- Module Name:    controlUnit - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity controlUnit is
Port (clk : in STD_LOGIC;
		--enables
		enable_MBR : out STD_LOGIC_VECTOR(1 downto 0);
		enable_MAR : out STD_LOGIC_VECTOR(1 downto 0);
		enable_RAM : out STD_LOGIC_VECTOR(1 downto 0);
		enable_IR : out STD_LOGIC_VECTOR(1 downto 0);
		enable_PC : out STD_LOGIC_VECTOR(1 downto 0)
		);
end controlUnit;

architecture Behavioral of controlUnit is
--function fetch
function fetch (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable outFetch : STD_LOGIC_VECTOR (9 downto 0);
begin
	case state is
		when 1 =>
			enPC := "01";--read
		when 2 => 
			enPC := "10";--write
		when 3 =>
			enMAR := "01";
		when 4 =>
			enMAR := "10";
		when 5 => 
			enRAM := "01";
		when 6 =>
			enRAM := "10";
		when 7 =>
			enMBR := "01";
		when 8 =>
			enMBR := "10";
		when 9 =>
			enIR := "01";
		when 10 =>
			enIR := "10";
		when others =>
	end case;
	outFetch := enPC & enMAR & enRAM & enMBR & enIR;
	return outFetch;
end fetch;

--INCTRUCTION CYCLE
type estado is (instAddr, instFetch, instDecoding, operandAddCalc, operandFetch, dataOp, opDataCalc, opStore);
signal estadoPresente, estadoSiguiente : estado;


begin

process (estadoPresente, clk)
variable counter: integer := 0;
variable fetchOut : STD_LOGIC_VECTOR(9 downto 0);
begin
if (clk'event and clk='1') then
case estadoPresente is
	when instAddr=>
		estadoSiguiente <= instFetch;
	when instFetch =>
		counter := counter + 1;
		if counter > 0 and counter < 11 then
			fetchOut := fetch(counter);
			enable_PC  <= fetchOut (9 downto 8);
			enable_MAR <= fetchOut (7 downto 6);
			enable_RAM <= fetchOut (5 downto 4);
			enable_MBR <= fetchOut (3 downto 2);
			enable_IR  <= fetchOut (1 downto 0);
		end if;
		if counter = 10 then
			estadoSiguiente <= instDecoding;
		end if;
	when instDecoding =>
	--veo cada opcode
		estadoSiguiente <=  operandAddCalc;
	when  operandAddCalc => 
		estadoSiguiente <= operandFetch;
	when operandFetch =>
		estadoSiguiente <= dataOp;
	when dataOp => 
		estadoSiguiente <= opDataCalc;
	when opDataCalc =>
		estadoSiguiente <= opStore;
	when opStore =>
		estadoSiguiente <= instAddr;
end case;
	estadoPresente <= estadoSiguiente; -- cycle
end if;
end process;


end Behavioral;

