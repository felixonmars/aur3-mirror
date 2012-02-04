# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=pdftrans
pkgver=1.2
pkgrel=8
arch=('any')
pkgdesc="A utility to add metadata, protect, and encrypt PDF documents"
url="http://maddingue.free.fr/softwares/pdftrans.html.en"
license=('GPL')
depends=('java-runtime' 'itext' 'bcprov')
makedepends=('java-environment')
source=(http://maddingue.free.fr/softwares/download/PDFTrans/$pkgname-$pkgver.zip \
        $pkgname.sh)
sha256sums=('8feebb6c542072e14fccf410d766ead522c129ae95b0242ffe1da2cc71b2f429'
            '21b28f266aeee0cba315682c7e5bdaae823d3e9d97cdef6daa26a85c544547b2')

build() {
  install -D $pkgname.sh ${pkgdir}/usr/bin/$pkgname

  cd $pkgname

  # fix http://bugs.archlinux.org/task/19295 FS#19295 - [pdftrans] needs updating to follow itext java class renaming
  sed 's/lowagie/itextpdf/' -i src/PDFTrans.java
  javac -classpath /usr/share/java/itextpdf.jar -d classes src/PDFTrans.java

  install -D -m644 classes/PDFTrans.class ${pkgdir}/usr/share/java/$pkgname/PDFTrans.class
  install -D -m644 doc/$pkgname.1 ${pkgdir}/usr/share/man/man1/$pkgname.1
}
