# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=sdl-skk
pkgver=0.5
pkgrel=1
pkgdesc="An SDL library adding SKK Japanese input support"
arch=('i686' 'x86_64')
url="http://www.kmc.gr.jp/~ohai/sdlskk.en.html"
license=('GPL')
depends=('sdl_ttf')
options=('!libtool')
source=(http://www.kmc.gr.jp/~ohai/sdlskk/sdlskk-$pkgver.tar.gz)
md5sums=('ce5f24a851f4598aa660fb3d8bfa807c')

build() {
  cd sdlskk-$pkgver

  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
