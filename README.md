# main_arena_offset

> A simple shell script to get main_arena offset of a given libc

### install 
```bash
wget https://github.com/M4xW4n9/main_arena_offset/blob/master/install.sh
chmod +x install.sh
sudo ./install.sh
```

### example
```bash
$ main_arena ./libc6_2.15-0ubuntu10.18_amd64.so 
[+] main_arena_offset: 0x3ba720
$ main_arena ./libc6_2.15-0ubuntu10_amd64.so 
[+] main_arena_offset: 0x3b6720
```

### Screenshots

![screenshot](/home/m4x/main_arena_offset/screenshot.png)

### more

- You can set the color of output by modifying **main_arena_offset** as you want. I have preset some colors in **main_arena_offset**

- version 0.1 must contains many many bugs and issues are welcomed.

  ​