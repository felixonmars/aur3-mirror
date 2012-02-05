# Maintainer: Onni R. <onnir at iki dot fi>
pkgname=yuxtapa
pkgver=8
pkgrel=1
license=('None')
pkgdesc="a text-mode team-based real-time multiplayer game"
arch=('i686' 'x86_64')
url="http://github.com/lotuskip/yuxtapa"
depends=('zlib' 'ncurses')
source=(http://github.com/downloads/lotuskip/yuxtapa/$pkgname-$pkgver.tar.gz)
install=yuxtapa.install
md5sums=('43b387b3da892bfeda233fad42836e01')

build() {
  cd $srcdir/$pkgname
  make || return 1
  make mrbrown || return 1
}

package() {
  mkdir -p "${pkgdir}/usr/bin" || return 1
  mkdir -p "${pkgdir}/usr/share/yuxtapa" || return 1
  mkdir -p "${pkgdir}/usr/share/doc" || return 1
  cd $srcdir/$pkgname
  mv -f yuxtapa_sv yuxtapa_cl ${pkgdir}/usr/bin
  mv -f tmplates/*.conf mrbrown ${pkgdir}/usr/share/yuxtapa
  mv -f tmplates/gen_map_tmplate.sh ${pkgdir}/usr/share/yuxtapa
  chmod +x ${pkgdir}/usr/share/yuxtapa/gen_map_tmplate.sh
  mv -f tmplates/vim ${pkgdir}/usr/share/yuxtapa
  mv -f manual ${pkgdir}/usr/share/doc/yuxtapa
}
