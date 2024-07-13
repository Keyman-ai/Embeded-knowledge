### 编译器debug模式和release模式

编译器中的Debug模式和Release模式是两种不同的编译配置，主要用于满足不同阶段的开发需求。以下是它们的主要区别和特点：

#### Debug模式

1.  **目标**：用于调试程序。
2.  **优化**：通常**关闭优化**，以便让代码更容易调试。
3.  **调试信息**：生成详细的调试信息，例如变量名称、行号等，使得开发者可以使用调试工具（如GDB或IDE内置调试器）逐行跟踪代码。
4.  **代码大小**：生成的可执行文件较大，因为包含了调试信息和未优化的代码。
5.  **性能**：执行速度较慢，因为没有进行优化，并且可能包含额外的调试代码。
6.  **错误检查**：通常包含更多的运行时检查，比如数组越界、未初始化变量等。

#### Release模式

1.  **目标**：用于发布和运行最终版本的程序。
2.  **优化**：开启各种优化，以提高程序的执行效率和减少内存占用。
3.  **调试信息**：通常不包含调试信息，使得可执行文件较小且更难以逆向工程。
4.  **代码大小**：生成的可执行文件较小，因为进行了代码优化并移除了调试信息。
5.  **性能**：执行速度较快，因为进行了各种优化处理。
6.  **错误检查**：可能关闭一些运行时检查，以提高性能，但这也意味着某些错误可能在调试时不会被发现。

#### 具体区别总结

*   **编译优化**：Debug模式关闭优化，Release模式开启优化。
*   **调试信息**：Debug模式包含调试信息，Release模式不包含。
*   **错误检查**：Debug模式包含更多的运行时检查，Release模式可能减少检查以提升性能。
*   **可执行文件大小**：Debug模式生成较大的可执行文件，Release模式生成较小的可执行文件。
*   **执行性能**：Debug模式性能较低，Release模式性能较高。

#### 使用场景

*   **Debug模式**：在开发和调试阶段使用，方便查找和修复错误。
*   **Release模式**：在发布和部署阶段使用，确保程序运行效率和资源使用优化。

**Makefile区分release和debug，执行不同的编译命令**

```c
# 默认为debug模式
MODE ?= debug

# 定义编译器和编译选项
CC = gcc
CFLAGS_common = -Wall
CFLAGS_debug = -g
CFLAGS_release = -O3

# 根据MODE设置不同的编译选项
ifeq ($(MODE),debug)
    CFLAGS += $(CFLAGS_common) $(CFLAGS_debug)
else
    CFLAGS += $(CFLAGS_common) $(CFLAGS_release)
endif

# 默认目标为all
all: myprogram

# 根据MODE编译链接生成可执行文件
myprogram: main.o utils.o
	$(CC) $(CFLAGS) -o $@ $^

# 编译main.c生成目标文件
main.o: main.c
	$(CC) $(CFLAGS) -c $<

# 编译utils.c生成目标文件
utils.o: utils.c
	$(CC) $(CFLAGS) -c $<

# 清理生成的文件
clean:
	rm -f *.o myprogram
```

### Makefile编译选项详解

在Makefile中，编译选项用于指定编译器如何处理源代码，并控制生成的目标文件和可执行文件的行为。下面详细解释几个常用的编译选项及其作用：

### 1. `CC` 和 `CFLAGS`

*   **`CC`**：指定编译器的命令。例如：

    ```c
    CC = gcc
    ```

    这里指定了使用`gcc`编译器。
*   **`CFLAGS`**：指定编译器的选项。例如：

    ```c
    CFLAGS = -Wall -O2
    ```

    *   `-Wall`：开启所有警告信息。
    *   `-O2`：开启优化级别2，进行一些中级优化，提升代码性能。

### 2. `CPPFLAGS`

*   **`CPPFLAGS`**：预处理器选项，用于传递给预处理器（如`gcc -E`）。例如：

    ```c
    CPPFLAGS = -DDEBUG -Iinclude
    ```

    *   `-DDEBUG`：定义一个名为`DEBUG`的宏。
    *   `-Iinclude`：告诉编译器在`include`目录中查找头文件。

### 3. `LDFLAGS` 和 `LDLIBS`

*   **`LDFLAGS`**：链接器选项，用于传递给链接器（如`gcc`）。例如：

    ```c
    LDFLAGS = -Llib
    ```

    *   `-Llib`：告诉链接器在`lib`目录中查找库文件。
*   **`LDLIBS`**：链接的库文件。例如：

    ```c
    LDLIBS = -lm
    ```

    *   `-lm`：链接数学库`libm`。

下面是一个示例的Makefile，结合了上述选项的使用：

```c
# 编译器和编译选项
CC = gcc
CFLAGS = -Wall -O2

# 链接器选项和库文件
LDFLAGS = -Llib
LDLIBS = -lm

# 预处理器选项
CPPFLAGS = -DDEBUG -Iinclude

# 默认目标为all
all: myprogram

# 编译链接生成可执行文件
myprogram: main.o utils.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LDLIBS)

# 编译main.c生成目标文件
main.o: main.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# 编译utils.c生成目标文件
utils.o: utils.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# 清理生成的文件
clean:
	rm -f *.o myprogram
```

### makefile定义宏给.c文件使用

在Makefile中定义宏常量并供`.c`文件使用，可以通过`CPPFLAGS`变量来传递预处理器选项，包括定义宏常量。下面是一个具体示例，演示如何在Makefile中定义宏常量并让`.c`文件中可以使用：

```c
# 定义宏常量
CPPFLAGS += -DVERSION=\"1.0.0\"
CPPFLAGS += -DDEBUG

# 编译器和编译选项
CC = gcc
CFLAGS = -Wall

# 默认目标为all
all: myprogram

# 编译链接生成可执行文件
myprogram: main.o utils.o
	$(CC) $(CFLAGS) $(CPPFLAGS) -o $@ $^

# 编译main.c生成目标文件
main.o: main.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# 编译utils.c生成目标文件
utils.o: utils.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

# 清理生成的文件
clean:
	rm -f *.o myprogram
```

### 使用方法：

*   将上述Makefile保存为`Makefile`文件，并放置在项目的根目录下。
*   在Makefile中使用`CPPFLAGS += -D`来定义需要的宏常量，可以定义多个宏常量。
*   在`.c`文件中，可以直接使用宏名（例如`VERSION`和`DEBUG`）来引用定义的宏常量，如`printf("Version: %s\n", VERSION);` 和 `#ifdef DEBUG` 这样通过这

### -O0 -O1 -O2 -O3 四级优化选项及每级分别做什么优化

**-O0**： 不做任何优化，这是默认的编译选项。
**-O1**：优化会消耗少多的编译时间，它主要对代码的分支，常量以及表达式等进行优化。
**-O和-O1**： 对程序做部分编译优化，对于大函数,优化编译占用稍微多的时间和相当大的内存。使用本项优化，编译器会尝试减小生成代码的尺寸，以及缩短执行时间，但并不执行需要占用大量编译时间的优化。

打开的优化选项：

l -fdefer-pop：延迟栈的弹出时间。当完成一个函数调用，参数并不马上从栈中弹出，而是在多个函数被调用后，一次性弹出。

l -fmerge-constants：尝试横跨编译单元合并同样的常量(string constants and floating point constants)

l -fthread-jumps：如果某个跳转分支的目的地存在另一个条件比较,而且该条件比较包含在前一个比较语句之内,那么执行本项优化.根据条件是true或者false,前面那条分支重定向到第二条分支的目的地或者紧跟在第二条分支后面.

l -floop-optimize：执行循环优化,将常量表达式从循环中移除，简化判断循环的条件，并且optionally do strength-reduction，或者将循环打开等。在大型复杂的循环中，这种优化比较显著。

l -fif-conversion：尝试将条件跳转转换为等价的无分支型式。优化实现方式包括条件移动，min，max，设置标志，以及abs指令，以及一些算术技巧等。

l -fif-conversion2基本意义相同，没有找到更多的解释。

l -fdelayed-branch：这种技术试图根据指令周期时间重新安排指令。 它还试图把尽可能多的指令移动到条件分支前, 以便最充分的利用处理器的治理缓存。

l -fguess-branch-probability：当没有可用的profiling feedback或\_\_builtin\_expect时，编译器采用随机模式猜测分支被执行的可能性，并移动对应汇编代码的位置，这有可能导致不同的编译器会编译出迥然不同的目标代码。

l -fcprop-registers：因为在函数中把寄存器分配给变量, 所以编译器执行第二次检查以便减少调度依赖性(两个段要求使用相同的寄存器)并且删除不必要的寄存器复制操作。

**-O2**：会尝试更多的寄存器级的优化以及指令级的优化，它会在编译期间占用更多的内存和编译时间。
Gcc将执行几乎所有的不包含时间和空间折中的优化。当设置O2选项时，编译器并不进行循环打开（）loop unrolling以及函数内联。与O1比较而言，O2优化增加了编译时间的基础上，提高了生成代码的执行效率。

O2打开所有的O1选项，并打开以下选项：

l -fforce-mem：在做算术操作前，强制将内存数据copy到寄存器中以后再执行。这会使所有的内存引用潜在的共同表达式，进而产出更高效的代码，当没有共同的子表达式时，指令合并将排出个别的寄存器载入。这种优化对于只涉及单一指令的变量, 这样也许不会有很大的优化效果. 但是对于再很多指令(必须数学操作)中都涉及到的变量来说, 这会时很显著的优化, 因为和访问内存中的值相比 ,处理器访问寄存器中的值要快的多。

l -foptimize-sibling-calls：优化相关的以及末尾递归的调用。通常, 递归的函数调用可以被展开为一系列一般的指令， 而不是使用分支。 这样处理器的指令缓存能够加载展开的指令并且处理他们, 和指令保持为需要分支操作的单独函数调用相比, 这样更快。

l -fstrength-reduce：这种优化技术对循环执行优化并且删除迭代变量。 迭代变量是捆绑到循环计数器的变量, 比如使用变量, 然后使用循环计数器变量执行数学操作的for-next循环。

l -fcse-follow-jumps：在公用子表达式消元时，当目标跳转不会被其他路径可达，则扫描整个的跳转表达式。例如，当公用子表达式消元时遇到if...else...语句时，当条为false时，那么公用子表达式消元会跟随着跳转。

l -fcse-skip-blocks：与-fcse-follow-jumps类似，不同的是，根据特定条件，跟随着cse跳转的会是整个的blocks

l -frerun-cse-after-loop：在循环优化完成后，重新进行公用子表达式消元操作。

l -frerun-loop-opt：两次运行循环优化 l -fgcse：执行全局公用子表达式消除pass。这个pass还执行全局常量和copy propagation。这些优化操作试图分析生成的汇编语言代码并且结合通用片段， 消除冗余的代码段。如果代码使用计算性的goto, gcc指令推荐使用-fno-gcse选项。

l-fgcse-lm：全局公用子表达式消除将试图移动那些仅仅被自身存储kill的装载操作的位置。这将允许将循环内的load/store操作序列中的load转移到循环的外面（只需要装载一次），而在循环内改变成copy/store序列。在选中-fgcse后，默认打开。

l -fgcse-sm：当一个存储操作pass在一个全局公用子表达式消除的后面，这个pass将试图将store操作转移到循环外面去。如果与-fgcse-lm配合使用，那么load/store操作将会转变为在循环前load，在循环后store，从而提高运行效率，减少不必要的操作。

l -fgcse-las：全局公用子表达式消除pass将消除在store后面的不必要的load操作，这些load与store通常是同一块存储单元（全部或局部）

l-fdelete-null-pointer-checks：通过对全局数据流的分析，识别并排出无用的对空指针的检查。编译器假设间接引用空指针将停止程序。 如果在间接引用之后检查指针，它就不可能为空。

l -fexpensive-optimizations：进行一些从编译的角度来说代价高昂的优化（这种优化据说对于程序执行未必有很大的好处，甚至有可能降低执行效率，具体不是很清楚）

l -fregmove：编译器试图重新分配move指令或者其他类似操作数等简单指令的寄存器数目，以便最大化的捆绑寄存器的数目。这种优化尤其对双操作数指令的机器帮助较大。

l -fschedule-insns：编译器尝试重新排列指令，用以消除由于等待未准备好的数据而产生的延迟。这种优化将对慢浮点运算的机器以及需要load memory的指令的执行有所帮助，因为此时允许其他指令执行，直到load memory的指令完成，或浮点运算的指令再次需要cpu。 l

\-fschedule-insns2：与-fschedule-insns相似。但是当寄存器分配完成后，会请求一个附加的指令计划pass。这种优化对寄存器较小，并且load memory操作时间大于一个时钟周期的机器有非常好的效果。

l -fsched-interblock：这种技术使编译器能够跨越指令块调度指令。 这可以非常灵活地移动指令以便等待期间完成的工作最大化。

l -fsched-spec-load：允许一些load指令进行一些投机性的动作。（具体不详）相同功能的还有-fsched-spec-load-dangerous，允许更多的load指令进行投机性操作。这两个选项在选中-fschedule-insns时默认打开。

l -fcaller-saves：通过存储和恢复call调用周围寄存器的方式，使被call调用的value可以被分配给寄存器，这种只会在看上去能产生更好的代码的时候才被使用。（如果调用多个函数, 这样能够节省时间, 因为只进行一次寄存器的保存和恢复操作, 而不是在每个函数调用中都进行。）

l -fpeephole2：允许计算机进行特定的观察孔优化(这个不晓得是什么意思)，-fpeephole与-fpeephole2的差别在于不同的编译器采用不同的方式，由的采用-fpeephole，有的采用-fpeephole2，也有两种都采用的。

l -freorder-blocks：在编译函数的时候重新安排基本的块，目的在于减少分支的个数，提高代码的局部性。

l -freorder-functions：在编译函数的时候重新安排基本的块，目的在于减少分支的个数，提高代码的局部性。这种优化的实施依赖特定的已存在的信息：.text.hot用于告知访问频率较高的函数，.text.unlikely用于告知基本不被执行的函数。

l -fstrict-aliasing：这种技术强制实行高级语言的严格变量规则。 对于c和c++程序来说, 它确保不在数据类型之间共享变量. 例如, 整数变量不和单精度浮点变量使用相同的内存位置。

l -funit-at-a-time：在代码生成前，先分析整个的汇编语言代码。这将使一些额外的优化得以执行，但是在编译器间需要消耗大量的内存。（有资料介绍说：这使编译器可以重新安排不消耗大量时间的代码以便优化指令缓存。）

l -falign-functions：这个选项用于使函数对准内存中特定边界的开始位置。 大多数处理器按照页面读取内存，并且确保全部函数代码位于单一内存页面内, 就不需要叫化代码所需的页面。

l -falign-jumps：对齐分支代码到2的n次方边界。在这种情况下，无需执行傀儡指令（dummy operations）

l -falign-loops：对齐循环到2的n次幂边界。期望可以对循环执行多次，用以补偿运行dummy operations所花费的时间。

l -falign-labels：对齐分支到2的n次幂边界。这种选项容易使代码速度变慢，原因是需要插入一些dummy operations当分支抵达usual flow of the code.

l -fcrossjumping：这是对跨越跳转的转换代码处理， 以便组合分散在程序各处的相同代码。 这样可以减少代码的长度， 但是也许不会对程序性能有直接影响。

**-O3**： 在O2的基础上进行更多的优化
例如使用伪寄存器网络，普通函数的内联，以及针对循环的更多优化。在包含了O2所有的优化的基础上，又打开了以下优化选项：

l -finline-functions：内联简单的函数到被调用函数中。

l -fweb：构建用于保存变量的伪寄存器网络。 伪寄存器包含数据, 就像他们是寄存器一样, 但是可以使用各种其他优化技术进行优化, 比如cse和loop优化技术。这种优化会使得调试变得更加的不可能，因为变量不再存放于原本的寄存器中。

l -frename-registers：在寄存器分配后，通过使用registers left over来避免预定代码中的虚假依赖。这会使调试变得非常困难，因为变量不再存放于原本的寄存器中了。

l -funswitch-loops：将无变化的条件分支移出循环，取而代之的将结果副本放入循环中。

**-Os**：相当于-O2.5。是使用了所有-O2的优化选项，但又不缩减代码尺寸的方法。

### make链接动态和静态库

在Makefile中，可以通过指定相应的编译和链接选项来链接**动态库（共享库）和静态库**。下面是一个示例Makefile，演示了如何编译和链接动态库和静态库。

#### **示例项目结构**

假设项目目录结构如下：

```bash
.
├── Makefile
├── main.c
├── lib
│   ├── libmylib.a  # 静态库
│   └── libmylib.so # 动态库
└── src
    ├── mylib.c
    └── mylib.h
```

### 创建静态库和动态库的示例

首先，我们需要生成静态库和动态库。假设我们已经有`mylib.c`和`mylib.h`文件。

```bash
# 编译器和编译选项
CC = gcc
CFLAGS = -Wall -fPIC
LDFLAGS = -L./lib

# 目标可执行文件名
TARGET = myprogram

# 库名
STATIC_LIB = libmylib.a
DYNAMIC_LIB = libmylib.so

# 默认目标为all
all: static dynamic $(TARGET)

# 编译main.c生成目标文件
main.o: main.c
	$(CC) $(CFLAGS) -c $< -o $@

# 编译mylib.c生成目标文件
src/mylib.o: src/mylib.c
	$(CC) $(CFLAGS) -I./src -c $< -o $@

# 创建静态库
lib/$(STATIC_LIB): src/mylib.o
	ar rcs $@ $^

# 创建动态库
lib/$(DYNAMIC_LIB): src/mylib.o
	$(CC) -shared -o $@ $^

# 链接生成可执行文件（链接静态库）
static: main.o lib/$(STATIC_LIB)
	$(CC) -o $(TARGET)_static main.o -L./lib -lmylib

# 链接生成可执行文件（链接动态库）
dynamic: main.o lib/$(DYNAMIC_LIB)
	$(CC) -o $(TARGET)_dynamic main.o -L./lib -lmylib -Wl,-rpath,./lib

# 清理生成的文件
clean:
	rm -f main.o src/*.o lib/$(STATIC_LIB) lib/$(DYNAMIC_LIB) $(TARGET)_static $(TARGET)_dynamic
```

### 解释：

1.  **编译器和编译选项**：

    *   `CC`：指定编译器为`gcc`。
    *   `CFLAGS`：编译选项，包括`-Wall`用于开启所有警告，`-fPIC`用于生成位置无关代码（PIC），这是创建动态库所需的。
2.  **链接选项和库文件**：

    *   `LDFLAGS`：指定链接选项，例如`-Llib`用于指定库文件的搜索路径。
    *   `LDLIBS`：指定链接的库文件，例如`-lmylib`用于链接`libmylib`库。
3.  **默认目标为`all`**：

    *   默认目标为`all`，依赖于`myprogram`。
4.  **编译和链接可执行文件**：

    *   `myprogram`：依赖于`main.o`，链接生成可执行文件，并使用动态库链接选项`-Wl,-rpath,./lib`，指定运行时库路径为当前目录下的`lib`目录。
5.  **编译目标文件**：

    *   `main.o`：编译`main.c`生成目标文件，包含头文件搜索路径`-I./src`。
6.  **创建静态库**：

    *   `lib/libmylib.a`：依赖于`src/mylib.o`，使用`ar rcs`命令创建静态库。
7.  **创建动态库**：

    *   `lib/libmylib.so`：依赖于`src/mylib.o`，使用`gcc -shared`命令创建动态库。
8.  **编译库的目标文件**：

    *   `src/mylib.o`：编译`src/mylib.c`生成目标文件，包含头文件搜索路径`-I./src`。
9.  **清理规则**：

    *   `clean`：删除生成的目标文件、可执行文件、静态库和动态库。























