# Maintainer: Menche <menche_mt@yahoo.com>

pkgname=wz2100legacy-git
pkgver=20140927.114b8b2
pkgrel=1
pkgdesc="3D realtime strategy game on a future Earth (Git version)"
arch=('i686' 'x86_64')
url="http://warzonelegacy.org/"
license=('GPL')
depends=('physfs' 'sdl' 'libtheora' 'fribidi' 'libvorbis' 'openal' 'glew')
makedepends=('zip' 'unzip')
provides=('wz2100legacy')
conflicts=('wz2100legacy')
source="git+git://github.com/Subsentient/wz2100legacy.git"
sha256sums=('SKIP')

pkgver() {
	git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

build() {
  cd "$srcdir/wz2100legacy/wzlegacy"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/wz2100legacy/wzlegacy"
  make DESTDIR="$pkgdir" install
}

