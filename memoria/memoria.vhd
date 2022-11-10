library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoria is 
	port ( address : in std_logic_vector( 7 downto 0);
			 data_in : in std_logic_vector(7 downto 0);
			 writen : in std_logic;
			 reset : in std_logic;
			 CLOCK_50 : in std_logic;
			 port_in_00 : in std_logic_vector(7 downto 0);
			 port_in_01 : in std_logic_vector(7 downto 0);
			 port_in_02 : in std_logic_vector(7 downto 0);
			 port_in_03: in std_logic_vector(7 downto 0);
			 port_out_00 : out std_logic_vector(7 downto 0);
			 port_out_01 : out std_logic_vector(7 downto 0);
			 port_out_02 : out std_logic_vector(7 downto 0);
			 port_out_03 : out std_logic_vector(7 downto 0);
			 data_out : out std_logic_vector(7 downto 0));
end entity;

architecture memoria_arch of memoria is

component ram is 
	port (clock : in std_logic;
			address : in std_logic_vector(7 downto 0);
			data_in : in std_logic_vector(7 downto 0);
			writen    : in std_logic;
			data_out : out std_logic_vector(7 downto 0));
end component;

component rom_128 is
	port (
			CLOCK_50 : in std_logic;
			address: in std_logic_vector(7 downto 0);
			data_out : out std_logic_vector(7 downto 0));
end component;

component outputs is
	port(clock: in std_logic;
			reset: in std_logic;
			address: in std_logic_vector(7 downto 0);
	     data_in: in std_logic_vector(7 downto 0);
		  writen: in std_logic;		  
		  port_out_00: out std_logic_vector(7 downto 0);
		  port_out_01: out std_logic_vector(7 downto 0);
		  port_out_02: out std_logic_vector(7 downto 0);
		  port_out_03: out std_logic_vector(7 downto 0));
end component;

signal rom_data_out, rw_data_out : std_logic_vector(7 downto 0);
begin


MUX1 : process (address, rom_data_out, rw_data_out,

	port_in_00, port_in_01, port_in_02, port_in_03
	)

	begin	
		if ( (to_integer(unsigned(address)) >= 0) and
			 (to_integer(unsigned(address)) <= 127)) then
			 data_out <= rom_data_out;
		elsif ( (to_integer(unsigned(address)) >= 128) and
				(to_integer(unsigned(address)) <= 223)) then
				data_out <= rw_data_out;
		elsif (address = x"F0") then data_out <= port_in_00;
		elsif (address = x"F1") then data_out <= port_in_01;
		elsif (address = x"F2") then data_out <= port_in_02;
		elsif (address = x"F3") then data_out <= port_in_03;
		else data_out <= x"00";
		end if;
		
	end process;
	 
	U1 : rom_128 port map (CLOCK_50, address, rom_data_out);
	U2 : ram port map (CLOCK_50, address, data_in, writen, rw_data_out);
	U3 : outputs port map (CLOCK_50, reset, address, data_in, writen, port_out_00, port_out_01, port_out_02, port_out_03 );

end architecture;
