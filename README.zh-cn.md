**[English](README.md) | [简体中文](README.zh-cn.md)**

# 适用于 Synology DSM 的 VMware Tools

这是将 VMware Tools 的 [open-vm-tools](https://github.com/vmware/open-vm-tools) 实现转换于 [Synology DSM](https://www.synology.com/zh-cn/dsm) 平台上的移植。

在此，您可下载现成的适用于 DSM 的 SPK 安装软件包，以及必要的源代码，以便您亲自编译打包。

**查看其他语言的文档: | [English](README.md) | [简体中文](README.zh-cn.md) |**

## open-vm-tools

open-vm-tools 提供一整套模块和服务，使 VMware 产品可实现更好的管理客户操作系统，以及与客户操作系统进行无缝交互。

具体而言，本次移植实现了与一个在 VMware 上作为虚拟机运行的 Synology DSM 进行交互的功能。典型的主机通常运行 VMware ESXi 虚拟机监视器。

open-vm-tools 是基于 GPL v2 和 GPL v2 兼容许可的开源软件。

如您想查阅更多信息，请访问官方 [open-vm-tools 源存储库](https://github.com/vmware/open-vm-tools)。

## Synology DSM 软件包（SPK）文件

所有 SPK 软件包都列在发布（Release）部分。SPK 软件包的发布版本与 VMware 源项目的版本保持一致。

文件名采用以下命名规则：

```
open-vm-tools_[Arch]-[DSM ver]_[open-vm-tools ver]-[build].spk
```

`[Arch]` 指的是此软件包支持的 CPU 架构。请使用与您的硬件相符的版本。如有疑问，请查阅官方 [Synology 知识库](https://www.synology.com/zh-cn/knowledgebase/DSM/tutorial/Compatibility_Peripherals/What_kind_of_CPU_does_my_NAS_have)。

`[DSM ver]` 指的是此软件包所支持的 Synology DSM 最低版本。

`[open-vm-tools ver]` 指的是此软件包所匹配的 open-vm-tools 源项目的版本。

`[build]` 指打包版本号。请使用最新的版本，以保证您从源项目获得最新的补丁。

例如，在一台运行 DSM 6.5 的型号为 DS3615xs（套件架构: Bromolow）的 Synology NAS 上，如要安装 `open-vm-tools 10.3.10`，请下载名为 `open-vm-tools_bromolow-6.1_10.3.10-xx.spk` 的软件包。此软件包支持 DSM 6.1 及以上版本。

## 组建工具

本项目采用 SynoCommunity 所提供的跨平台编译框架 [spksrc 项目](https://github.com/SynoCommunity/spksrc)来进行编译打包。

spksrc 是基于 BSD 许可的开源软件。

如您想获取更多信息，包括如何编译本项目以及依赖于 spksrc 的其他项目，请访问官方 [SynoCommunity/spksrc 源存储库](https://github.com/SynoCommunity/spksrc)。
