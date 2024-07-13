![image.png](https://note.youdao.com/yws/res/2522/WEBRESOURCEc844c7bf070d40ef85d71f1d8813e321)

## 什么是文件系统（组织和管理系统文件）

![image.png](https://note.youdao.com/yws/res/2520/WEBRESOURCE325c95789fd147d99f64a4358d40ebd3)

## 什么是根文件系统

![image.png](https://note.youdao.com/yws/res/2523/WEBRESOURCE2b1201f0c5a6457291c2aa3676d7be4e)

## 根文件系统目录介绍

![image.png](https://note.youdao.com/yws/res/2519/WEBRESOURCE44c3df7a9dfe404fbd05b8b0da0510ab)

![image.png](https://note.youdao.com/yws/res/2521/WEBRESOURCE006e4a24e5494ec19a79746a5ccdd29b)

![image.png](https://note.youdao.com/yws/res/2516/WEBRESOURCEe6e5da2efd9f48e2807a5dca5d09f2de)

![image.png](https://note.youdao.com/yws/res/2524/WEBRESOURCE4f02b0f116cd414588b9fbc5947f38a2)

![image.png](https://note.youdao.com/yws/res/2517/WEBRESOURCE01ccfe27301e41ddb6b4135816089998)

![image.png](https://note.youdao.com/yws/res/2518/WEBRESOURCE8c67c71bfaf34eee909de2bd702f69b8)

# busybox

BusyBox 是一个将多个 UNIX 命令和工具集成到一个单一可执行文件中的软件。它被设计用于嵌入式系统，以减少磁盘占用和内存使用。BusyBox 提供了一个精简的环境，包含了一些最常用的命令行工具和工具程序，如 `ls`、`cp`、`mv`、`mount`、`telnet`、`httpd`、`init` 等。

BusyBox 可以配置为包含一组特定的工具，这取决于目标系统的需求和资源限制。这种配置性使得 BusyBox 非常适合用于资源受限的嵌入式系统。

在嵌入式 Linux 系统中，BusyBox 通常用作：

*   **命令行接口**：提供标准的 Unix 命令行工具，用于系统管理和调试。
*   **系统初始化**：作为 `init` 程序，负责启动系统并运行启动脚本。
*   **替代完整的 GNU 工具链**：在资源受限的系统中，BusyBox 提供了一个比完整 GNU 工具链更轻量级的解决方案。

BusyBox 的安装和配置通常涉及以下步骤：

1.  **配置**：可以通过图形化配置工具（如 `make menuconfig`）或手动编辑 `.config` 文件来选择要包含在 BusyBox 可执行文件中的命令和功能。
2.  **编译**：使用交叉编译工具链编译 BusyBox，生成适用于目标嵌入式系统的二进制文件。
3.  **安装**：将编译好的 BusyBox 二进制文件复制到目标系统的文件系统中的适当位置。
4.  **创建符号链接**：为 BusyBox 可执行文件创建一组符号链接，每个链接对应于 BusyBox 支持的命令。这样，当用户尝试执行任何这些命令时，实际上都是执行的 BusyBox 可执行文件。

例如，如果你有一个名为 `busybox` 的可执行文件，你可以为 `ls` 命令创建一个符号链接，如下所示：

    ln -s /bin/busybox /bin/ls

当你在命令行中输入 `ls` 时，系统会调用 `/bin/busybox`，并传递 `ls` 作为参数，BusyBox 会识别这个参数并执行相应的 `ls` 命令功能。

#### busybox打包

![image.png](https://note.youdao.com/yws/res/2525/WEBRESOURCEf7f56ac1cd0e40ce95179919c0efa142)

![image.png](https://note.youdao.com/yws/res/2526/WEBRESOURCEc28becf91bf043f3bddeb20e373cbc1a)

### **交叉编译工具**

交叉编译工具（Cross-Compiler）是一种编译器，能够为与编译器本身运行的平台（宿主系统）不同的平台（目标系统）生成可执行代码。这是在开发嵌入式系统或操作系统时常用的工具，因为这些系统的硬件平台（目标平台）通常与开发者使用的硬件（宿主平台）不同。

例如，如果你在一台 x86 架构的电脑上（宿主系统）开发一个针对 ARM 架构的嵌入式设备（目标系统）的软件，你会需要一个 x86 到 ARM 的交叉编译器。

### 交叉编译工具链的组成

一个典型的交叉编译工具链包括：

*   **交叉编译器**（Cross-Compiler）：**将源代码编译成目标平台的机器代码**。
*   **交叉汇编器**（Cross-Assembler）：将汇编语言转换为目标平台的机器代码。
*   **链接器**（Linker）：将多个对象文件（编译器和汇编器生成的输出）链接成一个单一的可执行文件，解决符号引用和地址分配。
*   **库**（Libraries）：目标平台的标准库和其他库文件，编译器和链接器会使用这些库来编译和链接程序。
*   **调试器**（Debugger）：用于目标平台的调试工具，可以远程调试目标系统上运行的程序。

### 常见的交叉编译工具链

*   **GNU Compiler Collection (GCC)**：提供了广泛支持的交叉编译器，可以编译 C、C++、Java、Fortran、Ada 等语言。
*   **Clang/LLVM**：一个模块化和可重用的编译器和工具链技术的集合，支持多种编程语言。
*   **CodeSourcery/Mentor Graphics Toolchain**：基于 GCC，但进行了优化和增强，特别是针对嵌入式系统。
*   **Yocto Project**：一个协作项目，提供了一个框架来帮助开发者创建定制的 Linux 分发版，适用于嵌入式设备，包括交叉编译工具链。
*   **crosstool-NG**：一个交叉编译工具链生成器，可以用来构建交叉编译工具链。

### 设置交叉编译环境

为了设置交叉编译环境，开发者需要：

1.  **选择或构建交叉编译工具链**：可以使用预先构建的工具链，或者使用工具如 crosstool-NG 自己构建。
2.  **配置环境变量**：如 `PATH`，以便在命令行中方便地调用交叉编译器和工具。
3.  **配置编译系统**：确保构建系统（如 Makefile 或构建脚本）使用正确的编译器和工具链路径。

### 交叉编译的挑战

交叉编译可能会遇到的挑战包括：

*   **库依赖性**：确保目标系统上有正确版本的库。
*   **头文件**：需要目标平台的正确头文件来编译程序。
*   **二进制兼容性**：编译出的程序必须与目标硬件兼容。
*   **调试困难**：可能需要特殊的调试工具或在目标硬件上运行调试器。

交叉编译是嵌入式系统开发的一个重要方面，因为它使得开发者能够在功能强大的宿主机上进行**软件开发和编译**，同时生成适用于资源受限的**目标硬件**的代码。

## Buildroot

Buildroot 是一个开源的、简化嵌入式 Linux 系统开发的工具，它使用 makefile 和 kconfig（与 Linux 内核配置系统相同的配置系统）来自动化构建过程。Buildroot 能够生成交叉编译工具链、根文件系统、Linux 内核映像以及引导加载程序，并且可以为不同的目标架构进行配置和编译。

Buildroot 的主要优点是它的简单性和配置的灵活性。使用 Buildroot，开发者可以快速地为嵌入式系统生成轻量级、定制化的 Linux 环境。

### Buildroot 的主要特点：

*   **简化的配置**：通过图形界面（`make menuconfig`）、命令行界面（`make xconfig` 或 `make nconfig`）或直接编辑配置文件来选择所需的软件包和系统配置。
*   **自动生成工具链**：自动下载、配置、编译并安装交叉编译工具链。
*   **软件包管理**：包含数千个可用的软件包，可以通过 Buildroot 的配置系统选择并配置这些软件包。
*   **文件系统生成**：支持多种文件系统类型，如 ext2/3/4、btrfs、squashfs、jffs2 等，可以根据需要生成镜像文件。
*   **引导加载器支持**：支持多种引导加载器，如 U-Boot、GRUB、Barebox 等。
*   **定制化**：允许开发者添加定制的软件包和补丁，以及调整内核和系统设置。
*   **轻量级**：生成的系统非常适合资源受限的嵌入式设备。

### 使用 Buildroot 的步骤：

1.  **下载 Buildroot**：从官方网站下载最新的 Buildroot 源代码。
2.  **配置 Buildroot**：运行 `make menuconfig`，选择目标架构、工具链、内核配置、软件包和文件系统选项等。
3.  **构建系统**：运行 `make` 命令开始构建过程。Buildroot 会下载源代码，构建交叉编译工具链，编译内核，构建选定的软件包，并生成根文件系统镜像。
4.  **部署和测试**：将构建的系统镜像烧录到目标设备（如 SD 卡、NAND 闪存等），然后在目标硬件上启动并测试。

### Buildroot 的挑战：

*   **学习曲线**：新用户可能需要一些时间来熟悉 Buildroot 的配置和使用。
*   **定制化**：虽然 Buildroot 提供了大量的配置选项，但对于非常特殊的定制需求，用户可能需要编写额外的 makefile 或补丁。
*   **软件包更新**：Buildroot 社区提供软件包更新，但用户可能需要手动更新特定软件包或等待 Buildroot 社区更新。

**Buildroot** 是一个强大的工具，特别适合于那些需要快速、高效地为嵌入式设备生成定制 Linux 系统的场景。

![image.png](https://note.youdao.com/yws/res/2527/WEBRESOURCE918352118d17c9111d8d417ad59abb91)
