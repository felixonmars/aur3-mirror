# Contributor: Ajsin Roman <roman.aysin@gmail.com>
pkgname=kdirwatch
pkgver=1.0.0
pkgrel=1
pkgdesc="This simple application monitores changes on local files and directories"
arch=('i686' 'x86_64')
url="http://www.kde-apps.org/content/show.php/KDirWatch?content=113902"
license=('GPL')
depends=('qt' 'kdelibs')
install=
source=(http://www.kde-apps.org/CONTENT/content-files/113902-$pkgname.tar.bz2)
md5sums=('45649a516bc83025c14dffa6680113ec')

build() {
  cd "$srcdir/$pkgname"
  mkdir build && cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=release .. || return 1

  make  || return 1
  make DESTDIR="$pkgdir/" install/strip
}

# vim:set ts=2 sw=2 et:
