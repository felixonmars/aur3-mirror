# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
pkgname=jpeg2ps
pkgver=1.9
pkgrel=1
pkgdesc="A utility for converting JPEG images to compressed PostScript Level 2 or 3 files"
arch=('i686' 'x86_64')
url="http://www.pdflib.com/download/free-software/jpeg2ps/"
license=('custom')
depends=('glibc')

source=(http://www.pdflib.com/fileadmin/pdflib/products/more/$pkgname/$pkgname-$pkgver.tar.gz
        license.txt)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1

  _bindir="/usr/bin"
  _mandir="/usr/share/man/man1"
  _docdir="/usr/share/doc/$pkgname"

  install -D -m 755 $pkgname     $pkgdir/$_bindir/$pkgname
  install -D -m 644 $pkgname.1   $pkgdir/$_mandir/$pkgname.1
  install -D -m 644 $pkgname.txt $pkgdir/$_docdir/$pkgname.txt

  install -D -m 644 $srcdir/license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
}
md5sums=('e654f6a584435e6717b6c2659c07db28'
         'b66132da1d297ef486615c3c5e670416')
