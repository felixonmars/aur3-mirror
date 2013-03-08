# Contributor: bender02 at archlinux dot us
pkgname=aescrypt
pkgver=3.0.6c
pkgrel=1
pkgdesc="Use AES256 (CBC mode, password SHA256 hashed) to encrypt files"
arch=('i686' 'x86_64')
url="http://www.aescrypt.com"
license=('GPL')
# about the license: the author said so on his forum...
source=(https://www.aescrypt.com/download/v3/linux/${pkgname}-${pkgver}.tgz)
md5sums=('c183515ea775fe7f3273e9ecc785e3d5')

build() {
  cd $srcdir/${pkgname}-${pkgver}/src
  make
}

package() {
  install -d $pkgdir/usr/bin $pkgdir/usr/share/man/man1
  install -m755 $srcdir/${pkgname}-${pkgver}/src/$pkgname $srcdir/${pkgname}-${pkgver}/src/${pkgname}_keygen $pkgdir/usr/bin/
  install -m644 $srcdir/${pkgname}-${pkgver}/man/$pkgname.1 $pkgdir/usr/share/man/man1/
}
