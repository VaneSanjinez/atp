----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:47:47 03/20/2017 
-- Design Name: 
-- Module Name:    microprocessor - Behavioral 
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

entity microprocessor is
    Port ( clk : in  STD_LOGIC);
end microprocessor;

architecture Behavioral of microprocessor is

--components:
--MAR
component MAR
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);
end component;
--MBR
component MBR
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);
end component;
--IR
component IR
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);

end component;
--PC
component PC
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);
end component;
--RAM
component RAM
Port (clk : in  STD_LOGIC;
			  --reset: in STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  addr : in STD_LOGIC_VECTOR(7 downto 0);
			  readRAM : in STD_LOGIC;
			  writeRAM : in STD_LOGIC);

end component;
--UC
component controlUnit
Port (clk : in STD_LOGIC;
		--enables
		enable_MBR : out STD_LOGIC_VECTOR(1 downto 0);
		enable_MAR : out STD_LOGIC_VECTOR(1 downto 0);
		enable_RAM : out STD_LOGIC_VECTOR(1 downto 0);
		enable_IR : out STD_LOGIC_VECTOR(1 downto 0);
		enable_PC : out STD_LOGIC_VECTOR(1 downto 0);
		--enable RA and RB
		enable_RA : out STD_LOGIC_VECTOR(1 downto 0);
		enable_RB : out STD_LOGIC_VECTOR(1 downto 0);
		-- opcode
		instruction : in STD_LOGIC_VECTOR(23 downto 0);
		--
		selfControl : out STD_LOGIC_VECTOR(3 downto 0);
		firstOperand :  out STD_LOGIC_VECTOR(7 downto 0);
		secondOperand :  out STD_LOGIC_VECTOR(7 downto 0)
		);
end component;
--
--RA
component RA
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);
end component;
--
--RB
component RB
Port (     clk : in  STD_LOGIC;
			  datain : in STD_LOGIC_VECTOR(23 downto 0);
			  dataout : out STD_LOGIC_VECTOR(23 downto 0);
			  enableWrite : in  STD_LOGIC;
			  enableRead : in  STD_LOGIC);

end component;
--

--outputs de UC
signal enMAR : STD_LOGIC_VECTOR(1 downto 0);
signal enMBR : STD_LOGIC_VECTOR(1 downto 0);
signal enPC : STD_LOGIC_VECTOR(1 downto 0);
signal enIR : STD_LOGIC_VECTOR(1 downto 0);
signal enRAM : STD_LOGIC_VECTOR(1 downto 0);
signal enRA : STD_LOGIC_VECTOR(1 downto 0);
signal enRB : STD_LOGIC_VECTOR(1 downto 0);
signal selfControl : STD_LOGIC_VECTOR(3 downto 0);
signal operand1 : STD_LOGIC_VECTOR(7 downto 0);
signal operand2 : STD_LOGIC_VECTOR(7 downto 0);



--databus
signal dataBus : STD_LOGIC_VECTOR(23 downto 0);
signal dataAddr : STD_LOGIC_VECTOR(7 downto 0);
signal outMAR : STD_LOGIC_VECTOR(23 downto 0);
signal outMBR : STD_LOGIC_VECTOR(23 downto 0);
signal outPC : STD_LOGIC_VECTOR(23 downto 0);
signal outIR : STD_LOGIC_VECTOR(23 downto 0);
signal outRAM : STD_LOGIC_VECTOR(23 downto 0);
signal outRA : STD_LOGIC_VECTOR(23 downto 0);
signal outRB : STD_LOGIC_VECTOR(23 downto 0);

begin

p1 : controlUnit port map
	(clk => clk,
	 enable_MBR => enMBR,
	 enable_MAR => enMAR,
	 enable_RAM => enRAM,
	 enable_IR => enIR,
	 enable_PC => enPC,
	 enable_RA => enRA,
	 enable_RB => enRB, 
	 instruction => dataBus, 
	 selfControl => selfControl,
	 firstOperand => operand1,
	 secondOperand => operand2);
p2 : IR port map
	(clk => clk,
	 datain => dataBus,
	 dataout => outIR,
	 enableWrite => enIR(1),
	 enableRead => enIR(0));
p3 : PC port map
	(clk => clk,
	 datain => dataBus,
	 dataout => outPC,
	 enableWrite => enPC(1),
	 enableRead => enPC(0));
p4 : MAR port map
	(clk => clk,
	 datain => dataBus,
	 dataout => outMAR,
	 enableWrite => enMAR(1),
	 enableRead => enMAR(0));
p5 : MBR port map
	(clk => clk,
	 datain => dataBus,
	 dataout => outMBR,
	 enableWrite => enMBR(1),
	 enableRead => enMBR(0));
p6 : RAM port map
	(clk  => clk,
   --reset => ;
	datain  => dataBus,
	dataout  =>  outRAM,
   addr  => dataAddr,
   readRAM  => enRAM(1),
	writeRAM => enRAM(0));
p7 : RA port map
	(clk => clk,
	 datain => dataBus,
	 dataout => outRA,
	 enableWrite => enRA(1),
	 enableRead => enRA(0));
p8 : RB port map
	(clk => clk,
	 datain => dataBus,
	 dataout => outRB,
	 enableWrite => enRB(1),
	 enableRead => enRB(0));
	
--demux for out of each component DATA
process (outMBR, outMAR, outRAM, outPC, outIR, outRA, outRB, enMAR, enRAM, enMBR, enIR, enPC, enRA, enRB, selfControl)
variable auxiliarBus: STD_LOGIC_VECTOR (23 downto 0);
begin
	if enPC(1) = '1' then
		auxiliarBus := outPC;
--	elsif enMAR(1) = '1' then
--		auxiliarBus := outMAR;
	elsif enMBR(1) = '1' then
		auxiliarBus := outMBR;
	elsif enIR(1) = '1' then
		auxiliarBus := outIR;
	elsif enRAM(1) = '1' then
		auxiliarBus := outRAM;
	elsif enRA(1) = '1' then
		auxiliarBus := outRA;
	elsif enRB(1) = '1' then
		auxiliarBus := outRB;
	elsif selfControl(2) = '1' then
		auxiliarBus := X"0000" & operand2;
	elsif selfControl(3) = '1' then
		auxiliarBus := operand1 & X"0000";
	end if;
	
	dataBus <= auxiliarBus;
end process;

--demux for ADDRESS
process (outMBR, outMAR, outRAM, outPC, outIR, enMAR, enRAM, enMBR, enIR, enPC, operand1, operand2, selfControl)
variable auxiliarAddr: STD_LOGIC_VECTOR(7 downto 0);
begin
	if enMAR(1) = '1' then
		auxiliarAddr := outMAR(7 downto 0);
	elsif selfControl(0) = '1' then
		auxiliarAddr := operand2;
	elsif selfControl(1) = '1' then
		auxiliarAddr := operand1;
	end if;
	dataAddr <= auxiliarAddr;
end process;
end Behavioral;

