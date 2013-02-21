pkgname=systemd-aurd
_pkgname=aurctl
_realpkg=cower
pkgver=8
pkgrel=2
pkgdesc="A simple AUR agent with a pretentious name. Just a renamed 'cower'"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/cower"
license=('MIT')
depends=('curl' 'yajl' 'pacman')
makedepends=('perl')
source=("http://code.falconindy.com/archive/${_realpkg}/${_realpkg}-${pkgver}.tar.gz"{,.sig})
md5sums=('fd64ed93a636a2766c09935c8dd9c355'
         'acf83ef06997aa4c1dc276e24a51dff6')

build() {
  cd "${srcdir}/${_realpkg}-${pkgver}"

  sed \
    -e "s/cower/aurctl/g" \
    -e "s/Cower/AURctl/g" \
    -e "s/COWER/AURCTL/g" \
    -i ./*

  mv cower.c aurctl.c

  make
}

package() {
  cd "${srcdir}/${_realpkg}-${pkgver}"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
