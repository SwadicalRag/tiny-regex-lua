CC := /opt/wasi-sdk/bin/clang

# Flags to pass to compiler
CFLAGS :=  --target=wasm32-wasi --sysroot=/home/swadical/wasi-sysroot/sysroot -O3 -Wl,-z,stack-size=6000000,--allow-undefined,-export-dynamic -fvisibility=hidden

bindgen:
	lua-webidl re.idl bindings.cpp re.h --libmode --cpp

wasm: bindgen
	@$(CC) $(CFLAGS) re.c bindings.cpp -o re.wasm

all: wasm
	wasm2lua re.wasm re.lua -b re.idl --libmode --pureLua

clean:
	@rm -f re.wasm
	@rm -f re.lua
	@rm -f bindings.cpp

