# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=bumprace
pkgver=1.5.3
pkgrel=3
pkgdesc="A racing game through a multi-level maze for 1 or 2 players"
arch=('i686' 'x86_64')
url="http://www.linux-games.com/bumprace/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
source=("http://www.linux-games.com/bumprace/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('a72733718ee6eed8cd1657db89bf8e0d'
         'f17e7d959ed1534c8d7292b81910db4d'
         'cc87e2aa88a31d82f7dae85727d5c5a6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install a readme
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
