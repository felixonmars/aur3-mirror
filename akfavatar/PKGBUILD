# Contributor: farid abdelnour <farid at atelier-lab.org>
pkgname=akfavatar
pkgver=0.16.0
pkgrel=1
pkgdesc="An image of an avatar appears on the screen and tells things written in a balloon."
arch=('i686' 'x86_64')
url="http://akfoerster.de/akfavatar/akfavatar.en.html"
license=('GPL3')
depends=('gcc' 'sdl' 'sdl_image')
optdepends=('gcolor2'
            'xdg-utils')
source=(http://dl.sv.nongnu.org/releases/akfavatar/akfavatar-0.16.0.tar.bz2)
md5sums=(ac25b07451df13fc15c3ee32409dcabd)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

