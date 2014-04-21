# Maintainer: Christian Rebischke <echo Q2hyaXMuUmViaXNjaGtlQGdtYWlsLmNvbQo= | base64 -d>

pkgname=ghdl-bin
pkgver=0.29
pkgrel=1
pkgdesc="Complete VHDL  simulator, using the GCC  technology"
arch=('i686')
url="http://ghdl.free.fr/"
license=('GPL')
options=('staticlibs')
source=(http://ghdl.free.fr/ghdl-${pkgver}-i686-pc-linux.tar)
md5sums=('3105ffa575244f30d79855e25e5f7816')

package() {
  cd ${srcdir}/ghdl-${pkgver}-i686-pc-linux/
  tar -C ${pkgdir} -jxvf ghdl-${pkgver}-i686-pc-linux.tar.bz2
}

