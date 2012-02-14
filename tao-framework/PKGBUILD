pkgname=tao-framework
pkgver=2.1.0
pkgrel=1
pkgdesc="A collection of bindings to facilitate cross-platform game-related development utilizing the .NET platform."
arch=(any)
license=('MIT')
makedepends=(mono nant)
options=(!strip)
url='http://www.taoframework.com/'
source=("http://downloads.sourceforge.net/taoframework/taoframework-$pkgver.tar.gz"
"AssemblyList.txt")
sha1sums=('340ed65ddccb97e0dfd0069ecbe689ad7e70c5db'
          'ec1afc60dc05d373ae9f4301609ec0b28afa6fbf')

build() {
  cd "${srcdir}/taoframework-$pkgver/source"

  nant package
}

package() {
  cd "${srcdir}/taoframework-$pkgver"
  
  gacutil -il ../AssemblyList.txt -root $pkgdir/usr/lib
}
