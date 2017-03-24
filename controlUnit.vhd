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
		secondOperand :  out STD_LOGIC_VECTOR(7 downto 0);
		enable_ALU : out STD_LOGIC;
		aluControl : out STD_LOGIC_VECTOR(3 downto 0)
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
	variable enALU : STD_LOGIC := '0';
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outFetch : STD_LOGIC_VECTOR (22 downto 0);
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
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
	outFetch := aluControl & enALU &  selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
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
	variable enALU : STD_LOGIC := '0';
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	case state is
		when 1 =>
			enRB := "10"; --sacar
		when 2 => 
			enRA := "01";--agarra
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveRegReg;
--
--MOVE reg, reg (RB, RA) move to RB the content of RA
function moveRegRegBA (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	case state is
		when 1 =>
			enRA := "10"; --sacar
		when 2 => 
			enRB := "01";--agarra
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveRegRegBA;
--MOVE addr ctte
function moveAddrCtt (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	case state is
		when 1 =>
			selfControl := "0001";
		when 2 => 
			selfControl := "1000";
		when 3 =>
			enRAM := "01"; --agarrar en RAM
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveAddrCtt;
--
--MOVE reg ctte (to regA)
function moveRegACtt (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	case state is
		when 1 =>
			selfControl := "0001";
		when 2 =>
			enRA := "01"; --agarrar en RA
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveRegACtt;
--
--MOVE regB, ctt (to regB)
function moveRegBCtt (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
begin
	case state is
		when 1 =>
			selfControl := "0001";
		when 2 =>
			enRB := "01"; --agarrar en RB
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveRegBCtt;

--MOVE addr, reg from reg to addr
function moveAddrReg (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
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
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end moveAddrReg;
--

--Instruction where ALU is involved!
-- Add regA and regB
function addAB (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRB := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "0011"; --add
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end addAB;
--
--
-- Add regA and RAM
function addAMem (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRAM := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "0011"; --add
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end addAMem;
-- AND reg reg
function andRegReg (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRB := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "0100"; --and
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end andRegReg;
--

-- AND reg reg
function andRegMem (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRAM := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "0100"; --and
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end andRegMem;
--
--
-- OR reg reg
function orRegReg (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRB := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "1001"; --or
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end orRegReg;

-- OR reg mem
function orRegMem (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRAM := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "1001"; --or
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end orRegMem;
--
--CMP reg reg
function cmpRegReg (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRB := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "1000"; --CMP
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end cmpRegReg;
--
--CMP reg mem
function cmpRegMem (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			enRAM := "10";
		when 4 =>
			aluControl := "0010"; -- save in B (ALU's variables)
		when 5 =>
			aluControl := "1000"; --CMP
		when 6 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end cmpRegMem;
--
--Not regA
function notA (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRA := "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			aluControl := "0101"; --Not regA
		when 4 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end notA;
--
--Not regB
function notB (state: integer) return STD_LOGIC_VECTOR is
	variable enPC : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMAR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enMBR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRAM : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enIR : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRA : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enRB : STD_LOGIC_VECTOR(1 downto 0) := "00";
	variable enALU : STD_LOGIC := '0';
	variable aluControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable selfControl : STD_LOGIC_VECTOR(3 downto 0) := "0000";
	variable outDecode : STD_LOGIC_VECTOR (22 downto 0);
begin
	case state is
		when 1 =>
			enRB:= "10";
		when 2 =>
			aluControl := "0001"; --save in A (ALU's variables)
		when 3 =>
			aluControl := "0101"; --Not regA
		when 4 =>
			enALU := '1';
		when others =>
	end case;
	outDecode := aluControl & enALU & selfControl & enRA & enRB & enPC & enMAR & enRAM & enMBR & enIR;
	return outDecode;
end notB;

--
--INCTRUCTION CYCLE
type estado is (instAddr, instFetch, instDecoding, operandAddCalc, operandFetch, dataOp, opDataCalc, opStore);
signal estadoPresente, estadoSiguiente : estado;


begin

process (estadoPresente, clk)
variable counter: integer := 0;
variable counterDecode : integer := 0;
variable fetchOut : STD_LOGIC_VECTOR(22 downto 0);
variable decodeOut : STD_LOGIC_VECTOR(22 downto 0);
variable instructionOpcode : STD_LOGIC_VECTOR(23 downto 0);

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
			aluControl <= fetchOut(22 downto 19);
			enable_ALU <= fetchOut(18);
			selfControl <= fetchOut(17 downto 14);
			enable_RA <= fetchOut(13 downto 12);
			enable_RB <= fetchOut(11 downto 10);
			enable_PC  <= fetchOut (9 downto 8);
			enable_MAR <= fetchOut (7 downto 6);
			enable_RAM <= fetchOut (5 downto 4);
			enable_MBR <= fetchOut (3 downto 2);
			enable_IR  <= fetchOut (1 downto 0);
		end if;
		if counter = 9 then
			instructionOpcode := instruction;
			estadoSiguiente <= instDecoding;
			counterDecode := 0;
		end if;
		
	when instDecoding =>
	
		counterDecode:= counterDecode + 1;
		case instructionOpcode(23 downto 19) is
			when "00000" => --reg reg
				decodeOut := moveRegReg(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
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
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
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
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
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
			when "00100" => --moveAddrCtt
				firstOperand <= instructionOpcode(15 downto 8);
				secondOperand <= instructionOpcode(7 downto 0);
				decodeOut := moveAddrCtt(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
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
			when "00101" => --move RA ctt
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := moveRegACtt(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
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
			when "00110" => --moveRegBCtt
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := moveRegBCtt(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
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
			when "00111" => --Add
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := addAB(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01000" => --Add regMem
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := addAMem(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01001" => --And
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := andRegReg(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01010" => --And reg Mem
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := andRegMem(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01011" => --OR reg reg
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := orRegReg(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01100" => --OR reg memory
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := orRegMem(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01101" => --CMP reg reg
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := cmpRegReg(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01110" => --CMP reg addr
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := cmpRegMem(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 6 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "01111" => --NOT regA
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := notA(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 4 then
					estadoSiguiente <=  operandAddCalc;
				end if;
			when "10000" => --NOT regB
				firstOperand <= instruction(15 downto 8);
				secondOperand <= instruction(7 downto 0);
				decodeOut := notB(counterDecode);
				aluControl <= decodeOut(22 downto 19);
				enable_ALU <= decodeOut(18);
				selfControl <= decodeOut(17 downto 14);
				enable_RA <= decodeOut(13 downto 12);
				enable_RB <= decodeOut(11 downto 10);
				enable_PC  <= decodeOut(9 downto 8);
				enable_MAR <= decodeOut(7 downto 6);
				enable_RAM <= decodeOut(5 downto 4);
				enable_MBR <= decodeOut(3 downto 2);
				enable_IR  <= decodeOut(1 downto 0);
				if counterDecode = 4 then
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

