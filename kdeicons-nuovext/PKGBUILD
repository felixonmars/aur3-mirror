# Contributor: Andrea Scarpino <bash.lnx@gmail.com>

pkgname=kdeicons-nuovext
_pkgname=nuoveXT
pkgver=2.2
pkgrel=1
pkgdesc="A very nice iconset for KDE 3.x"
arch=('i686' 'x86_64')
url="http://nuovext.pwsp.net/"
license=('GPL')
source=("http://nuovext.pwsp.net/files/nuoveXT-${pkgver}_KDE.tar.gz")
md5sums=("a7934146c93b011d435643bfe8d1cb3a")

build() {
  mkdir -p $startdir/pkg/opt/kde/share/icons/nuovext
  cd $startdir/src/$_pkgname-${pkgver}_KDE
  cp -r * $startdir/pkg/opt/kde/share/icons/nuovext/
}
