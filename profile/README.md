<p align="center">
  <img src="https://github.com/chiselWare/devkit/raw/main/images/chiselWare_Logo_RGB_300.png" alt="chiselWare logo" width="240">
</p>

<p align="center"><b>A standard for certified, silicon-ready Verilog IP.</b></p>

<p align="center">
  <a href="https://chiselware.org">Website &amp; Core Registry</a> ·
  <a href="https://github.com/chiselWare/devkit">Developer's Kit</a> ·
  <a href="https://github.com/chiselWare/00-000-dff">Starter Template</a> ·
  <a href="https://marketplace.microsoft.com/en-us/product/rocksavagetechnologyinc1713893864282.chiselware-ubuntu_24_04?tab=Overview">Azure VM</a>
</p>

---

## Why chiselWare exists

Every ASIC and FPGA flow still runs on Verilog. That's not going away, and chiselWare doesn't ask you to change it. What's missing isn't a new HDL — it's a shared standard for what "verified" actually means before one team's Verilog IP gets dropped into another team's design.

Too much reusable IP in the wild is reusable in name only: verification depth, documentation, and interface conventions vary from repo to repo, so "reuse" usually means "re-verify from scratch" anyway. chiselWare fixes that at the source with a normative standard — the **chiselWare Standard (CWS)** — that a core has to meet, in verification and documentation, before it's certified and listed in the registry.

**The output is standard, synthesizable Verilog.** You don't need to know Chisel, install a Scala toolchain, or touch a line of generator code to use a chiselWare core — it drops into your existing flow like any other Verilog IP block. Chisel is simply the generator technology we build and verify cores with internally: it gives us parameterization, strong typing, and much more thorough test coverage than hand-written RTL typically gets, which is exactly why the Verilog it produces can be held to a real certification standard in the first place.

## Why Chisel?

If the job is producing certified Verilog, it's fair to ask why that pipeline runs through Chisel instead of writing Verilog by hand. Four reasons, in the order they actually matter:

1. **It catches whole classes of bugs Verilog's type system can't.** Inferred latches, incomplete case statements, mismatched bit widths, blocking assignments misused in sequential logic — an entire commercial lint-tool industry exists specifically because Verilog will compile hardware that's subtly wrong. Chisel is strongly and statically typed, so a large share of that error class is rejected by the compiler before a core ever reaches simulation.

2. **It's a more expressive way to say what you mean.** Chisel is embedded in Scala, a language decades newer than Verilog, and inherits real language infrastructure with it: embedded documentation (Scaladoc), package management and dependency resolution (sbt/Maven), structured test frameworks, and code coverage — the tooling maturity modern software ecosystems assume and HDLs typically lack. That's what lets a core capture a designer's actual intent instead of a workaround for the language's limitations.

3. **It's fully open source, with no EDA toll-gate.** Chisel, its FIRRTL/CIRCT compiler backend, and the verification tools we pair it with — Verilator, Yosys, OpenSTA, and others — are all open source, governed under the Linux Foundation's CHIPS Alliance. That's the same open-source-by-default model every other popular software ecosystem runs on, and it's why the chiselWare Standard Software Environment is a free container image rather than a stack of commercial licenses.

4. **It's commercially proven, not a hobbyist bet.** Chisel is the language behind the RISC-V Rocket and BOOM cores, it's used commercially by SiFive, and Google has publicly documented using it to build the Edge TPU. DARPA has cited it as a technology for improving hardware design team efficiency. We picked it because serious engineering organizations already had, at scale.

## What's in this organization

| Repository | What it's for |
|---|---|
| [**devkit**](https://github.com/chiselWare/devkit) | Start here. The chiselWare Developer's Guide, the normative chiselWare Standard, and the pinned Standard Software Environment (Docker/VS Code Dev Container) that every core is built and certified against. |
| [**00-000-dff**](https://github.com/chiselWare/00-000-dff) | The required starting point for every new core — a minimal, fully compliant D flip-flop template. The IP Factory provisions new core repos from this, not from a blank slate. |
| [**ci-workflows**](https://github.com/chiselWare/ci-workflows) | The reusable CI/CD workflows that run certification checks against the Standard. |

## Getting started

**Just need the Verilog?** Browse certified cores in the [IP Factory](https://chiselware.org) and pull the generated RTL directly — no generator toolchain required.

**Building or contributing a core?**
1. Read the **[chiselWare Developer's Guide](https://github.com/chiselWare/devkit/blob/main/chiselWareDevGuide.pdf)** — environment setup, customizing the template, verification, documentation, and certification, start to finish.
2. Pull the **Standard Software Environment** (`ghcr.io/chiselware/dev-full`, or the [Azure Marketplace VM](https://marketplace.microsoft.com/en-us/product/rocksavagetechnologyinc1713893864282.chiselware-ubuntu_24_04?tab=Overview)) so you're building against the exact toolchain every core is certified on.
3. Fork or request a core from the **[00-000-dff](https://github.com/chiselWare/00-000-dff)** template — the required baseline for every new core.
4. Check your work against the **[chiselWare Standard](https://github.com/chiselWare/devkit/blob/main/chiselWareStandard.pdf)** before submitting for certification.

## Certification and the registry

Cores that meet the chiselWare Standard get certified and listed in the **IP Factory** at [chiselware.org](https://chiselware.org) — as Verilog, ready to integrate, with the verification work already done. That's the point: verified once, trusted everywhere.

## Who's behind this

chiselWare is developed and maintained by [Rocksavage Technology](https://rocksavage.tech). If you use chiselWare in academic work, see [devkit/CITATION.md](https://github.com/chiselWare/devkit/blob/main/CITATION.md) for citation formats.

All chiselWare repositories are licensed under Apache-2.0 unless otherwise noted.
