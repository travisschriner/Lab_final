----------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
-- 
-- Create Date:    11:11:27 04/24/2014 
-- Design Name: 
-- Module Name:    top_level_final - Behavioral 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity top_level_final is
    port ( 
             clk   : in  std_logic; -- 100 MHz
             reset : in  std_logic;
				 JB	 : inout  std_logic_vector(7 downto 0);
             tmds  : out std_logic_vector(3 downto 0);
             tmdsb : out std_logic_vector(3 downto 0)
         );
end top_level_final;

architecture behavioral of top_level_final is
Signal red_s, green_s, blue_s, clock_s, h_sync, v_sync, v_completed, blank, pixel_clk, serialize_clk, serialize_clk_n : std_logic;
signal row, column : unsigned(10 downto 0);
signal red, green, blue : std_logic_vector (7 downto 0); 
signal hz_63, hz_160, hz_400, khz_1, khz_2_5, khz_6_25, khz_16 : unsigned (7 downto 0);


begin

    -- Clock divider - creates pixel clock from 100MHz clock
    inst_DCM_pixel: DCM
    generic map(
                   CLKFX_MULTIPLY => 2,
                   CLKFX_DIVIDE   => 8,
                   CLK_FEEDBACK   => "1X"
               )
    port map(
                clkin => clk,
                rst   => reset, 
                clkfx => pixel_clk
            );

    -- Clock divider - creates HDMI serial output clock
    inst_DCM_serialize: DCM
    generic map(
                   CLKFX_MULTIPLY => 10, -- 5x speed of pixel clock
                   CLKFX_DIVIDE   => 8,
                   CLK_FEEDBACK   => "1X"
               )
    port map(
                clkin => clk,
                rst   => reset,
                clkfx => serialize_clk,
                clkfx180 => serialize_clk_n
            );


		vga_sync_instance : entity work.vga_sync(behavioral)
			port map (	clk   		=> pixel_clk,
							reset  		=> reset,
							h_sync   	=> h_sync,
							v_sync   	=> v_sync,
							v_completed => v_completed,
							blank       => blank,
							row         => row,
							column      => column
						);

		pixel_gen_instance : entity work.pixel_gen(behavioral)
			port map ( 	row      => row,
							column   => column,
							blank    => blank,
							v_completed => v_completed,
							hz_63    => hz_63,
			            hz_160   => hz_160,
			            hz_400   => hz_400,
			            khz_1    => khz_1,
			            khz_2_5  => khz_2_5,
			            khz_6_25 => khz_6_25,
			            khz_16   => khz_16,
							r        => red,
							g        => green,
					 		b        => blue
						);
						
		inst_MSG_module: entity work.MSG_module
		port map(
						clk			=> clk,
						reset			=> reset,
						JB				=> JB,
						pulse			=> JB(0), --LSB
						hz63			=> hz_63,
						hz160			=> hz_160,
						hz400			=> hz_400,
						khz1    		=> khz_1,
			         khz2_5  		=> khz_2_5,
			         khz6_25 		=> khz_6_25,
			         khz16   		=> khz_16
				);


   
    -- Convert VGA signals to HDMI (actually, DVID ... but close enough)
    inst_dvid: entity work.dvid
    port map(
                clk       => serialize_clk,
                clk_n     => serialize_clk_n, 
                clk_pixel => pixel_clk,
                red_p     => red,
                green_p   => green,
                blue_p    => blue,
                blank     => blank,
                hsync     => h_sync,
                vsync     => v_sync,
                -- outputs to TMDS drivers
                red_s     => red_s,
                green_s   => green_s,
                blue_s    => blue_s,
                clock_s   => clock_s
            );
				
		

    -- Output the HDMI data on differential signalling pins
    OBUFDS_blue  : OBUFDS port map
        ( O  => TMDS(0), OB => TMDSB(0), I  => blue_s  );
    OBUFDS_red   : OBUFDS port map
        ( O  => TMDS(1), OB => TMDSB(1), I  => green_s );
    OBUFDS_green : OBUFDS port map
        ( O  => TMDS(2), OB => TMDSB(2), I  => red_s   );
    OBUFDS_clock : OBUFDS port map
        ( O  => TMDS(3), OB => TMDSB(3), I  => clock_s );


end behavioral;