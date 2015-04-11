# Contributor: Todor Imreorov blurymind@gmail.com

pkgname=drawpile-git
pkgver=git
pkgrel=1
pkgdesc='Collaborative drawing program specially made for use with pen tablets'
arch=('x86_64' 'i686')
url='http://drawpile.net/'
license=('GPL2')
makedepends=('qt5-base' 'karchive' 'qt5-tools' 'qt5-translations' 'qt5-svg' 'qt5-multimedia' 'ninja')
depends=('qt5-base' 'karchive' 'qt5-tools' 'qt5-translations' 'qt5-svg' 'qt5-multimedia' 'cmake')
optdepends=('libmicrohttpd')
conflicts=('drawpile')
source=('git+https://github.com/callaa/Drawpile.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/Drawpile"
	ver=$(git describe --abbrev=0 | sed -e 's/[^.0-9]//g')
	count=$(git rev-list --count HEAD)
	commit=$(git rev-parse --short HEAD)
	echo $ver.r$count.$commit
}

build() {
  cd Drawpile

  # Ensure build is an empty directory
  rm -rf build
  mkdir -p build
  cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja
}

package() {
  cd Drawpile

  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "desktop/drawpile-128x128.png" \
    "$pkgdir/usr/share/pixmaps/drawpile.png"
  install -Dm644 "desktop/drawpile.desktop" \
    "$pkgdir/usr/share/applications/drawpile.desktop"
}

# vim:set ts=2 sw=2 et:
