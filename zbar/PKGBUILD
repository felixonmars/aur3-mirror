# Maintainer: Marti Raudsepp <marti@juffo.org>
# Contributor: Radu Andries <admiral0@tuxfamily.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=zbar
pkgver=0.10
pkgrel=3
pkgdesc="Application and library for reading bar codes from various sources"
arch=('i686' 'x86_64')
url="http://zbar.sourceforge.net/"
license=('LGPL')
depends=('imagemagick' 'libxv' 'python2' 'gtk2' 'qt4' 'pygtk')
conflicts=('zbar-gtk' 'zbar-qt')
provides=("zbar-gtk=$pkgver" "zbar-qt=$pkgver")
source=("http://downloads.sourceforge.net/project/zbar/zbar/$pkgver/zbar-$pkgver.tar.bz2"
        v4l1.patch)

build() {
  cd "$srcdir/zbar-$pkgver"

  msg 'Patching...'
  patch -p1 < ${srcdir}/v4l1.patch

  msg 'Running configure...'
  ./configure --prefix=/usr --with-qt --with-gtk CFLAGS=-DNDEBUG

  msg 'Running make...'
  make
}
package() {
  cd "$srcdir/zbar-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('0fd61eb590ac1bab62a77913c8b086a5'
         '284f11ca2a5e009744c4a1b9e92d6953')
