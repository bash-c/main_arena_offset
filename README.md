# main_arena_offset

> A simple shell script to get main\_arena offset of a given libc

### install
Step1: download [main_arena](https://github.com/bash-c/main_arena_offset/blob/master/main_arena)
Step2: then enjoy it!
Optional: add this shell script to path if you want

### usage
```bash
$ main_arena your_libc
```

### example
```bash
main_arena_offset [master●●] main_arena /lib/x86_64-linux-gnu/libc.so.6
[+]libc version : glibc 2.27
[+]build ID : BuildID[sha1]=8fd0a29758bf6615673836bb20ffdf11dcb531e6
[+]main_arena_offset : 0x3b4c40
main_arena_offset [master●●] main_arena /lib/i386-linux-gnu/libc.so.6
[+]libc version : glibc 2.27
[+]build ID : BuildID[sha1]=2e6f3ca2f94f25f84946f8277d7588a00a90791b
[+]main_arena_offset : 0x1d57a0
```

### Screenshots

![screenshot](./screenshot.png)

### more
- Though it works perfect on [libc-databases](https://github.com/niklasb/libc-database) now(*2018-11-15*). But I'm not sure whether it works well on other libcs, so issues are welcome.


### Make it better
Any suggestion or feature request is welcome! Feel free to send a pull request.
Please let me know if you find any libc that makes main\_arena\_offset fail to find the right offset. And, if you like this work, I'll be happy to be [starred](https://github.com/bash-c/main_arena_offset/stargazers) :grimacing:

### Thanks

- [f0110vv3r](https://github.com/f0110vv3r) for [commit a10ebdc09ab6073ef2776764535b697eca222b6e](https://github.com/bash-c/main_arena_offset/commit/a10ebdc09ab6073ef2776764535b697eca222b6e#diff-6c97c5cfc0c15f0ab3208caa35de282eR62)
