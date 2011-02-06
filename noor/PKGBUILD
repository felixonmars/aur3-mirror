# Contributor: H.Gökhan SARI <hsa2@difuzyon.net>
pkgname=noor
pkgver=1.2.1
pkgrel=1
pkgdesc="Noor is a program for viewing Quran. It supports different interfaces like GTK, HTML, and plain text for displaying Quran. You can specify translation files, in which case the translation of each aya is shown after it."
arch=('i686' 'x86_64')
url="http://noor.sourceforge.net/"
license=('GPL')
depends=()
makedepends=('python')
source=('http://downloads.sourceforge.net/noor/noor-1.2.1.tar.gz'
	'diyanet.trans.zip')
md5sums=('d50a88c15959820bee1adac88fdafd32'
	 '4556017b31c438623e489bc9aa71fb4a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  
  mkdir -p $pkgdir/usr/share/noor/trans/
  patch -p0 -i $startdir/config.patch

  python setup.py build
  python setup.py install --root $pkgdir
  cp $startdir/diyanet.trans.zip $pkgdir/usr/share/noor/trans/
}

