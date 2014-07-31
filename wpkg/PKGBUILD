# Maintainer: Yevgeny Krasovsky <jkrasovsky[at]gmail>
pkgname=wpkg
pkgver=0.9.4
pkgrel=1
pkgdesc="Windows Packager. The tool is used to create, check, install, configure, and remove DEB packages."
url="http://windowspackager.org/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('graphviz')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://downloads.sourceforge.net/project/unigw/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz"
	"00-unused_variable_warning.patch")
md5sums=('9a0c0e34fb64e879e1aa9961c881b9a8'
	 '3b100d31a8a85e353bda382a8cf8e61f')

build() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  patch -Np0 -i ${srcdir}/00-unused_variable_warning.patch
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}_${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et: