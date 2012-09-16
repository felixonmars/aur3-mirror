# Maintainer: Luca Bennati <lucak3 AT gmail DOT com>
# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=qtperf
pkgver=0.2.1
pkgrel=1
pkgdesc="A tool to test Qt graphics performance"
arch=('i686' 'x86_64')
url="http://code.google.com/p/qtperf/"
license=('custom')
depends=('qt')
source=("http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('1f3b5098bd66b1153cb5ba525ea73529')

build() {
  cd "${srcdir}/$pkgname"
  qmake
  make
}

package() {
  cd "${srcdir}/$pkgname"
  install -Dm755 "${srcdir}/${pkgname}/qtperf4" "${pkgdir}/usr/bin/${pkgname}"
}
