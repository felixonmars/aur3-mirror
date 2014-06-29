# Maintainer: Hutts <hutts@internode.on.net>

pkgname=speedstep-centrino
pkgver=3.15.1
pkgrel=1
pkgdesc="Kernel module patched for additional Pentium-M (centrino) families"
url="http://www.kernel.org"
arch=('i686')
options=(!strip)
license=('GPL')
provides=('speedstep-centrino')
depends=("linux>=${pkgver}")
source=("${pkgname}-src.tar.gz"
	"${pkgname}.patch")
md5sums=('0d9e1ca4bcb4f025f4dab4f218d1a547' # speedstep-centrino.tar.gz
	 'e44834d3bf416aefc7485273e91b9b1f') # speedstep-centrino.patch
install="${pkgname}.install"

build() {
  cd ${srcdir}
  msg2 "Patching table label and additional families."
  patch -Np1 -i "${pkgname}.patch"
  make
  gzip ${pkgname}.ko
}

package_speedstep-centrino() {
  install -m644 -D "${pkgname}.ko.gz" "${pkgdir}/lib/modules/$(uname -r)/kernel/drivers/cpufreq/${pkgname}.ko.gz"
}

