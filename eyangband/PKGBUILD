# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=eyangband
pkgver=0.52
pkgrel=2
pkgdesc="Eyangband variant of angband"
arch=('i686' 'x86_64')
url="http://eyangband.sourceforge.net"
license=('unknown')
depends=('ncurses')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-052-src.zip)
md5sums=('96351a0fad6b37dadd138886654cc93f')

prepare() {
  cd "${srcdir}"/$pkgname-052-src/src

  cp config.h config.h.bak
  sed -e 's@# define DEFAULT_PATH "./lib/"@# define DEFAULT_PATH "/usr/lib/eyangband/"@' config.h.bak > config.h
}

build() {
  cd "${srcdir}"/$pkgname-052-src/src

  make -f Makefile.std
}

package() {
  cd "${srcdir}"/$pkgname-052-src/src

  install -Dm755 "angband" "${pkgdir}"/usr/bin/$pkgname

  install -d "${pkgdir}"/usr/lib
  cp -R "${srcdir}"/$pkgname-052-src/lib "${pkgdir}"/usr/lib/$pkgname
  chmod -R 775 "${pkgdir}"/usr/lib/eyangband
  chown -R root:users "${pkgdir}"/usr/lib/$pkgname
  find "${pkgdir}" -iname delete.me -delete
}
