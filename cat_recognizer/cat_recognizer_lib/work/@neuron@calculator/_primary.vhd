library verilog;
use verilog.vl_types.all;
entity NeuronCalculator is
    generic(
        DATA_WIDTH      : integer := 24;
        Addr_Depth      : integer := 12;
        Weight_Percision: integer := 5
    );
    port(
        x               : in     vl_logic_vector;
        w               : in     vl_logic_vector;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        get_result      : in     vl_logic;
        neuron_calculator_out: out    vl_logic;
        acc_val         : out    vl_logic_vector(63 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of Addr_Depth : constant is 1;
    attribute mti_svvh_generic_type of Weight_Percision : constant is 1;
end NeuronCalculator;
