# VTX Toolchains

> **High-availability Musl cross-compilation toolchains mirror for the VTX ecosystem.**

This repository automatically synchronizes and repacks static toolchains from `musl.cc`. It serves as the primary compiler source for `vtx-ffmpeg-release` to ensure CI stability and build determinism.

## Supported Toolchains

| Architecture | Target Triple | Source | Status |
| :--- | :--- | :--- | :--- |
| **x86_64** | `x86_64-linux-musl` | musl.cc | ![Sync](https://github.com/Vtxdeo/vtx-toolchains/actions/workflows/sync.yml/badge.svg) |
| **AArch64** | `aarch64-linux-musl` | musl.cc | ![Sync](https://github.com/Vtxdeo/vtx-toolchains/actions/workflows/sync.yml/badge.svg) |
| **ARMv7** | `arm-linux-musleabi` | musl.cc | ![Sync](https://github.com/Vtxdeo/vtx-toolchains/actions/workflows/sync.yml/badge.svg) |
| **MIPS** | `mipsel-linux-musl` | musl.cc | ![Sync](https://github.com/Vtxdeo/vtx-toolchains/actions/workflows/sync.yml/badge.svg) |
| **RISC-V** | `riscv64-linux-musl` | musl.cc | ![Sync](https://github.com/Vtxdeo/vtx-toolchains/actions/workflows/sync.yml/badge.svg) |

## Usage in CI

```bash
# Example: Download x86_64 toolchain
wget [https://github.com/Vtxdeo/vtx-toolchains/releases/download/toolchain-latest/x86_64-linux-musl-cross.tgz](https://github.com/Vtxdeo/vtx-toolchains/releases/download/toolchain-latest/x86_64-linux-musl-cross.tgz)

```

## License

Repackaged scripts are under [MIT License](LICENSE). The toolchains themselves are subject to the licenses of their respective upstream projects (GCC, Musl, Binutils).