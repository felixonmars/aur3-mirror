# Maintainer: Yevgeny Krasovsky <jkrasovsky[at]gmail>
pkgname=pkg-explorer
pkgver=0.3.0
pkgrel=1
pkgdesc="Package Explorer. The GUI tool is used to create, check, install, configure, and remove DEB packages."
url="http://windowspackager.org/"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('wpkg')
optdepends=()
makedepends=('qt4')
conflicts=()
replaces=()
backup=()
install=
source=("http://downloads.sourceforge.net/project/unigw/${pkgname}/${pkgver}/${pkgname}_${pkgver}.tar.gz"
	"00-unused_variable_warning.patch")
md5sums=('e5ca3292e0c286cf0f0778ae843fc74d'
	 '51dc237f8c72d60cd0a87a7316959f14')

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