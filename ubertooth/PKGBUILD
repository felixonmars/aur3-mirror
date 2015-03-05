pkgname=ubertooth
pkgver=2014.04.R1
pkgrel=1
pkgdesc="A 2.4 GHz wireless development board suitable for Bluetooth experimentation. Open source hardware and software. Tools only"
url="http://sourceforge.net/projects/ubertooth/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libusbx' 'libbtbb' 'libpcap' 'python')
source=("https://github.com/greatscottgadgets/ubertooth/releases/download/2014-04-R1/ubertooth-2014-04-R1.tar.xz")
md5sums=('c547093e5331c5c75e17cf5daa016760')

build() {
  cd "${srcdir}/${pkgname}-2014-04-R1/host/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ..
  make
}

package() {
  cd "${srcdir}/${pkgname}-2014-04-R1/host/build/"
  make install
}

