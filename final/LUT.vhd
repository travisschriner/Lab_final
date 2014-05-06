----------------------------------------------------------------------------------
-- Company: USAFA DFEC
-- Engineer: C2C Travis Schriner
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT is
	port( val 	: in unsigned (7 downto 0);
			level : out unsigned(7 downto 0)
		 );
end LUT;

architecture Behavioral of LUT is

begin
process(val)
begin
	case val is
		when (others => '0') =>
			level <= (others => '0');
		when to_unsigned(1, 8) =>
			level <= to_unsigned(2, 8);
		when to_unsigned(2, 8) =>
			level <= to_unsigned(4, 8);
		when to_unsigned(3, 8) =>
			level <= to_unsigned(6, 8);
		when to_unsigned(4, 8) =>
			level <= to_unsigned(8, 8);
		when to_unsigned(5, 8) =>
			level <= to_unsigned(10, 8);
		when to_unsigned(6, 8) =>
			level <= to_unsigned(12, 8);
		when to_unsigned(7, 8) =>
			level <= to_unsigned(14, 8);
		when to_unsigned(8, 8) =>
			level <= to_unsigned(16, 8);
		when to_unsigned(9, 8) =>
			level <= to_unsigned(18, 8);
		when to_unsigned(10, 8) =>
			level <= to_unsigned(20, 8);
		when to_unsigned(11, 8) =>
			level <= to_unsigned(22, 8);
		when to_unsigned(12, 8) =>
			level <= to_unsigned(24, 8);
		when to_unsigned(13, 8) =>
			level <= to_unsigned(26, 8);
		when to_unsigned(14, 8) =>
			level <= to_unsigned(28, 8);
		when to_unsigned(15, 8) =>
			level <= to_unsigned(30, 8);
		when to_unsigned(16, 8) =>
			level <= to_unsigned(32, 8);
		when to_unsigned(17, 8) =>
			level <= to_unsigned(34, 8);
		when to_unsigned(18, 8) =>
			level <= to_unsigned(36, 8);
		when to_unsigned(19, 8) =>
			level <= to_unsigned(38, 8);
		when to_unsigned(20, 8) =>
			level <= to_unsigned(40, 8);
		when to_unsigned(21, 8) =>
			level <= to_unsigned(42, 8);
		when to_unsigned(22, 8) =>
			level <= to_unsigned(44, 8);
		when to_unsigned(23, 8) =>
			level <= to_unsigned(46, 8);
		when to_unsigned(24, 8) =>
			level <= to_unsigned(48, 8);
		when to_unsigned(25, 8) =>
			level <= to_unsigned(50, 8);
		when to_unsigned(26, 8) =>
			level <= to_unsigned(52, 8);
		when to_unsigned(27, 8) =>
			level <= to_unsigned(54, 8);
		when to_unsigned(28, 8) =>
			level <= to_unsigned(56, 8);
		when to_unsigned(29, 8) =>
			level <= to_unsigned(58, 8);
		when to_unsigned(30, 8) =>
			level <= to_unsigned(60, 8);
		when to_unsigned(31, 8) =>
			level <= to_unsigned(62, 8);
		when to_unsigned(31, 8) =>
			level <= to_unsigned(64, 8);
		when to_unsigned(32, 8) =>
			level <= to_unsigned(66, 8);
		when to_unsigned(33, 8) =>
			level <= to_unsigned(68, 8);
		when to_unsigned(34, 8) =>
			level <= to_unsigned(70, 8);
		when to_unsigned(35, 8) =>
			level <= to_unsigned(72, 8);
		when to_unsigned(36, 8) =>
			level <= to_unsigned(74, 8);
		when to_unsigned(37, 8) =>
			level <= to_unsigned(76, 8);
		when to_unsigned(38, 8) =>
			level <= to_unsigned(78, 8);
		when to_unsigned(39, 8) =>
			level <= to_unsigned(80, 8);
		when to_unsigned(40, 8) =>
			level <= to_unsigned(82, 8);
		when to_unsigned(41, 8) =>
			level <= to_unsigned(84, 8);
		when to_unsigned(42, 8) =>
			level <= to_unsigned(86, 8);
		when to_unsigned(43, 8) =>
			level <= to_unsigned(88, 8);
		when to_unsigned(44, 8) =>
			level <= to_unsigned(90, 8);
		when to_unsigned(45, 8) =>
			level <= to_unsigned(92, 8);
		when to_unsigned(46, 8) =>
			level <= to_unsigned(94, 8);
		when to_unsigned(47, 8) =>
			level <= to_unsigned(96, 8);
		when to_unsigned(48, 8) =>
			level <= to_unsigned(98, 8);
		when to_unsigned(49, 8) =>
			level <= to_unsigned(100, 8);
		when to_unsigned(50, 8) =>
			level <= to_unsigned(102, 8);
		when to_unsigned(51, 8) =>
			level <= to_unsigned(104, 8);
		when to_unsigned(52, 8) =>
			level <= to_unsigned(106, 8);
		when to_unsigned(53, 8) =>
			level <= to_unsigned(108, 8);
		when to_unsigned(54, 8) =>
			level <= to_unsigned(110, 8);
		when to_unsigned(55, 8) =>
			level <= to_unsigned(112, 8);
		when to_unsigned(56, 8) =>
			level <= to_unsigned(114, 8);
		when to_unsigned(57, 8) =>
			level <= to_unsigned(116, 8);
		when to_unsigned(58, 8) =>
			level <= to_unsigned(118, 8);
		when to_unsigned(59, 8) =>
			level <= to_unsigned(120, 8);
		when to_unsigned(60, 8) =>
			level <= to_unsigned(122, 8);
		when to_unsigned(61, 8) =>
			level <= to_unsigned(124, 8);
		when to_unsigned(62, 8) =>
			level <= to_unsigned(126, 8);
		when to_unsigned(63, 8) =>
			level <= to_unsigned(128, 8);
		when to_unsigned(64, 8) =>
			level <= to_unsigned(130, 8);
		when to_unsigned(65, 8) =>
			level <= to_unsigned(132, 8);
		when to_unsigned(66, 8) =>
			level <= to_unsigned(134, 8);
		when to_unsigned(67, 8) =>
			level <= to_unsigned(136, 8);
		when to_unsigned(68, 8) =>
			level <= to_unsigned(138, 8);
		when to_unsigned(69, 8) =>
			level <= to_unsigned(140, 8);
		when to_unsigned(70, 8) =>
			level <= to_unsigned(142, 8);
		when to_unsigned(71, 8) =>
			level <= to_unsigned(144, 8);
		when to_unsigned(72, 8) =>
			level <= to_unsigned(146, 8);
		when to_unsigned(73, 8) =>
			level <= to_unsigned(148, 8);
		when to_unsigned(74, 8) =>
			level <= to_unsigned(150, 8);
		when to_unsigned(75, 8) =>
			level <= to_unsigned(152, 8);
		when to_unsigned(76, 8) =>
			level <= to_unsigned(154, 8);
		when to_unsigned(77, 8) =>
			level <= to_unsigned(156, 8);
			
			
		
		when others =>
			level <= "00000000";
	end case;
end process;

end Behavioral;

