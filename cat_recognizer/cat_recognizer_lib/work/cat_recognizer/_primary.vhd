library verilog;
use verilog.vl_types.all;
entity cat_recognizer is
    generic(
        Amba_Word       : integer := 24;
        Amba_Addr_Depth : integer := 12;
        Weight_precision: integer := 5
    );
    port(
        PADDR           : in     vl_logic_vector;
        PENABLE         : in     vl_logic;
        PSEL            : in     vl_logic;
        PWDATA          : in     vl_logic_vector;
        PWRITE          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PRDATA          : out    vl_logic_vector;
        CatRecOut       : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Amba_Word : constant is 1;
    attribute mti_svvh_generic_type of Amba_Addr_Depth : constant is 1;
    attribute mti_svvh_generic_type of Weight_precision : constant is 1;
end cat_recognizer;
