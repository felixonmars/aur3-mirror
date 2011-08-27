
pkgname=qutim-plugin-floaties
pkgver=0.1.1
pkgrel=2
pkgdesc="Floaties contacts plugin for qutim"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('qutim' 'wget' 'tar')
depends=()
conflicts=()
provides=()

source=("http://www.qutim.org/uploads/src/plugins/floaties-0.1.1.tar.bz2")
md5sums=(19abefb593cf7c5cbab2093c6a7d1d13)

build() {

 cd $srcdir/floaties-$pkgver
 
 qmake || return 1 
 make || return 1

 mkdir -p $pkgdir/usr/lib/qutim/ 
 install -D \
  $startdir/src/floaties-$pkgver/libfloaties.so \
  $pkgdir/usr/lib/qutim/ || return 1
 rm -rf $srcdir/floaties-$pkgver
}
