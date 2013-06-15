# Contributor: Huei-Horng Yo <hiroshiyui@gmail.com>

pkgname=bitstream-git
pkgver=1.0
pkgrel=1
pkgdesc='biTStream is a set of C headers allowing a simpler access to binary structures such as specified by MPEG, DVB, IETF, etc.'
license=('MIT')
arch=('i686' 'x86_64')
url="http://www.videolan.org/developers/bitstream.html"
conflicts=('bitstream')
depends=()
makedepends=('git')

build() {
  cd "$srcdir"

  if [ -e ${pkgname} ]; then
    cd ${pkgname}
    git pull
  else
    git clone git://git.videolan.org/bitstream.git ${pkgname}
    cd ${pkgname}
  fi
}

package() {
  cd "$srcdir"
  cd ${pkgname}
	make PREFIX=usr DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
