# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: bram85 <me@bramschoenmakers.nl>
# Contributor: Michal Malek <michalm@jabster.pl>

pkgname=rsibreak
pkgver=0.11
pkgrel=2
pkgdesc="A small utility to help prevent Repetive Strain Injury"
arch=('i686' 'x86_64')
url="http://www.rsibreak.org/"
license=('GPL')
depends=('libxss' 'kdelibs' 'oxygen-icons')
makedepends=('automoc4' 'docbook-xsl' 'cmake')
options=('libtool')
source=(http://www.rsibreak.org/files/$pkgname-$pkgver.tar.bz2)
sha1sums=('47e91d877634439e232d96c3091e0e59f44791aa')

build() {
  mkdir -p ${srcdir}/build
  cd ${srcdir}/build

  cmake ../${pkgname}-${pkgver} -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
}
