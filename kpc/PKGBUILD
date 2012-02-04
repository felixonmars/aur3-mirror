# Contributor: H.Gokhan SARI <hsa2@difuzyon.net>
pkgname=kpc
pkgver=0.1
pkgrel=1
pkgdesc="KDE4 Panel Configurator"
arch=(i686)
url="http://www.kde-apps.org/content/show.php?content=79035"
license=('GPL')
depends=('qt')
makedepends=(cmake)
source=('http://www.kde-apps.org/CONTENT/content-files/79035-kpc.tar.gz')
md5sums=('f796b55182961a523c7315452bcd76be')

build() {
  cd "$srcdir/$pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr/lib/kde4/
  make || return 1
  make DESTDIR="$pkgdir/" install
}
