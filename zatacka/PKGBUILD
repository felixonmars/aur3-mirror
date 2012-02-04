# Contributor: Javier ‘Phrodo_00’ Aravena <phrodo.00@gmail.com>
pkgname=zatacka
pkgver=0.1.8
pkgrel=1
pkgdesc="Clone of Achtung die Kurve"
arch=('i686' 'x86_64')
url="http://zatacka.sourceforge.net"
license=('GPL')
depends=('sdl_image' 'sdl_ttf')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}_src.tar.gz"\
        "${pkgname}.svg" "${pkgname}.desktop")
md5sums=('d7a4019b7dbd25da9c513d0c9d4b8ae8'
         'd5753045ae2f436ac9767cc660283a18'
         '3005bc847a7cbe6b30b28046beb4c6e9')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  make install DESTDIR=${pkgdir}

  cd ${srcdir}
  install -m644 -D "${pkgname}.desktop" "${startdir}/pkg/usr/share/applications/${pkgname}.desktop"
  install -m644 -D "${pkgname}.svg" "${startdir}/pkg/usr/share/pixmaps/${pkgname}.svg"

}

# vim:set ts=2 sw=2 et:
