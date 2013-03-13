# Contributor: bender02 at archlinux dot us
pkgname=aescrypt
pkgver=3.0.9
pkgrel=1
pkgdesc="Use AES256 (CBC mode, password SHA256 hashed) to encrypt files"
arch=('i686' 'x86_64')
url="http://www.aescrypt.com"
license=('GPL')
# about the license: the author said so on his forum...
optdepends=('perl: for aescrypt-gui'
            'zenity: for aescrypt-gui'
            'kdialog: for aescrypt-gui')
source=(https://www.aescrypt.com/download/v3/linux/${pkgname}-${pkgver}.tgz)
md5sums=('a4b4a6855f7b427391b2e6b506899fee')

build() {
  cd $srcdir/${pkgname}-${pkgver}/src
  make
}

package() {
  install -d $pkgdir/usr/bin $pkgdir/usr/share/man/man1 \
      $pkgdir/usr/share/aescrypt \
      $pkgdir/usr/share/applications
  install -m755 $srcdir/${pkgname}-${pkgver}/src/$pkgname \
      $srcdir/${pkgname}-${pkgver}/src/${pkgname}_keygen \
      $srcdir/${pkgname}-${pkgver}/gui/${pkgname}-gui \
      $pkgdir/usr/bin/
  install -m644 $srcdir/${pkgname}-${pkgver}/man/$pkgname.1 \
      $pkgdir/usr/share/man/man1/
  install -m644 $srcdir/${pkgname}-${pkgver}/gui/AESCrypt.desktop \
      $pkgdir/usr/share/applications
  install -m644 $srcdir/${pkgname}-${pkgver}/gui/SmallLock.png \
      $pkgdir/usr/share/aescrypt
}
