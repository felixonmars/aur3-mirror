# Maintainer: Phil R <aur@bytepool.net>

arch=('i686' 'x86_64')
pkgname=tovid-git
pkgver="r3493.f2d20b8"
pkgrel=1
pkgdesc="A suite of utilities designed to make VCD, SVCD, and DVD authoring a little less painful"
url="https://github.com/tovid-suite/tovid"
license="GPL"
depends=('mplayer' 'mjpegtools' 'ffmpeg' 'imagemagick' 'dvdauthor' 'dvd+rw-tools' 'sox' 'normalize' 'tk' 'tix' 'bc')
makedepends=('txt2tags' 'git')
optdepends=('transcode: create menus with thumbnails (ffmpeg will be used if not available)')
provides=('tovid')
conflicts=('tovid')
source=('tovid-git::git+https://github.com/tovid-suite/tovid.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/tovid-git"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/tovid-git"
    ./setup.py build
}

package() {
    cd "$srcdir/tovid-git"
    ./setup.py install --prefix=/usr --root="$pkgdir"
}


