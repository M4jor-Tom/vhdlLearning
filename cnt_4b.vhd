---------------------------------------------------------------------------
-- Author               : St�phane Meill�re
-- Creation Date        : 20 February 2005   
-- Version Number       : 1.0
--
-- Revision History     : 
--
-- Description :
--	TP N3 VHDL
---------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity cnt_4b is
	port(
		clk :	in std_logic;
		rst	:	in std_logic;
	
		I0	: 	out std_logic_vector(3 downto 0)
	);
end cnt_4b;

architecture comportemental of cnt_4b is

signal I0Buff: std_logic_vector(3 downto 0);

begin
	cnt_4b_process: process(clk, rst)
	begin
		if(rst = '1') then
			I0Buff <= "0000";
		elsif(rising_edge(clk)) then
			I0Buff <= I0Buff + 1;
		end if;
	end process cnt_4b_process;

	I0 <= I0Buff;


end comportemental;