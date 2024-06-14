# justfile (https://github.com/casey/just)

# use powershell on windows
set windows-powershell := true

# select toolchain
CHANNEL := ''
#CHANNEL := '+stable'
#CHANNEL := '+nightly'
#CHANNEL := '+1.54'

# extra cargo args
CARGO_ARGS := '--locked'

# configure log
export RUST_LOG := 'trace,cargo=warn,hyper=warn,reqwest=warn'

# capture backtraces
export RUST_BACKTRACE := '1'

# enable nightly features in stable rustc
# export RUSTC_BOOTSTRAP := 1

# default
[private]
default:
    @{{ just_executable() }} --list --unsorted --justfile "{{ justfile() }}"

# list all currently installed rust binaries
list:
    cargo {{ CHANNEL }} install --list

# one-stop shopping
all *ARGS='': rustup (install ARGS)

# update toolchain
rustup:
    rustup -v upgrade

# install/update all
install *ARGS='': \
    (cargo-binstall ARGS) \
    (cargo-bloat ARGS) \
    (cargo-cache ARGS) \
    (cargo-component ARGS) \
    (cargo-cyclonedx ARGS) \
    (cargo-edit ARGS) \
    (cargo-expand ARGS) \
    (cargo-leptos ARGS) \
    (cargo-machete ARGS) \
    (cargo-make ARGS) \
    (cargo-outdated ARGS) \
    (cargo-shuttle ARGS) \
    (cargo-tarpaulin ARGS) \
    (cargo-wasi ARGS) \
    (cargo-watch ARGS) \
    (elf2uf2-rs ARGS) \
    (espflash ARGS) \
    (espmonitor ARGS) \
    (flip-link ARGS) \
    (ldproxy ARGS) \
    (miniserve ARGS) \
    (probe-rs ARGS) \
    (probe-rs-debugger ARGS) \
    (probe-run ARGS) \
    (trunk ARGS) \
    (wasm-pack ARGS) \
    (just ARGS) # should be the last, because it will fail, if it is rebuilt

# low-complexity mechanism for installing rust binaries
cargo-binstall *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-binstall {{ ARGS }}

# find out what takes most of the space in your executable
cargo-bloat *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-bloat {{ ARGS }}

# display/prune cargo's cache
cargo-cache *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-cache {{ ARGS }}

# build WebAssembly components
cargo-component *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-component {{ ARGS }}

# generate SBOM
cargo-cyclonedx *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-cyclonedx {{ ARGS }}

# manage cargo dependencies from the command line
cargo-edit *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-edit {{ ARGS }}

# show result of macro expansion
cargo-expand *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-expand {{ ARGS }}

# build tool for leptos
cargo-leptos *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-leptos {{ ARGS }}

# find unused dependencies
cargo-machete *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-machete {{ ARGS }}

# command/task runner
cargo-make *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-make {{ ARGS }}

# find and display outdated dependencies
cargo-outdated *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-outdated {{ ARGS }}

# deploy web-apps on shuttle
cargo-shuttle *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-shuttle {{ ARGS }}

# code coverage reporting tool
cargo-tarpaulin *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-tarpaulin {{ ARGS }}

# simplify building code for the wasm32-wasi target
cargo-wasi *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-wasi {{ ARGS }}

# runs Cargo commands whenever project's source for change
cargo-watch *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} cargo-watch {{ ARGS }}

# ELF to UF2 converter
elf2uf2-rs *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} elf2uf2-rs {{ ARGS }}

# serial flasher utilities for espressif devices
espflash *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} espflash {{ ARGS }}

# monitoring ESP32/ESP8266 execution
espmonitor *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} espmonitor {{ ARGS }}

# adds zero-cost stack overflow protection to embedded programs
flip-link *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} flip-link {{ ARGS }}

# command/task runner
just *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} just {{ ARGS }}

# simple tool to forward linker arguments
ldproxy *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} ldproxy {{ ARGS }}

# serve files and dirs over http
miniserve *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} miniserve {{ ARGS }}

# A collection of on chip debugging tools to communicate with microchips.
probe-rs *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} probe-rs-tools {{ ARGS }}

# ???
probe-rs-debugger *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} probe-rs-debugger {{ ARGS }}

# run firmware on embedded devices
probe-run *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} probe-run {{ ARGS }}

# wasm web application bundler
trunk *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} trunk {{ ARGS }}

# rust -> wasm workflow tool
wasm-pack *ARGS='':
    -cargo {{ CHANNEL }} install {{ CARGO_ARGS }} wasm-pack {{ ARGS }}
