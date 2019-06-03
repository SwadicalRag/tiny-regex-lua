# tiny-regex-lua

[tiny-regex-c](https://github.com/kokke/tiny-regex-c/blob/master/Makefile) compiled to lua via `wasm2lua`

## Building

`make all`

Make sure you have wasm2lua and wasi-sdk installed

## Usage

```lua
local module = dofile("re.lua")

module.init()

local pat = module.bindings.global.re_compile("[0-9]+test")
print(module.bindings.global.re_matchp(pat,"the Nice test"))
print(module.bindings.global.re_matchp(pat,"the Very Nice 420test"))

```
