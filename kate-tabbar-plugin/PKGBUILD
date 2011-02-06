# Contributor: Massimiliano Torromao <massimiliano DOT torromeo AT gmail DOT com>
pkgname=kate-tabbar-plugin
pkgver=0.1
pkgrel=1
pkgdesc="Kate simple tabbar plugin"
arch=(i686 x86_64)
url="http://kde-apps.org/content/show.php/kate+tabbar+plugin?content=89786"
license=('GPL')
groups=()
depends=(kdesdk)
makedepends=(cmake automoc4)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://kde-apps.org/CONTENT/content-files/89786-katetabbar.tar.bz)
noextract=()
md5sums=('0612bdc2d5a74fd9ab49dfcda8a0dde1')

build() {
  cd "$srcdir/katetabbar"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
