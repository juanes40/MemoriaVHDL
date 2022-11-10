library IEEE;

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity outputs is
	port(address: in std_logic_vector(7 downto 0);
	     data_in: in std_logic_vector(7 downto 0);
		  writen: in std_logic;
		  clock: in std_logic;
		  reset: in std_logic;
		  port_out_00: out std_logic_vector(7 downto 0);
		  port_out_01, port_out_02, port_out_03: out std_logic_vector(7 downto 0));
end entity;

architecture arch_out of outputs is
begin
	U3 : process (clock, reset)
	begin
		if (reset= '0') then
			port_out_00 <= x"00";
				elsif (clock'event and clock='1') then
				if (address = x"E0" and writen = '1') then
				port_out_00 <= data_in;
			end if;
		end if;
	end process;
-- port_out_01 description : ADDRESS x"E1"
	U4 : process (clock, reset)
		begin
			if (reset = '0') then
				port_out_01 <= x"00";
				elsif (clock'event and clock='1') then
				if (address = x"E1" and writen = '1') then
				port_out_01 <= data_in;
			end if;
		end if;
	end process;
	U5: process (clock, reset)
	begin
		if (reset='0') then
		port_out_02 <=x"00";
		elsif(clock'event and clock='1') then
			if (address=x"E2" and writen = '1') then
			port_out_02<= data_in;
			end if;
		end if;
	end process;
	
U6: process (clock, reset)
	begin
		if (reset='0') then
		port_out_03 <=x"00";
		elsif(clock'event and clock='1') then
			if (address=x"E3" and writen = '1') then
			port_out_03<= data_in;
			end if;
		end if;
	end process;
	
end architecture;	  