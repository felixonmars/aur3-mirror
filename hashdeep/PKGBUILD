# PKGBUILD for hashdeep
# Contributor: Uffe Jakobsen <uffe@uffe.org>
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
pkgname=hashdeep
pkgver=4.4
pkgrel=1
epoch=
pkgdesc="cross-platform tools to computer hashes, or message digests, for any number of files"
arch=('i686', 'x86_64')
url="https://github.com/jessek/hashdeep"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/jessek/hashdeep/archive/release-4.4.tar.gz)
noextract=()
md5sums=('9ccfd5ba3e3d9cffddeb118cacad0c27')


prepare() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"
}

build() {

  cd "${srcdir}/${pkgname}-release-${pkgver}"
  sh bootstrap.sh
  sh configure
  make
}

check() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"
}

package() {
  cd "${srcdir}/${pkgname}-release-${pkgver}"
  make DESTDIR="$pkgdir/" install
}

# EOF
