# Contributor: bender02 at archlinux dot us
pkgname=aescrypt
pkgver=305
pkgrel=1
pkgdesc="Use AES256 (CBC mode, password SHA256 hashed) to encrypt files"
arch=('i686' 'x86_64')
url="http://www.aescrypt.com"
license=('GPL')
# about the license: the author said so on his forum...
source=(http://www.aescrypt.com/cgi-bin/download?file=v3/${pkgname}${pkgver}_source.tar.gz
        http://www.aescrypt.com/cgi-bin/download?file=v3/$pkgname.1)
md5sums=('064dce49bcdd8781fa08c7606a1f9bc1'
         '728613771436b11b2bd36347cdd554a0')

build() {
  cd $srcdir/${pkgname}${pkgver}_source
  make
}

package() {
  install -d $pkgdir/usr/bin $pkgdir/usr/share/man/man1
  install -m755 $srcdir/${pkgname}${pkgver}_source/$pkgname $pkgdir/usr/bin/
  install -m644 $srcdir/$pkgname.1 $pkgdir/usr/share/man/man1/
}
