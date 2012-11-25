# Maintainer: Dave Reisner <dreisner@archlinux.org>
	# AUR Package Maintainer: 3V0LU710N <db_eee.at.yahoo.dot.com>

pkgname=kmod-xz
_pkgname=kmod
pkgver=11
pkgrel=1
pkgdesc="Linux kernel module handling. xz support enabled."
arch=('i686' 'x86_64')
url='http://git.kernel.org/?p=utils/kernel/kmod/kmod.git;a=summary'
license=('GPL2')
depends=('glibc' 'zlib' 'xz')
makedepends=('gtk-doc')
options=('!libtool')
provides=('module-init-tools=3.16' "kmod=${pkgver}")
conflicts=('module-init-tools' 'kmod')
replaces=('module-init-tools' 'kmod')
source=("ftp://ftp.kernel.org/pub/linux/utils/kernel/$_pkgname/$_pkgname-$pkgver.tar.xz"
        "depmod-search.conf")
md5sums=('607e33b0144625c2e5221e5a7df49c7a'
         'dd62cbf62bd8f212f51ef8c43bec9a77')

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    --sysconfdir=/etc \
    --enable-gtk-doc \
    --with-zlib \
    --with-xz

  make
}

check() {
  # testsuite is broken on 32-bit because of an unhandled EEXIST on mkdir_p
  make -C "$_pkgname-$pkgver" check || :
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
