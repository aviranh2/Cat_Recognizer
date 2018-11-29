library verilog;
use verilog.vl_types.all;
entity Neuron is
    port(
        x               : in     vl_logic_vector(7 downto 0);
        w               : in     vl_logic_vector(15 downto 0);
        \out\           : out    vl_logic_vector(31 downto 0)
    );
end Neuron;
