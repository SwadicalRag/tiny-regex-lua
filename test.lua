local module = dofile("re.lua")

module.init()

local pat = module.bindings.global.re_compile("[0-9]+test")
print(module.bindings.global.re_matchp(pat,"the Nice test"))
print(module.bindings.global.re_matchp(pat,"the Very Nice 420test"))
