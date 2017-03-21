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
		enable_PC : out STD_LOGIC_VECTOR(1 downto 0)
		);
end component;
--

--outputs de UC
signal enMAR : STD_LOGIC_VECTOR(1 downto 0);
signal enMBR : STD_LOGIC_VECTOR(1 downto 0);
signal enPC : STD_LOGIC_VECTOR(1 downto 0);
signal enIR : STD_LOGIC_VECTOR(1 downto 0);
signal enRAM : STD_LOGIC_VECTOR(1 downto 0);

--databus
signal dataBus : STD_LOGIC_VECTOR(23 downto 0);
signal dataAddr : STD_LOGIC_VECTOR(7 downto 0);
signal outMAR : STD_LOGIC_VECTOR(23 downto 0);
signal outMBR : STD_LOGIC_VECTOR(23 downto 0);
signal outPC : STD_LOGIC_VECTOR(23 downto 0);
signal outIR : STD_LOGIC_VECTOR(23 downto 0);
signal outRAM : STD_LOGIC_VECTOR(23 downto 0);
begin

p1 : controlUnit port map
	(clk => clk,
	 enable_MBR => enMBR,
	 enable_MAR => enMAR,
	 enable_RAM => enRAM,
	 enable_IR => enIR,
	 enable_PC => enPC);
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
	
--demux for out of each component DATA
process (outMBR, outMAR, outRAM, outPC, outIR, enMAR, enRAM, enMBR, enIR, enPC)
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
	end if;
	
	dataBus <= auxiliarBus;
end process;

--demux for ADDRESS
process (outMBR, outMAR, outRAM, outPC, outIR, enMAR, enRAM, enMBR, enIR, enPC)
variable auxiliarAddr: STD_LOGIC_VECTOR(7 downto 0);
begin
	if enMAR(1) = '1' then
		auxiliarAddr := outMAR(7 downto 0);
	end if;
	dataAddr <= auxiliarAddr;
end process;
end Behavioral;

