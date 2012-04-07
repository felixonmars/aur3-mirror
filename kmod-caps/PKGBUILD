# $Id: PKGBUILD 155732 2012-04-06 00:04:08Z tomegun $
# Maintainer: Dave Reisner <dreisner@archlinux.org>

pkgname=kmod-caps
_pkgname=kmod
pkgver=7
pkgrel=2
pkgdesc="Linux kernel module handling modified to add cap_sys_module to the binary as inheritable by default."
arch=('i686' 'x86_64')
url='http://git.kernel.org/?p=utils/kernel/kmod/kmod.git;a=summary'
license=('GPL2')
depends=('capability-helper' 'glibc' 'zlib')
options=('!libtool')
provides=("$_pkgname=$pkgver-$pkgrel" 'module-init-tools=3.16')
conflicts=($_pkgname 'module-init-tools')
replaces=('module-init-tools')
install=${pkgname}.install
source=("ftp://ftp.kernel.org/pub/linux/utils/kernel/$_pkgname/$_pkgname-$pkgver.tar.xz"
        "depmod-search.conf"
        "0001-split-usr-read-configs-from-lib-depmod.d-modprobe.d.patch"
        "0002-config-hardcode-the-path-to-modules-to-be-lib-module.patch")
md5sums=('7bd916ae1c8a38e7697fdd8118bc98eb'
         'dd62cbf62bd8f212f51ef8c43bec9a77'
         'ba73b9e98db1abbf41274f922fcfbd55'
         'c9af56636c5667cf4ce3a31ea56e03d9')

build() {
  cd "$_pkgname-$pkgver"

  patch -p1 -i ../0001-split-usr-read-configs-from-lib-depmod.d-modprobe.d.patch
  patch -p1 -i ../0002-config-hardcode-the-path-to-modules-to-be-lib-module.patch

  ./configure \
    --sysconfdir=/etc \
    --with-zlib \
    --with-rootprefix=/usr

  make
}

check() {
  make -C "$_pkgname-$pkgver" check
}

package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install

  # extra directories
  install -dm755 "$pkgdir"/{etc,usr/lib}/{depmod,modprobe}.d "$pkgdir/sbin"

  # add symlinks to kmod
  ln -s ../usr/bin/kmod "$pkgdir/sbin/modprobe"
  ln -s ../usr/bin/kmod "$pkgdir/sbin/depmod"

  for tool in {ins,ls,rm}mod modinfo; do
    ln -s kmod "$pkgdir/usr/bin/$tool"
  done

  # install depmod.d file for search/ dir
  install -Dm644 "$srcdir/depmod-search.conf" "$pkgdir/usr/lib/depmod.d/search.conf"
}

# vim: ft=sh syn=sh et
