**[English](README.md) | [简体中文](README.zh-cn.md)**

# VMware Tools for Synology DSM

This is a port of the [open-vm-tools](https://github.com/vmware/open-vm-tools) implementation of VMware Tools to the [Synology DSM](https://www.synology.com/en-global/dsm) platform.

Here you will find ready-built binary installable SPK packages for DSM, together with the necessary sources, should you choose to build it yourself.

**Read this in other languages: | [English](README.md) | [简体中文](README.zh-cn.md) |**

## open-vm-tools

_open-vm-tools_ is a set of services and modules that enable several features in VMware products for better management of, and seamless user interactions with, guest operating systems.

Specifically, this port enables interaction with a virtualised Synology DSM running as a VMware guest VM. A typical host runs the VMware ESXi hypervisor.

_open-vm-tools_ is open source software released under GPL v2 and GPL v2 compatible licenses.

More information can be found at the official [open-vm-tools source repository](https://github.com/vmware/open-vm-tools).

## Synology DSM Package (SPK) Files

SPK packages are found under the Release section. SPK releases track _open-vm-tools_ versions from the upstream project.

Filenames are in the form

```
open-vm-tools_[Arch]-[DSM ver]_[open-vm-tools ver]-[build].spk
```

`[Arch]` is the CPU architecture supported by the package. Use the correct one that matches the intended Synology hardware model. This can be found in the official [Synology knowledge base](https://www.synology.com/en-global/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have).

`[DSM ver]` is the minimum Synology DSM version supported by the package.

`[open-vm-tools ver]` is the _open-vm-tools_ version matching the upstream releases.

`[build]` is the incremental build number. Get the latest available to benefit from more recent patches built from upstream hotfixes.

For example, to install `open-vm-tools 10.3.10` on a Synology NAS model DS3615xs (Package Arch: Bromolow) running DSM 6.5, download a package file named `open-vm-tools_bromolow-6.1_10.3.10-xx.spk` which supports DSM versions 6.1 and above.

## Build Tooling

Builds are created using the cross-compilation framework provided by the [spksrc project](https://github.com/SynoCommunity/spksrc) from SynoCommunity.

_spksrc_ is open source software released under the BSD license.

More information, including instructions to build this and many other projects relying on _spksrc_, can be found at the official [SynoCommunity/spksrc source repository](https://github.com/SynoCommunity/spksrc).
