# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=grandr-applet
pkgver=0.4.1
pkgrel=5
pkgdesc="GNOME Panel Applet that allow you to select screen resolution and orientation"
url="http://kdekorte.googlepages.com/grandr_applet"
license=('GPL')
depends=('gnome-panel')
arch=('i686' 'x86_64')
source=("http://kdekorte.googlepages.com/grandr_applet-${pkgver}.tar.gz")
md5sums=('e5503535fad10b1f6e97ed1c1af18960')

build() {
  cd "$srcdir/grandr_applet-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/grandr_applet-$pkgver"

  make DESTDIR="$pkgdir/" install
}



