# Maintainer: Onni R. <onnir at iki dot fi>
pkgname=yuxtapa
pkgver=6
pkgrel=1
license=('None')
pkgdesc="a text-mode team-based real-time multiplayer game"
arch=('i686' 'x86_64')
url="http://github.com/lotuskip/yuxtapa"
makedepends=('boost')
depends=('zlib' 'boost-libs' 'ncurses')
source=(http://github.com/downloads/lotuskip/yuxtapa/$pkgname-$pkgver.tar.gz)
install=yuxtapa.install
md5sums=('af55f6300d6263848fc387a45bf1e288')

build() {
  mkdir -p "${pkgdir}/usr/bin" || return 1
  mkdir -p "${pkgdir}/usr/share/yuxtapa" || return 1
  mkdir -p "${pkgdir}/usr/share/doc" || return 1
  cd $srcdir/$pkgname
  make || return 1
  make mrbrown
}

package() {
  cd $srcdir/$pkgname
  mv -f yuxtapa_sv yuxtapa_cl ${pkgdir}/usr/bin
  mv -f tmplates/*.conf mrbrown ${pkgdir}/usr/share/yuxtapa
  mv -f manual ${pkgdir}/usr/share/doc/yuxtapa
}
