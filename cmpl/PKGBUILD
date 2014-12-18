# Maintainer: Jon Eyolfson <jon@eyl.io>

pkgname=cmpl
pkgver=0.0.2
pkgrel=1
pkgdesc="A research C/C++ build system"
arch=('x86_64')
url="https://github.com/eyolfson/cmpl/"
license=('GPL3')
makedepends=('cmpl=0.0.1')
depends=('clang>=3.5')
source=("https://github.com/eyolfson/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('ee05b595c84ecd1104b71e0b3aba5bedecdd484f0464c08bcf4420bc5e391ab6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cmpl
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 bin/cmpl "${pkgdir}/usr/bin/cmpl"
}
