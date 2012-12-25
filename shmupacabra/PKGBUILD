# Maintainer: Pavle Simovic <xpio at tesla.rcub.bg.ac dot rs>
pkgname=shmupacabra
pkgver=1.00
pkgrel=1
pkgdesc='Horizontal scrolling bullet hell shoot-em-up game'
arch=('i686' 'x86_64')
url="http://www.piepe.lv/shmupacabra/"
license=('MIT')
depends=('mesa' 'sdl_mixer>=1.2.10' 'sdl_image')
makedepends=('readline' 'gendesk' 'imagemagick')
source=('http://www.piepe.lv/shmupacabra/src.tgz')
md5sums=('134d28a51b46f5d699e9fe10f0de28f2')

build() {
  cd "$srcdir/src"
  make
  cd src
  convert sos.ico "$srcdir/$pkgname.png"
  cd "$srcdir"
  gendesk -n
}

package() {
  cd "$srcdir/src"
  sed "s/\/opt\/shmupacabra/\$\(DESTDIR\)\/opt\/shmupacabra/g" -i Makefile
  sed "s/\/usr\/bin/\$\(DESTDIR\)\/usr\/bin/g" -i Makefile
  install -d "$pkgdir/usr/bin"
  make DESTDIR="$pkgdir/" install
  install -D -m 644 README "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m 644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -D -m 644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
