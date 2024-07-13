# EMMC、Nor Flash和Nand Flash

Flash 全名为Flash Memory，我们平时一般叫“闪存”，是存储芯片的一种。它结合了ROM和RAM的长处，不仅具备电子可擦除可编程（EEPROM）的性能，还可以快速读取数据（NVRAM的优势），使数据不会因为断电而丢失。Flash可以通过特定的程序修改里面的程序。

### EMMC

EMMC全称为Embeded MultiMedia Card，是一种嵌入式非易失性存储器系统，由[NAND](https://so.csdn.net/so/search?q=NAND\&spm=1001.2101.3001.7020) flash和NAND flash控制器组成，以BGA方式封装在一款chip上。

这里主要重点讲的是EMMC和NAND flash 之间的区别，主要区别如下：

(1)在组成结构上：EMMC存储芯片简化了存储器的设计，将NAND Flash芯片和控制芯片以MCP技术封装在一起，省去零组件耗用电路板的面积，同时也让手机厂商或是计算机厂商在设计新产品时的便利性大大提高。而NAND Flash仅仅只是一块存储设备，若要进行数据传输的话，只能通过主机端的控制器来进行操作。

(2)在功能上：EMMC则在其内部集成了 Flash Controller，包括了协议、擦写均衡、坏块管理、ECC校验、电源管理、时钟管理、数据存取等功能。相比于直接将NAND Flash接入到Host 端，EMMC屏蔽了 NAND Flash 的物理特性，可以减少 Host 端软件的复杂度，让 Host 端专注于上层业务，省去对 NAND Flash 进行特殊的处理。同时，EMMC通过使用Cache、Memory Array 等技术，在读写性能上也比 NAND Flash要好很多。而NAND Flash 是直接接入 Host 端的，Host 端通常需要有 NAND Flash Translation Layer，即 NFTL 或者 NAND Flash 文件系统来做坏块管理、ECC等的功能。另一方面，EMMC的读写速度也比NAND Flash的读写速度快，EMMC的读写可高达每秒50MB到100MB以上。

### NOR Flash

*   **连接方式**：NOR Flash的存储单元通过并行方式连接，使得它能够提供随机访问功能。
*   **读取速度**：通常比NAND Flash快，适合用作执行代码的存储介质（如启动固件或BIOS）。
*   **写入和擦除速度**：*相对*较慢。
*   **存储密度**：低于NAND Flash，因此单位存储成本更高。
*   **耐用性**：写入/擦除周期通常比NAND Flash少。

NOR Flash通常用于存储小容量的关键代码，如电脑的BIOS或者嵌入式系统的固件，因为它能够提供足够快的读取速度来直接执行代码。

### NAND Flash

*   **连接方式**：NAND Flash的存储单元通过串行方式连接，这导致了只能进行页式访问（通常一页大小为4KB或更多）。
*   **读取速度**：页式访问使得随机读取速度慢于NOR Flash，但是顺序读取速度很快。
*   **写入和擦除速度**：比NOR Flash快，特别是在处理大量数据时。
*   **存储密度**：高于NOR Flash，因此单位存储成本更低。
*   **耐用性**：写入/擦除周期比NOR Flash多，适合用作大容量数据存储。

NAND Flash通常用于需要大容量存储的设备，如固态硬盘(SSD)、USB闪存驱动器、智能手机和平板电脑的存储。

总结来说，NOR Flash适用于需要频繁随机读取的应用，而NAND Fl ash则适用于大容量和顺序数据存储的应用。随着技术的发展，NAND Flash因其较高的存储密度和较低的成本而变得更加流行，尤其是在移动设备和固态存储市场。
