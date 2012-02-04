# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: Radoslaw Tokarski <tockar@o2.pl>
# Contributor: Mateusz Herych <heniekk@gmail.com>

pkgname=pidgin-tlen
pkgver=20101112
pkgrel=1
pkgdesc='Tlen.pl plugin for Pidgin.'
arch=('i686' 'x86_64')
url='http://nic.com.pl/~alek/pidgin-tlen/'
license=('BSD')
depends=('pidgin')
source=("http://nic.com.pl/~alek/pidgin-tlen/${pkgname}-${pkgver}.tar.gz")
md5sums=('c7279014f492830ba93be138d9f2e9c0')

build() {
  cd pidgin-tlen-${pkgver}

  make
}

package() {
  cd pidgin-tlen-${pkgver}

  install -Dm 644 libtlen.so "${pkgdir}/usr/lib/purple-2/libtlen.so"

  for i in 16 22 48; do
    install -Dm 644 tlen_${i}.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/${i}/tlen.png"
  done
}
