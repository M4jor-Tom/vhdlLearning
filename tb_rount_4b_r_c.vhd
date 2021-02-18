-- ---------------------------------------------------------
-- VHDL Testbench for rount_4b_r_c
-- ------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity tb_count_4b is
end tb_count_4b;

architecture testbench of tb_count_4b is

component crt_prg
	port(
		clk: in std_logic;
		rst: in std_logic;
		sel	:	in std_logic_vector(1 downto 0);
	
		clk_out:out std_logic
	);
end component;

signal clk: std_logic;
signal rst: std_logic;
signal sel	:	std_logic_vector(1 downto 0);

signal clk_out: std_logic;

begin
DUT0:crt_prg port map(
	clk => clk,
	rst => rst,
	sel => sel,

	clk_out => clk_out
);

stimulus0:process
begin
	rst <= '1';
	wait for 20 ns;--100 ns;
	rst <= '0';
	wait;
end process stimulus0;

clk_0:process
begin
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;
end process clk_0;

sel_0:process
begin
	sel <= "00";
	wait for 100 ns;
	sel <= "01";
	wait for 100 ns;
	sel <= "10";
	wait for 100 ns;
	sel <= "11";
	wait for 100 ns;
end process sel_0;

end testbench;