----------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
-- 
-- Create Date:    09:33:34 04/28/2014 
-- Design Name: 
-- Module Name:    pixel_gen - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity pixel_gen is
    Port ( row             : in unsigned;
           column          : in unsigned;
           blank           : in STD_LOGIC;
           v_completed     : in STD_LOGIC;
			  hz_63           : in unsigned;
			  hz_160          : in unsigned;
			  hz_400          : in unsigned;
			  khz_1           : in unsigned;
			  khz_2_5         : in unsigned;
			  khz_6_25        : in unsigned;
			  khz_16          : in unsigned;
			  r               : out STD_LOGIC_VECTOR (7 downto 0);
           g               : out STD_LOGIC_VECTOR (7 downto 0);
           b               : out STD_LOGIC_VECTOR (7 downto 0)
			);
end pixel_gen;

architecture Behavioral of pixel_gen is
signal r_sig, g_sig, b_sig : std_logic_vector(7 downto 0);
signal h63, h160, h400, h1, h25, h625, h16 : unsigned (7 downto 0);

begin

	inst_LUT_63 : entity work.LUT(behavioral)
	port map(
				 val    => hz_63,
				 level  => h63
				);
				
	inst_LUT_160 : entity work.LUT(behavioral)
	port map(
				 val    => hz_160,
				 level  => h160
				);
	
	inst_LUT_400 : entity work.LUT(behavioral)
	port map(
				 val    => hz_400,
				 level  => h400
				);
				
	inst_LUT_1k : entity work.LUT(behavioral)
	port map(
				 val    => khz_1,
				 level  => h1
				);
				
	inst_LUT_15k : entity work.LUT(behavioral)
	port map(
				 val    => khz_2_5,
				 level  => h25
				);
				
	inst_LUT_625k : entity work.LUT(behavioral)
	port map(
				 val    => khz_6_25,
				 level  => h625
				);
				
	inst_LUT_16k : entity work.LUT(behavioral)
	port map(
				 val    => khz_16,
				 level  => h16
				);



process(row, blank, column, h63, h160, h400, h1, h25, h625, h16)
	begin

			r <= (others => '0');
			g <= (others => '0');
			b <= (others => '0');

		if(blank = '0') then

			
			--63 Hz
			if(column >52 and row <(480-h63) and column <102) then
				b <= (others => '1');
				r <= (others => '0');
				g <= (others => '0');
			end if; 
			
			--160 Hz
			if(column >133 and row <(480-h160) and column <183) then
				b <= (others => '1');
				r <= (others => '0');
				g <= (others => '0');
			end if; 
		
			--400 Hz
			if(column >214 and row <(480-h400) and column <264) then
				b <= (others => '1');
				r <= (others => '0');
				g <= (others => '0');
			end if; 
		 
			--1 KHz
			if(column >295 and row <(480-h1) and column <345) then
				b <= (others => '1');
				r <= (others => '0');
				g <= (others => '0');
			end if; 
			
			--2.5 KHz
			if(column >376 and row <(480-h25) and column <426) then
				b <= (others => '1');
				r <= (others => '0');
				g <= (others => '0');
			end if; 
			
			--6.25 KHz
			if(column >457 and row <(480-h625) and column <507) then
				b <= (others => '1');
				r <= (others => '0');
				g <= (others => '0');
			end if; 
			
			--16 KHz
			if(column >538 and row <(480-h16) and column <588) then
				b <= (others => '1');
				r <= (others => '0');
				g <= (others => '0');
			end if; 
	

		end if;
	end process;


end Behavioral;

