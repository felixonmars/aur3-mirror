# Maintainer: StoneCold <forumi0721[at]gmail[dot]com>

pkgname=("qemu-i386-linux-user")
pkgver=2.2.0
pkgrel=2
pkgdesc="A generic and open source processor emulator which achieves a good emulation speed by using dynamic translation."
arch=("armv7h")
url="http://wiki.qemu.org/Main_Page"
license=("GPL")
makedepends=("python2")
source=("http://wiki.qemu-project.org/download/qemu-${pkgver}.tar.bz2")
md5sums=("f7a5e2da22d057eb838a91da7aff43c8")

build() {
	cd "${srcdir}"/qemu-"${pkgver}"
  ./configure \
    --prefix=/usr \
    --target-list="i386-linux-user" \
    --disable-tools \
    --disable-guest-agent \
    --disable-docs \
    --disable-system \
    --disable-linux-aio \
    --disable-fdt \
    --disable-sdl \
    --enable-linux-user \
    --python=/usr/bin/python2
  make
}

package() {
	cd "${srcdir}"/qemu-"${pkgver}"
  make DESTDIR="${pkgdir}"/ install
}

# vim:set ts=2 sw=2 et:
