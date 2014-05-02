----------------------------------------------------------------------------------
-- Company: USAFA DFEC	
-- Engineer: C2C Travis Schriner
-- 
-- Create Date:    10:58:24 05/02/2014 
-- Design Name: 
-- Module Name:    MSG_module - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MSG_module is
    Port ( clk     : in   STD_LOGIC;
           reset   : in   STD_LOGIC;
           JB      : in   STD_LOGIC_VECTOR (7 downto 0);
			  pulse	 : out  STD_LOGIC;
           hz63    : out  STD_LOGIC_VECTOR (7 downto 0);
           hz160   : out  STD_LOGIC_VECTOR (7 downto 0);
           hz400   : out  STD_LOGIC_VECTOR (7 downto 0);
           khz1    : out  STD_LOGIC_VECTOR (7 downto 0);
           khz2_5  : out  STD_LOGIC_VECTOR (7 downto 0);
           khz6_25 : out  STD_LOGIC_VECTOR (7 downto 0);
           khz16   : out  STD_LOGIC_VECTOR (7 downto 0));
end MSG_module;

architecture Behavioral of MSG_module is

begin


end Behavioral;
