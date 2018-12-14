library verilog;
use verilog.vl_types.all;
entity cat_recognizer_tester is
    generic(
        Amba_Word       : integer := 24;
        Amba_Addr_Depth : integer := 13;
        Weightrecision  : integer := 5;
        file_length     : integer := 4096
    );
    port(
        PADDR           : out    vl_logic_vector;
        PENABLE         : out    vl_logic;
        PSEL            : out    vl_logic;
        PWDATA          : out    vl_logic_vector;
        PWRITE          : out    vl_logic;
        clk             : out    vl_logic;
        rst             : out    vl_logic;
        PRDATA          : in     vl_logic_vector;
        CatRecOut       : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Amba_Word : constant is 1;
    attribute mti_svvh_generic_type of Amba_Addr_Depth : constant is 1;
    attribute mti_svvh_generic_type of Weightrecision : constant is 1;
    attribute mti_svvh_generic_type of file_length : constant is 1;
end cat_recognizer_tester;
