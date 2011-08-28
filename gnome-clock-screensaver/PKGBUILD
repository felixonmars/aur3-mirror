#Maintainer: Mamut Ghiunhan <venerix@blug.ro>
pkgname=gnome-clock-screensaver
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple analog clock screensaver for GNOME"
arch=('i686' 'x86_64')
url="http://www.d8.dion.ne.jp/~pt2k/software/gnome-clock-screensaver/index_e.html"
license=('GPL')
depends=('gtk2')
source=(http://www.d8.dion.ne.jp/~pt2k/software/gnome-clock-screensaver/$pkgname-$pkgver.tar.gz Makefile.patch)
md5sums=('699696b3702e9f86fe93a10615463122'
         '845f2acb7465df259f18ec9cfdee4351')
build() {
  cd "$srcdir"
  patch -Np0 -i Makefile.patch
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  install -d ${pkgdir}/usr/lib/gnome-screensaver/gnome-screensaver || return 1
  install -d ${pkgdir}/usr/share/applications/screensavers || return 1
  make DESTDIR=$pkgdir install || return 1
}
