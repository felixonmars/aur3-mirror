# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gfsview-snapshot
pkgver=121130
pkgrel=1
pkgdesc="A graphical viewer for Gerris simulation files."
arch=(i686 x86_64)
url="http://gfs.sourceforge.net/wiki/index.php/Main_Page"
license=('GPL')
groups=('gerris')
depends=('gerris-snapshot' 'gtkglext' 'startup-notification' 'ftgl' 'desktop-file-utils')
provides=('gfsview')
conflicts=('gfsview')
install="$pkgname.install"
source=("http://gerris.dalembert.upmc.fr/gerris/$pkgname.tar.gz")
md5sums=('SKIP')

pkgver() {
  ls -d $pkgname-* | cut -d"-" -f3
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
