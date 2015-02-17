# Maintainer: clynamen <clynamen[at]gmail[dot]com>
pkgname=boost-examples
pkgver=1.57.0
pkgrel=1
pkgdesc="Example code from the Boost C++ library"
url="http://www.boost.org/"
arch=('x86_64' 'i686')
license=('boost')
depends=()
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
pkgver_=$(echo $pkgver | tr '.' '_')
source=("http://sourceforge.net/projects/boost/files/boost/${pkgver}/boost_${pkgver_}.tar.gz/download")
md5sums=('25f9a8ac28beeb5ab84aa98510305299')


build() {
  msg "nothing to build..."
}

package() {
  cd boost_$pkgver_
  msg "copying examples..."
  dst="${pkgdir}/opt/boost/examples/"
  mkdir -p $dst
  for d in $(find -maxdepth 3 -name 'example' -type d); do
    dname=$(dirname $d)
    mv $dname $dst
  done
  chmod 644 -R "${pkgdir}/opt/"
  for d in $(find "${pkgdir}/opt/" -type d); do
    chmod a+x $d
  done
}

