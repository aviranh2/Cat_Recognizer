library verilog;
use verilog.vl_types.all;
entity NeuronCalculator_tb is
    generic(
        DATA_WIDTH      : integer := 24;
        Addr_Depth      : integer := 12;
        Weight_Percision: integer := 5
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of Addr_Depth : constant is 1;
    attribute mti_svvh_generic_type of Weight_Percision : constant is 1;
end NeuronCalculator_tb;
