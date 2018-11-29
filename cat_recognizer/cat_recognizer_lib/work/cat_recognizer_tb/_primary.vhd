library verilog;
use verilog.vl_types.all;
entity cat_recognizer_tb is
    generic(
        Amba_Word       : integer := 24;
        Amba_Addr_Depth : integer := 12;
        Weightrecision  : integer := 5
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Amba_Word : constant is 1;
    attribute mti_svvh_generic_type of Amba_Addr_Depth : constant is 1;
    attribute mti_svvh_generic_type of Weightrecision : constant is 1;
end cat_recognizer_tb;
