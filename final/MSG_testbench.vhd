--------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
--
-- Create Date:   16:50:05 05/04/2014
-- Design Name:   
-- Module Name:   C:/Users/C15Travis.Schriner/Documents/2dig/ECE383/Lab_Final/final/MSG_testbench.vhd
-- Project Name:  final
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MSG_module
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
USE ieee.numeric_std.ALL;
 
ENTITY MSG_testbench IS
END MSG_testbench;
 
ARCHITECTURE behavior OF MSG_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MSG_module
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         JB : IN  std_logic_vector(7 downto 0);
         pulse : OUT  std_logic;
         hz63 : OUT  unsigned(7 downto 0);
         hz160 : OUT  unsigned(7 downto 0);
         hz400 : OUT  unsigned(7 downto 0);
         khz1 : OUT  unsigned(7 downto 0);
         khz2_5 : OUT  unsigned(7 downto 0);
         khz6_25 : OUT  unsigned(7 downto 0);
         khz16 : OUT  unsigned(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal JB : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal pulse : std_logic;
   signal hz63 : unsigned(7 downto 0);
   signal hz160 : unsigned(7 downto 0);
   signal hz400 : unsigned(7 downto 0);
   signal khz1 : unsigned(7 downto 0);
   signal khz2_5 : unsigned(7 downto 0);
   signal khz6_25 : unsigned(7 downto 0);
   signal khz16 : unsigned(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MSG_module PORT MAP (
          clk => clk,
          reset => reset,
          JB => JB,
          pulse => pulse,
          hz63 => hz63,
          hz160 => hz160,
          hz400 => hz400,
          khz1 => khz1,
          khz2_5 => khz2_5,
          khz6_25 => khz6_25,
          khz16 => khz16
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		reset <= '1';
      wait for clk_period*10;
		reset <='0';
		JB <= "11111111";
		wait for clk_period*600;
		JB <= "11111110";
		wait for clk_period*600;
		JB <= "11111101";
		wait for clk_period*600;
		JB <= "11111100";
		wait for clk_period*600;
		JB <= "11111011";
		wait for clk_period*600;
		JB <= "11111010";
		wait for clk_period*600;
		JB <= "11111001";
		wait for clk_period*600;
		JB <= "11111000";
		wait for clk_period*600;
		JB <= "11110111";
		wait for clk_period*600;
		JB <= "11110110";
		wait for clk_period*600;
		JB <= "11110101";
		wait for clk_period*600;
		JB <= "11110100";
		wait for clk_period*600;
		JB <= "11110011";
		wait for clk_period*600;
		JB <= "11110010";
		wait for clk_period*600;

      wait;
   end process;

END;
