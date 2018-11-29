library verilog;
use verilog.vl_types.all;
entity weights_memory_tb is
    generic(
        DATA_WIDTH      : integer := 5;
        Addr_Depth      : integer := 12
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of Addr_Depth : constant is 1;
end weights_memory_tb;
