library verilog;
use verilog.vl_types.all;
entity memoria_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        CLOCK_50        : in     vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        port_in_00      : in     vl_logic_vector(7 downto 0);
        port_in_01      : in     vl_logic_vector(7 downto 0);
        port_in_02      : in     vl_logic_vector(7 downto 0);
        port_in_03      : in     vl_logic_vector(7 downto 0);
        reset           : in     vl_logic;
        writen          : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end memoria_vlg_sample_tst;
