library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    generic(
        DATA_WIDTH      : integer := 24;
        Addr_Depth      : integer := 12
    );
    port(
        clock           : in     vl_logic;
        rst             : in     vl_logic;
        address         : in     vl_logic_vector;
        en_write        : in     vl_logic;
        en_read         : in     vl_logic;
        data_in         : in     vl_logic_vector;
        data_out        : out    vl_logic_vector;
        control_reg     : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DATA_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of Addr_Depth : constant is 1;
end RegisterFile;
