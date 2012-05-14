# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: nut543 <kfs1@online.no>

pkgname=fishsupper
pkgver=0.1.6
pkgrel=2
pkgdesc="A simple Frogger-like arcade game"
arch=('i686' 'x86_64')
url="http://www.happypenguin.org/show?Fish%20Supper"
license=('GPL3' 'CCPL:by-sa')
depends=('libgl' 'sdl_image' 'sdl_mixer')
makedepends=('boost')
source=("http://ftp.fi.debian.org/gentoo/distfiles/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('788ca7c49aaaa5f5dbe568847b131f53'
         'eaa926d83f61516dbf39d6b349188f15'
         '5677a68d861537aefdc6237c64cb013a')

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

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 AUTHORS README "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set ts=2 sw=2 et:
