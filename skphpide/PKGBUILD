# Contributor: totoloco <totoloco at gmail>
pkgname=skphpide
pkgver=1.0b3
pkgrel=3
pkgdesc="A PHP IDE written in C++ with features like code completion, code templates, find (and replace) in project."
arch=(i686 x86_64)
url="http://www.shishkabab.net/skphpide.html"
license=('GPL')
depends=(kdelibs qt)
makedepends=(gcc cmake make)
optdepends=(php)
source=(http://downloads.sourceforge.net/skphpide/$pkgname-$pkgver.tgz)
md5sums=(b87f5fd64942baebb58874fd454bdff7)

build() {
  cd "$srcdir/$pkgname-$pkgver"

	CMakeFlags="-DBIN_INSTALL_DIR=/usr/bin -DXDG_APPS_INSTALL_DIR=/usr/share/applications -DDATA_INSTALL_DIR=/usr/share/kde4/apps"
  cmake $CMakeFlags . || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
