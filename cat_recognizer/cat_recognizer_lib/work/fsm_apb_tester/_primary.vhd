library verilog;
use verilog.vl_types.all;
entity fsm_apb_tester is
    generic(
        IDLE            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        SETUP           : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        \ENABLE\        : vl_logic_vector(0 to 1) := (Hi1, Hi0)
    );
    port(
        enable          : in     vl_logic;
        pclock          : out    vl_logic;
        psel            : out    vl_logic;
        penable         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of SETUP : constant is 1;
    attribute mti_svvh_generic_type of \ENABLE\ : constant is 1;
end fsm_apb_tester;
