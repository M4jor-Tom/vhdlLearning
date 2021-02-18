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

entity crt_prg is
	port(
		clk :	in std_logic;
		rst	:	in std_logic;
		sel	:	in std_logic_vector(1 downto 0);
	
		clk_out:out std_logic
	);
end crt_prg;

--architecture structural of crt_prg is

--component cnt_4b is
--	port(
--		clk :	in std_logic;
--		rst	:	in std_logic;
--	
--		I0	: 	out std_logic_vector(3 downto 0)
--	);
--end component;
--	
--component mux_4_1 is
--	port(
--		E0:	in std_logic_vector(3 downto 0);
--		Sel:in std_logic_vector(1 downto 0);
--	
--		I1:	out std_logic
--	);
--end component;
--	
--signal I0	: std_logic_vector(3 downto 0);

--begin

--	m_4_1: mux_4_1 port map(
--		E0 => I0,
--		Sel => sel,
--		I1 => clk_out
--	);

--	c_4b: cnt_4b port map(
--		clk => clk,
--		rst => rst,
--	
--		I0 => I0
--	);

--end structural;

architecture comportemental of crt_prg is

signal I0: std_logic_vector(3 downto 0);

begin

	process(clk, rst)
	begin
		if(rst = '1') then
			I0 <= "0000";
		elsif(rising_edge(clk)) then
			I0 <= I0 + 1;
		end if;
	end process;

	with sel select clk_out <=
		I0(0) when "00",
		I0(1) when "01",
		I0(2) when "10",
		I0(3) when "11",
		I0(0) when others;

end comportemental;