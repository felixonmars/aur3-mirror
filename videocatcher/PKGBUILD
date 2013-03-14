# Contributor: Giulio Guzzinati <skarn86@gmail.com>
pkgname=videocatcher
pkgver=0.1.8
pkgrel=2
pkgdesc="A videocast client for KDE. It makes it possible to subscribe to video RSS (and ATOM etc.) feeds and easily download videos"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/Videocatcher?content=121556"
license=('GPL')
makedepends=(boost docbook-xml cmake)
depends=(kdepimlibs qt4)
source=(http://kde-apps.org/CONTENT/content-files/121556-$pkgname-$pkgver.tar.bz2)
md5sums=('6c3b1f2da7837aa0be576ed68b153c35')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake ./ -DCMAKE_INSTALL_PREFIX="/usr"
  make
  make DESTDIR="$pkgdir" install
}
