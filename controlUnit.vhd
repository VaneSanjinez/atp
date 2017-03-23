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
		enable_PC : out STD_LOGIC_VECTOR(1 downto 0);
		--enables for RA and RB
		enable_RA : out STD_LOGIC_VECTOR(1 downto 0);
		enable_RB : out STD_LOGIC_VECTOR(1 downto 0);
		--opcode in
		instruction : in STD_LOGIC_VECTOR(23 downto 0);
		--control for memory involved
		selfControl : out STD_LOGIC_VECTOR(3 downto 0);
		firstOperand :  out STD_LOGIC_VECTOR(7 downto 0);
		secondOperand :  out STD_LOGIC_VECTOR(7 downto 0)
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
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outFetch : STD_LOGIC_VECTOR (17 downto 0);
begin
	case state is
		when 1 =>
			enPC := "01";--agarrar
		when 2 => 
			enPC := "10";--sacar
		when 3 =>
			enMAR := "01";
		when 4 =>
			enMAR := "10";
		when 5 => 
			enRAM := "10";
		when 6 =>
			enMBR := "01";
		when 7 =>
			enMBR := "10";
		when 8 =>
			enIR := "01";
		when 9 =>
			enIR := "10";
		when others =>
	end case;
	outFetch := selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outFetch;
end fetch;

--Instructions 
--MOVE reg, reg (RA, RB) from RB to RA
function moveRegReg (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (17 downto 0);
begin
	case state is
		when 1 =>
			enRB := "10"; --sacar
		when 2 => 
			enRA := "01";--agarra
		when others =>
	end case;
	outDecode := selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveRegReg;
--
--MOVE reg, reg (RB, RA)
function moveRegRegBA (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (17 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10"; --sacar
		when 2 => 
			enRB := "01";--agarra
		when others =>
	end case;
	outDecode := selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveRegRegBA;
--MOVE addr, reg from reg to addr
function moveAddrReg (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (17 downto 0);
begin
	case state is
		when 1 =>
			selfControl := "0010"; --sacar
		when 2 => 
			enRA := "10";
		when 3 => 
			enRAM := "01";
		when 4 =>
			enRAM := "10";
		when others =>
	end case;
	outDecode := selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveAddrReg;
--



--INCTRUCTION CYCLE
type estado is (instAddr, instFetch, instDecoding, operandAddCalc, operandFetch, dataOp, opDataCalc, opStore);
signal estadoPresente, estadoSiguiente : estado;


begin

process (estadoPresente, clk)
variable counter: integer := 0;
variable counterDecode : integer := 0;
variable fetchOut : STD_LOGIC_VECTOR(17 downto 0);
variable decodeOut : STD_LOGIC_VECTOR(17 downto 0);
variable instructionOpcode : STD_LOGIC_VECTOR(4 downto 0);

begin

if (clk'event and clk='1') then
case estadoPresente is
	when instAddr=>
		estadoSiguiente <= instFetch;
		counter := 0;
	when instFetch =>
		counter := counter + 1;
		if counter > 0 and counter < 10 then
			fetchOut := fetch(counter);
			selfControl <= decodeOut(17 downto 14);
			enable_RA <= fetchOut(13 downto 12);
			enable_RB <= fetchOut(11 downto 10);
			enable_PC  <= fetchOut (9 downto 8);
			enable_MAR <= fetchOut (7 downto 6);
			enable_RAM <= fetchOut (5 downto 4);
			enable_MBR <= fetchOut (3 downto 2);
			enable_IR  <= fetchOut (1 downto 0);
		end if;
		if counter = 9 then
			instructionOpcode := instruction(23 downto 19);
			estadoSiguiente <= instDecoding;
			counterDecode := 0;
		end if;
		
	when instDecoding =>
		counterDecode:= counterDecode + 1;
		case instructionOpcode is
			when "00000" => --reg reg
				decodeOut := moveRegReg(counterDecode);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 2 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "00001" => --reg addr
				decodeOut := moveAddrReg(counterDecode);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 3 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "00010" => --reg reg (from B to A)
				decodeOut := moveRegRegBA(counterDecode);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 3 then
					estadoSiguiente <=  operandAddCalc;
				end if;
				
			when others =>
		end case;
		
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

