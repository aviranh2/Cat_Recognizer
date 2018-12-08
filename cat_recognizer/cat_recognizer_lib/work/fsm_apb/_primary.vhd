library verilog;
use verilog.vl_types.all;
entity fsm_apb is
    generic(
        IDLE            : vl_logic_vector(1 downto 0) := (Hi0, Hi0);
        SETUP           : vl_logic_vector(1 downto 0) := (Hi0, Hi1);
        \ENABLE\        : vl_logic_vector(1 downto 0) := (Hi1, Hi0)
    );
    port(
        enable          : out    vl_logic;
        pclock          : in     vl_logic;
        psel            : in     vl_logic;
        penable         : in     vl_logic;
        pwrite          : in     vl_logic;
        rst             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 2;
    attribute mti_svvh_generic_type of SETUP : constant is 2;
    attribute mti_svvh_generic_type of \ENABLE\ : constant is 2;
end fsm_apb;
