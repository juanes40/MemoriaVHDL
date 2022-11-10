library IEEE;
use IEEE.std_logic_1164.all;

entity lamemoria is
	port(
			address, data_in: in std_logic_vector(7 downto 0);
			writen, reset, clock: in std_logic;
			display0, display1, display2, display3: out std_logic_vector(6 downto 0);
			port_in_00, port_in_01, port_in_02, port_in_03: in std_logic_vector(7 downto 0);
			port_out_00, port_out_01, port_out_02, port_out_03: out std_logic_vector(7 downto 0));
end entity;

architecture Memoria_arch of lamemoria is

component memoria
 port ( CLOCK_50, reset : in std_logic;
	     address : in std_logic_vector(7 downto 0);
	     data_in : in std_logic_vector(7 downto 0);
	     writen : in std_logic;
	     port_out_00, port_out_01, port_out_02, port_out_03: out std_logic_vector(7 downto 0);
		  data_out : out std_logic_vector(7 downto 0);
		  port_in_00, port_in_01, port_in_02, port_in_03: in std_logic_vector(7 downto 0));
end component;

component deco
 port(A, B, C, D: in std_logic;
			HEX0: out std_logic_vector(6 downto 0));
end component;

signal data_out: std_logic_vector (7 downto 0);

begin
U1: deco port map (address(7), address(6), address(5), address(4), display0);
U2: deco port map (address(3), address(2), address(1), address(0), display1);
U3: memoria port map (clock, reset, address, data_in, writen, port_out_00, port_out_01, port_out_02, port_out_03, data_out, port_in_00, port_in_01, port_in_02, port_in_03);
U4: deco port map (data_out(7), data_out(6), data_out(5), data_out(4), display2);
U5: deco port map (data_out(3), data_out(2), data_out(1), data_out(0), display3);

end architecture;