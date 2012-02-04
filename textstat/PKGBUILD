# Contributor & Maintainer: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=textstat
pkgver=2.8g
pkgrel=1
pkgdesc="Simple Text Analyse Tool in Python offering statistical concordance analysis in all languages and scripts."
arch=('i686')
url="http://neon.niederlandistik.fu-berlin.de/textstat/"
license=('MIT')
depends=('python')

source=(http://neon.niederlandistik.fu-berlin.de/static/$pkgname/TextSTAT2-source.zip \
	$pkgname $pkgname.png $pkgname.desktop $pkgname.patch)
md5sums=('f214a27b83bfb95f74ae0dd5a0eeea4c' 'd69811da708d82a66048ae40c3ba50db' \
         '2d61aa40738406dbbab918c3ccd0394d' '41d2882cd1631e1f222363e8d132754a' \
         'cbb4b8ff23a553ed4e64b14ebcd5d64d')

build() {
  cd $srcdir/
  patch TextSTAT.pyw $pkgname.patch
  mkdir -p $pkgdir/usr/share/$pkgname
  install -Dm644 $srcdir/*.py{,w} $pkgdir/usr/share/$pkgname
  install -Dm644 $srcdir/History.txt $pkgdir/usr/share/$pkgname
  install -Dm644 $srcdir/License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
  cp -r $srcdir/Images $pkgdir/usr/share/$pkgname
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
  install -Dm644 $srcdir/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
