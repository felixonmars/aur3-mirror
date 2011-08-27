# Contributor: Wittfella <wittfella@uberview.org>
pkgname=uberview
pkgver=1.4
pkgrel=1
pkgdesc="A lightweight music library manager"
arch=('i686' 'x86_64')
url="http://www.wittfella.com"
license=('GPL')
depends=('qt')
source=(http://www.wittfella.com/$pkgname-$pkgver.tar.gz)
md5sums=('37b37ad02cdef527d18c88ed06a77618')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

   qmake || return 1
   make || return 1

   install -Dm 755 ${startdir}/src/$pkgname-$pkgver/bin/uberview ${startdir}/pkg/usr/bin/uberview

   install -Dm 644 ${startdir}/src/$pkgname-$pkgver/uberview.desktop ${startdir}/pkg/usr/share/applications/uberview.desktop

   install -Dm 644 ${startdir}/src/$pkgname-$pkgver/images/uber48.png ${startdir}/pkg/usr/share/pixmaps/uber48.png
}

