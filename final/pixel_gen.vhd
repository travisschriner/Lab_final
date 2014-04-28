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

begin


end Behavioral;

