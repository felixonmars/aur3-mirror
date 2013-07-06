# Maintainer: Miles Sandlar <miles at userbound.com>
pkgname=mils-surf-git
pkgver=20130705
pkgrel=1
pkgdesc='mils surf with mils dmenu (mdmenu) integration.'
arch=('i686' 'x86_64')
url='https://github.com/mil/surf'
license=('MIT')
depends=('gtk2' 'webkitgtk2')
makedepends=('git' 'pkgconfig' 'xorg-utils')
provides=('surf')
conflicts=('surf')
_gitroot=https://github.com/mil/surf.git
_gitname=surf

build() {
  cd "$srcdir"
  if [ -d "$_gitname" ]; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
  fi
  
  cd "$srcdir/${_gitname}"
  make
}

package() {
  cd "$srcdir/${_gitname}"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
