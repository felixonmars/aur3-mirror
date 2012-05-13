# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: bangoskank <its.hip@gmail.com>

pkgname=circuslinux
pkgver=1.0.3
pkgrel=3
pkgdesc="A clone of the classic Atari 2600 video game Circus Atari"
arch=('i686' 'x86_64')
url="http://www.newbreedsoftware.com/circus-linux/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer')
source=("ftp://ftp.tuxpaint.org/unix/x/circus-linux/src/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
md5sums=('d53f7d28d974c5605d6bebb9b1569216'
         '3175ff4d50c1d1384c73a333fb19a314')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make prefix="${pkgdir}/usr" install
  mv "${pkgdir}/usr/share/doc/${pkgname}"{-${pkgver},}

  # Install a desktop entry
  install -Dm644 data/images/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
