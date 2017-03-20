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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

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
--INCTRUCTION CYCLE
type estado is (instAddr, instFetch, instDecoding, operandAddCalc, operandFetch, dataOp, opDataCalc, opStore);
signal estadoPresente, estadoSiguiente : estado;

--FETCH INSTRUCTION
type states is (state_PC, state_MAR,
					 state_RAM, state_MBR, state_IR);
signal presentState, nextState : states;


begin

process(clk)
begin
	if (clk'event and clk='1') then
			estadoPresente <= estadoSiguiente; -- cycle
			presentState <= nextState; --fetch instruction
			--presentStateChargeAC <= futureStateChargeAC;
			--presentstateWriteMemory <= futurestateWriteMemory;
		end if;
end process;

process (presentState, estadoPresente)
begin
case estadoPresente is
	when instAddr=>
		estadoSiguiente <= instFetch;
	when instFetch =>
		case presentState is
			when state_PC =>
				enable_PC <= "10";
				enable_MAR <= "00";
				--enable_MBR <= ;
				--enable_IR <= ;
				--enable_RAM <= ;
				nextState <= state_MAR;
			when state_MAR => 
				enable_PC <= "00";
				enable_MAR <= "01"; --lect
				nextState <= state_MBR;
			when state_MBR => 
				nextState <= state_IR;
				when state_IR => 
				nextState <= state_RAM;
			when state_RAM =>
				nextState <= state_PC;
				estadoSiguiente <= instDecoding;
		end case;
		--estadoSiguiente <= instDecoding;
	when instDecoding =>
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
end process;

end Behavioral;

