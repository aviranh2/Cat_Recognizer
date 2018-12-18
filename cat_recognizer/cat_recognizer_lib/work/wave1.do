onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/acc_val
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/calculated_acc_val
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/pixel1
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/pixel2
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/pixel3
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/w1
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/w2
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/w3
add wave -noupdate -radix decimal /tb_cat_recognizer_random/checker1/calc_counter
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/calculator/w_ext1
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/calculator/w_ext2
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/calculator/w_ext3
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/calculator/x1
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/calculator/x2
add wave -noupdate -radix decimal /tb_cat_recognizer_random/behavioral_cat_recognizer_o/behavioral_cat_recognizer/calculator/x3
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {1 us}
