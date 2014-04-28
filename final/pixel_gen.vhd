----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:33:34 04/28/2014 
-- Design Name: 
-- Module Name:    pixel_gen - Behavioral 
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

entity pixel_gen is
    Port ( row : in  STD_LOGIC;
           column : in  STD_LOGIC;
           blank : in  STD_LOGIC;
           v_completed : in  STD_LOGIC;
           r : out  STD_LOGIC;
           g : out  STD_LOGIC;
           b : out  STD_LOGIC);
end pixel_gen;

architecture Behavioral of pixel_gen is

begin


end Behavioral;

