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
	
entity mux_4_1 is
	port(
		E0:	in std_logic_vector(3 downto 0);
		Sel:in std_logic_vector(1 downto 0);
	
		I1:	out std_logic
	);
end mux_4_1;

architecture dataFlow of mux_4_1 is
begin
	with Sel select I1 <=
		E0(0) when "00",
		E0(1) when "01",
		E0(2) when "10",
		E0(3) when "11",
		E0(0) when others;

end dataFlow;