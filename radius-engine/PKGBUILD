# Maintainer: megadriver <megadriver at gmx dot com>
# Contributor: Iwan Gabovitch <qubodup@gmail.com>

pkgname=radius-engine
pkgver=1.1
pkgrel=4
pkgdesc="2D game engine built on top of SDL, OpenGL, and Lua"
arch=('i686' 'x86_64')
url="http://radius-engine.sourceforge.net/"
license=("MIT")
depends=('lua51' 'sdl' 'sdl_sound' 'physfs')
makedepends=('sed')
options=('staticlibs')
source=(http://sourceforge.net/projects/radius-engine/files/$pkgname-$pkgver.tar.gz)
md5sums=('d9f95d432f63e740d004b563972efcfa')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
