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

library UNISIM;
use UNISIM.VComponents.all;

entity MSG_module is
    Port ( clk     : in   STD_LOGIC;
           reset   : in   STD_LOGIC;
           JB      : in   STD_LOGIC_VECTOR (7 downto 0);
			  pulse	 : out  STD_LOGIC;
           hz63    : out  unsigned (7 downto 0);
           hz160   : out  unsigned (7 downto 0);
           hz400   : out  unsigned (7 downto 0);
           khz1    : out  unsigned (7 downto 0);
           khz2_5  : out  unsigned (7 downto 0);
           khz6_25 : out  unsigned (7 downto 0);
           khz16   : out  unsigned (7 downto 0));
end MSG_module;

architecture Behavioral of MSG_module is

type eq_state is (h63, h160, h400, k1, k25, k625, k16);
signal state, state_next : eq_state;
signal count, count_next : unsigned (12 downto 0);
signal next_63, next_160, next_400, next_1, next_25, next_625, next_16: unsigned (7 downto 0);
signal cur_63, cur_160, cur_400, cur_1, cur_25, cur_625, cur_16: unsigned (7 downto 0);
signal pls : std_logic;

begin

	count_next <= count + 1 when (count < 500) else (others => '0');
	pulse <= '1' when count = 0 else '0';
	pls <= '1' when count = 0 else '0';

	process (clk, reset)
	begin
		if(reset = '1') then
			count <= (others => '0');
			state <= h63;
		elsif(rising_edge(clk)) then
			count <= count_next;
			state <= state_next;
		end if;
	end process;
	
	process (clk, reset)
	begin
		if(reset = '1') then
			cur_63 <= (others => '0');
			cur_160 <= (others => '0');
			cur_400 <= (others => '0');
			cur_1 <= (others => '0');
			cur_25 <= (others => '0');
			cur_625 <= (others => '0');
			cur_16 <= (others => '0');
		elsif(rising_edge(clk)) then
			cur_63 <= next_63;
			cur_160 <= next_160;
			cur_400 <= next_400;
			cur_1 <= next_1;
			cur_25 <= next_25;
			cur_625 <= next_625;
			cur_16 <= next_16;
			
		end if;
	end process;
	
--======================================================
------------------NEXT-STATE-LOGIC----------------------
--======================================================
	
	process (pls, state, state_next)
	begin
		if (pls = '1') then
			
			case state is
			
				when h63 =>
					next_63 <= unsigned(JB);
					state_next <= h160;
						
				when h160 =>
					next_160 <= unsigned(JB);
					state_next <= h400;
			
				when h400 =>
					next_400 <= unsigned(JB);
					state_next <= k1;
							
				when k1 =>
					next_1 <= unsigned(JB);
					state_next <= k25;
				
				when k25 =>
					next_25 <= unsigned(JB);
					state_next <= k625;
					
				when k625 =>
					next_625 <= unsigned(JB);
					state_next <= k16;
				
				when k16 =>
					next_16 <= unsigned(JB);
					state_next <= h63;				
				

					
				
				
			end case;
		end if;
	end process;
					
--======================================================
----------------------OUTPUT-LOGIC----------------------
--======================================================
	hz63    <= cur_63;  
   hz160   <= cur_160;
   hz400   <= cur_400;
   khz1    <= cur_1;
   khz2_5  <= cur_25;
   khz6_25 <= cur_625;
   khz16   <= cur_16;
			  
			  

end Behavioral;

