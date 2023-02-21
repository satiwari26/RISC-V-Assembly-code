.eqv SWITCHES 0x11000000

li x5, SWITCHES
lh x6, 0(x5)
neg x7, x6
sh x7, 0x20(x5)