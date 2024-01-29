# justfile (https://github.com/casey/just)

# use powershell on windows
set windows-powershell := true

# select toolchain
CHANNEL := ''
#CHANNEL := '+stable'
#CHANNEL := '+nightly'
#CHANNEL := '+1.54'

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

# install/update all
all *ARGS='': \
    (cargo-bloat ARGS) \
    (cargo-cache ARGS) \
    (cargo-edit ARGS) \
    (cargo-expand ARGS) \
    (cargo-leptos ARGS) \
    (cargo-make ARGS) \
    (cargo-outdated ARGS) \
    (cargo-shuttle ARGS) \
    (cargo-tarpaulin ARGS) \
    (cargo-wasi ARGS) \
    (cargo-watch ARGS) \
    (espflash ARGS) \
    (espmonitor ARGS) \
    (flip-link ARGS) \
    (just ARGS) \
    (ldproxy ARGS) \
    (miniserve ARGS) \
    (probe-rs ARGS) \
    (probe-rs-debugger ARGS) \
    (probe-run ARGS) \
    (trunk ARGS) \
    (wasm-pack ARGS)

# list all currently installed rust binaries
list:
    cargo install --list

# find out what takes most of the space in your executable
cargo-bloat *ARGS='':
    cargo {{ CHANNEL }} install cargo-bloat {{ ARGS }}

# display/prune cargo's cache
cargo-cache *ARGS='':
    cargo {{ CHANNEL }} install cargo-cache {{ ARGS }}

# manage cargo dependencies from the command line
cargo-edit *ARGS='':
    cargo {{ CHANNEL }} install cargo-edit {{ ARGS }}

# show result of macro expansion
cargo-expand *ARGS='':
    cargo {{ CHANNEL }} install cargo-expand {{ ARGS }}

# build tool for leptos
cargo-leptos *ARGS='':
    cargo {{ CHANNEL }} install cargo-leptos {{ ARGS }}

# command/task runner
cargo-make *ARGS='':
    cargo {{ CHANNEL }} install cargo-make {{ ARGS }}

# find and display outdated dependencies
cargo-outdated *ARGS='':
    cargo {{ CHANNEL }} install cargo-outdated {{ ARGS }}

# deploy web-apps on shuttle
cargo-shuttle *ARGS='':
    cargo {{ CHANNEL }} install cargo-shuttle {{ ARGS }}

# code coverage reporting tool
cargo-tarpaulin *ARGS='':
    cargo {{ CHANNEL }} install cargo-tarpaulin {{ ARGS }}

# simplify building code for the wasm32-wasi target
cargo-wasi *ARGS='':
    cargo {{ CHANNEL }} install cargo-wasi {{ ARGS }}

# runs Cargo commands whenever project's source for change
cargo-watch *ARGS='':
    cargo {{ CHANNEL }} install cargo-watch {{ ARGS }}

# serial flasher utilities for espressif devices
espflash *ARGS='':
    cargo {{ CHANNEL }} install espflash {{ ARGS }}

# monitoring ESP32/ESP8266 execution
espmonitor *ARGS='':
    cargo {{ CHANNEL }} install espmonitor {{ ARGS }}

# adds zero-cost stack overflow protection to embedded programs
flip-link *ARGS='':
    cargo {{ CHANNEL }} install flip-link {{ ARGS }}

# command/task runner
just *ARGS='':
    cargo {{ CHANNEL }} install just {{ ARGS }}

# simple tool to forward linker arguments
ldproxy *ARGS='':
    cargo {{ CHANNEL }} install ldproxy {{ ARGS }}

# serve files and dirs over http
miniserve *ARGS='':
    cargo {{ CHANNEL }} install miniserve {{ ARGS }}

# embedded toolkit
probe-rs *ARGS='':
    cargo {{ CHANNEL }} install probe-rs --features cli {{ ARGS }}

# ???
probe-rs-debugger *ARGS='':
    cargo {{ CHANNEL }} install probe-rs-debugger {{ ARGS }}

# run firmware on embedded devices
probe-run *ARGS='':
    cargo {{ CHANNEL }} install probe-run {{ ARGS }}

# wasm web application bundler
trunk *ARGS='':
    cargo {{ CHANNEL }} install trunk {{ ARGS }}

# rust -> wasm workflow tool
wasm-pack *ARGS='':
    cargo {{ CHANNEL }} install wasm-pack {{ ARGS }}
