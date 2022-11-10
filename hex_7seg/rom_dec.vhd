library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom_dec is
	port(CLOCK_50 :in std_logic;
		  SW : in std_logic_vector (3 downto 0);
		  HEX0 : out std_logic_vector(0 to 6);
		  HEX1 : out std_logic_vector(6 downto 0));
   end entity;
	
	architecture rom_dec_arch of rom_dec is
	
		component ROM is
			port (CLOCK_50 : in std_logic;
					SW : in std_logic_vector(3 downto 0);
					data_out : out std_logic_vector(7 downto 0));
		end component;
	
		component hex_7seg is
			port (SW : in std_logic_vector( 3 downto 0);
					HEX0 : out std_logic_vector(6 downto 0));
		end component;
		  
		signal data_out: std_logic_vector(7 downto 0);
		signal data_out_0 : std_logic_vector(3 downto 0) := data_out(3 downto 0);
		signal data_out_1 : std_logic_vector(3 downto 0) := data_out(7 downto 4);
		
	begin
	
	U1 : ROM port map(CLOCK_50, SW, data_out);
	U2 : hex_7seg port map(data_out_0, HEX0);
	U3 : hex_7seg port map(data_out_1, HEX1);
	
	end architecture;
	