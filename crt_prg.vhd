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

architecture structural of crt_prg is

component cnt_4b is
	port(
		clk :	in std_logic;
		rst	:	in std_logic;
	
		I0	: 	out std_logic_vector(3 downto 0)
	);
end component;
	
component mux_4_1 is
	port(
		E0:	in std_logic_vector(3 downto 0);
		Sel:in std_logic_vector(1 downto 0);
	
		I1:	out std_logic
	);
end component;
	
signal I0	: std_logic_vector(3 downto 0);

begin

	m_4_1: mux_4_1 port map(
		E0 => I0,
		Sel => sel,
		I1 => clk_out
	);

	c_4b: cnt_4b port map(
		clk => clk,
		rst => rst,
	
		I0 => I0
	);



end structural;