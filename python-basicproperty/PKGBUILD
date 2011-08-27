# Contributor: Maurizio Porrato <maurizio.porrato@gmail.com>
pkgname=python-basicproperty
pkgver=0.6.10a
pkgrel=2
pkgdesc="Core data-types and property classes"
license=('custom:"Basicproperty License"')
url="http://basicproperty.sourceforge.net/"
source=("http://downloads.sourceforge.net/basicproperty/basicproperty-$pkgver.tar.gz")
md5sums=('91effa85d8cf61f59304d7bf22a1a5b5')
arch=(i686 x86_64)
makedepends=('python2-distribute')
depends=('python2')

build() {
  cd $srcdir/basicproperty-$pkgver
  python2 setup.py install --prefix=/usr --root=$startdir/pkg --optimize=1
  install -Dm 644 $srcdir/basicproperty-$pkgver/basicproperty/license.txt $pkgdir/usr/share/licenses/python-basicproperty/license
}
