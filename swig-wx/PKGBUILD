pkgname=swig-wx
pkgver=1.3.29_fuerte
pkgrel=1
pkgdesc="SWIG (Simplified Wrapper and Interface Generator) for ROS Fuerte"
url="https://github.com/ros/swig-wx/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('bison' 'gcc-libs')
makedepends=()
conflicts=()
replaces=()
backup=()
source=("https://github.com/ros/$pkgname/archive/$pkgver.tar.gz")
md5sums=('9fcc339dde0202c9f73efefef1cfe9b2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  test -d "$pkgdir/opt/ros/fuerte/bin/" || mkdir -p "$pkgdir/opt/ros/fuert\
e/bin/" && mv $pkgdir/usr/local/bin/swig $pkgdir/opt/ros/fuerte/bin/
} 
