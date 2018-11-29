library verilog;
use verilog.vl_types.all;
entity weights_memory_tester is
    generic(
        DATA_WIDTH      : integer := 5;
        Addr_Depth      : integer := 12
    );
    port(
        clock           : out    vl_logic;
        reset           : out    vl_logic;
        address         : out    vl_logic_vector;
        en_read         : out    vl_logic;
        data_out        : in     vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of Addr_Depth : constant is 1;
end weights_memory_tester;
