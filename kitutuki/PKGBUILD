# Contributor: noonov <noonov@gmail.com>

pkgname=kitutuki
pkgver=0.9.9c
pkgrel=1
pkgdesc="A shell scripting language for Linux"
arch=('i686' 'x86_64')
url="http://ab25cq.web.fc2.com/"
license=('GPL2')
depends=('readline' 'oniguruma')
optdepends=('lv')
source=(http://ab25cq.web.fc2.com/${pkgname}-${pkgver}.tgz)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc || return 1
  make -j1 || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make -j1 prefix=${pkgdir}/usr sysconfdir=${pkgdir}/etc install || return 1
}

md5sums=('d2164560cc2ce6f242d4e42ae0a5a1db')
