# Contributor: Michael Krauss <hippodriver@gmx.net>

pkgname=verscan
pkgver=0.6
pkgrel=1
arch=('any')
pkgdesc="automatically watching for new versions of your packages"
url="http://www.mvkrauss.de/arch.html"
license=('BSD')
depends=('python' 'python-lxml>=2.0' 'beautiful-soup>=3.0')
source=(http://www.mvkrauss.de/files/$pkgname-$pkgver.tar.gz)

build() {
  mkdir -p $startdir/pkg/usr/bin || return 1
  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname

  cd $startdir/src/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root=${startdir}/pkg

  install --mode=755 $startdir/$pkgname \
    $startdir/pkg/usr/bin/verscan || return 1
  cp $startdir/COPYING $startdir/pkg/usr/share/licenses/$pkgname
}

md5sums=('5dc17ef0b46cc3878ebea09b808f8a93')
