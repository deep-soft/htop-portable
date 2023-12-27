# [htop](https://github.com/deep-soft/htop) portable | AppImage
## Download and run
### Self-extractable tar-archive
with TTY X/Xi backend
* built on Alpine | ~20 MB (x86_64 x86 aarch64 armhf armv7 ppc64le s390x)
```shell
wget -qO- https://github.com/deep-soft/htop-portable/releases/download/latest/htop_$(uname -m).run.tar | \
tar -xv -C /tmp && /tmp/htop_*.run
```
* built on Ubuntu 16.04 | ~30 MB (x86_64 only)
```shell
wget -qO- https://github.com/deep-soft/htop-portable/releases/download/latest/htop_$(uname -m)-glibc.run.tar | \
tar -xv -C /tmp && /tmp/htop_*.run
```
### AppImage
* built on Ubuntu 20.04 | ~45 MB (x86_64 only)
```shell
wget -qO- https://github.com/deep-soft/htop-portable/releases/download/latest/htop_$(uname -m).AppImage.tar | \
tar -xv -C /tmp && /tmp/htop_*.AppImage
```
Or get the binary in [Releases](https://github.com/deep-soft/htop-portable/releases)
