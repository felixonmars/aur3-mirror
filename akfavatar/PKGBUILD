# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: farid abdelnour <farid at atelier-lab.org>

pkgname=akfavatar
pkgver=0.21.2 
pkgrel=1
pkgdesc="A GUI for applications, where an avatar tells things to the user"
arch=('i686' 'x86_64')
url="http://akfoerster.de/akfavatar/akfavatar.en.html"
license=('GPL3')
depends=('lua' 'sdl')
source=("http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.src.tar.bz2"
        "${pkgname}.desktop")
md5sums=('391ece6573ca26b35dc0c8eea99e5390'
         '02f2c31b719f43e995d527f06259602e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i "s_local/__" Makefile.in
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install a desktop entry
  install -Dm644 "${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
