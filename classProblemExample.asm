li x5, 0x11000000
lhu x6, 0(x5)
lhu x7, 0(x5)
lhu x8, 0(x5)
add x9, x8,x7
add x10,x9,x6
sh x10, 0x20(x5)
