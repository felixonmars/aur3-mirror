#Maintainer: Tristan Webb <tristanjwebb@gmail.com>
pkgname=tagxfs
pkgver=1.1_904
pkgrel=2
pkgdesc="A semantic file system that expands the user space file system to a tag based hierarchy."
url="http://tagxfs.sourceforge.net"
arch=('i686' 'x86_64')
license=('custom:boost')
depends=('fuse' 'sqlite3')
makedepends=('boost')
source=(http://downloads.sourceforge.net/project/tagxfs/tagxfs-1.1-904.tar.gz)
md5sums=('cf65648a1cc5dddd25e3f09adb6372c3')
install=tagxfs.install

build() {
  cd "${srcdir}/$pkgname-${pkgver/_/-}"

 ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/$pkgname-${pkgver/_/-}"

  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/tagxfs/"
  cp "${srcdir}/$pkgname-${pkgver/_/-}/COPYING" "$pkgdir/usr/share/licenses/tagxfs/"
}
