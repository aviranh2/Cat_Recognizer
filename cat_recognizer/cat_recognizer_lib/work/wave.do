onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/rst
add wave -noupdate /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/apb_interface/enable
add wave -noupdate -radix decimal {/tb_cat_recognizer_random/checker1/registers[0]}
add wave -noupdate -radix decimal {/tb_cat_recognizer_random/checker1/registers[5]}
add wave -noupdate -radix decimal {/tb_cat_recognizer_random/checker1/registers[4]}
add wave -noupdate -radix decimal {/tb_cat_recognizer_random/checker1/registers[3]}
add wave -noupdate -radix decimal {/tb_cat_recognizer_random/checker1/registers[2]}
add wave -noupdate -radix decimal {/tb_cat_recognizer_random/checker1/registers[1]}
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/PENABLE
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/PSEL
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/PWRITE
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/clk
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/PADDR
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/PWDATA
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/PRDATA
add wave -noupdate -radix decimal /tb_cat_recognizer_random/TbInterface/CatRecOut
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/last_result
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/last_out
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/acc_val
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/read_address
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/clock_counter
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {205106 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 620
configure wave -valuecolwidth 39
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {163880 ns} {164082 ns}
