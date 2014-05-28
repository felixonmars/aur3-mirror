# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgbase='protobuf-py3'
pkgname='protobuf-py3'
true && pkgname=('protobuf-py3' 'python-protobuf')
pkgver=2.5.0
pkgrel=1
pkgdesc="A way of encoding structured data in an efficient yet extensible format"
arch=('i686' 'x86_64')
url="https://github.com/GreatFruitOmsk/protobuf-py3"
license=('APACHE')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'setuptools' 'python')
source=('https://protobuf.googlecode.com/files/protobuf-2.5.0.tar.bz2'
        'py3.patch::https://github.com/GreatFruitOmsk/protobuf-py3/commit/306a301ebb6450ad00fd62ea41f87b11cd0b6c8f.diff')
sha1sums=('62c10dcdac4b69cc8c6bb19f73db40c264cb2726'
          '3a4b4b9cbe620256c931b16d12b808c5bd832c73')

prepare() {
  cd "$srcdir/protobuf-$pkgver"
  patch -p1 <"$srcdir/py3.patch"
}

build() {
  cd "$srcdir/protobuf-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --disable-static
}

package_protobuf-py3() {
  provides=('protobuf')
  conflicts=('protobuf')

  cd "$srcdir/protobuf-$pkgver"
  make DESTDIR=$pkgdir install
}

package_python-protobuf() {
  pkgdesc="protobuf python 3 API"
  depends=("python" "protobuf-py3=${pkgver}")

  cd "$srcdir/protobuf-$pkgver/python"
  python setup.py install --prefix=/usr --root $pkgdir
}
