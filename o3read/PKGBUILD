# Contributor: Charlos <hunarch@devall.hu>
pkgname=o3read
pkgver=0.0.4
pkgrel=1
pkgdesc="*.sxw, *.sxc and *.odt files view with text mode"
arch=('i686' 'x86_64')
url="http://siag.nu/pub/o3read"
license=('GPL')
depends=()
makedepends=()
source=(http://siag.nu/pub/o3read/$pkgname-$pkgver.tar.gz destdir.patch)
md5sums=('583361b559ccf5a764edb586795d1b06'
         '7a83ed8f2b7008710a8ff74d162df8fa')

build() {
   cd $startdir/src/$pkgname-$pkgver
   patch -p1 < ../destdir.patch
  ./configure
  make -j2 || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

