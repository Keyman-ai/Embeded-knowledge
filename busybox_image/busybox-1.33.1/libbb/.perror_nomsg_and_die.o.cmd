cmd_libbb/perror_nomsg_and_die.o := aarch64-none-linux-gnu-gcc -Wp,-MD,libbb/.perror_nomsg_and_die.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.33.1"'  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -DKBUILD_BASENAME='"perror_nomsg_and_die"'  -DKBUILD_MODNAME='"perror_nomsg_and_die"' -c -o libbb/perror_nomsg_and_die.o libbb/perror_nomsg_and_die.c

deps_libbb/perror_nomsg_and_die.o := \
  libbb/perror_nomsg_and_die.c \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/stdc-predef.h \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/lib/gcc/aarch64-none-linux-gnu/10.3.1/include-fixed/limits.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/lib/gcc/aarch64-none-linux-gnu/10.3.1/include-fixed/syslimits.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/limits.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/libc-header-start.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/features.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/sys/cdefs.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/wordsize.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/long-double.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/gnu/stubs.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/gnu/stubs-lp64.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/posix1_lim.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/local_lim.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/linux/limits.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/posix2_lim.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/xopen_lim.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/uio_lim.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/byteswap.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/byteswap.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/types.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/timesize.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/typesizes.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/time64.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/endian.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/endian.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/endianness.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/uintn-identity.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/lib/gcc/aarch64-none-linux-gnu/10.3.1/include/stdint.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/stdint.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/wchar.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/stdint-intn.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/stdint-uintn.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/lib/gcc/aarch64-none-linux-gnu/10.3.1/include/stdbool.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/unistd.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/posix_opt.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/environments.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/lib/gcc/aarch64-none-linux-gnu/10.3.1/include/stddef.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/confname.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/getopt_posix.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/getopt_core.h \
  /usr/local/arm64/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/aarch64-none-linux-gnu/libc/usr/include/bits/unistd_ext.h \

libbb/perror_nomsg_and_die.o: $(deps_libbb/perror_nomsg_and_die.o)

$(deps_libbb/perror_nomsg_and_die.o):
