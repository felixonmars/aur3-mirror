# Maintainer: loonyphoenix <loonyphoenix at gmail>
# This is an SMPlayer fork named SMPlayer2 by lachs0r
# that fixes several issues with mplayer2 integration.

pkgname=smplayer2-git
pkgver=v0.8.0.6.g70d9ba3
pkgrel=1
pkgdesc="A fork of SMPlayer, targeted at mplayer2 users"
arch=('i686' 'x86_64')
url="https://github.com/lachs0r/SMPlayer2"
license=('GPL2')
depends=('qt4' 'mplayer2')
makedepends=('git' 'cmake')
optdepends=('quazip: rebuild with this library installed for Subtitle Downloader support')
source=("git://github.com/lachs0r/SMPlayer2.git")
sha256sums=('SKIP')
_gitname="SMPlayer2"

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git describe --always | sed 's/-/./g')
}



build() {
	cd "$srcdir/$_gitname"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DQT_QMAKE_EXECUTABLE=qmake-qt4 .
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}
