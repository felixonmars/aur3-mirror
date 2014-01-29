# Maintainer: Anthony Winslow <idonthack@gmail.com>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Adam Vogt <vogt.adam@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=dtach-patched
pkgver=0.8
pkgrel=2
pkgdesc="emulates the detach feature of screen. includes foreground (-N option) and socket chmod attachment indicator patches"
arch=('i686' 'x86_64')
url="http://dtach.sourceforge.net/"
license=('GPL')
depends=('glibc')
conflicts=('dtach')
provides=('dtach')
source=(http://downloads.sourceforge.net/sourceforge/dtach/dtach-$pkgver.tar.gz foreground.diff dtach-0.8-socket-exec-bit.diff)
md5sums=('ec5999f3b6bb67da19754fcb2e5221f3' '625bae3f025548edd1d1d4bc866e51af' '60e24322cb9ca10808ca0c9ae6e98dfc')

build() {
  cd "${srcdir}/dtach-${pkgver}"

  patch -Np1 -i ${srcdir}/foreground.diff
  patch -Np1 -i ${srcdir}/dtach-0.8-socket-exec-bit.diff

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/dtach-${pkgver}"

  install -Dm755 dtach ${pkgdir}/usr/bin/dtach
  install -Dm644 dtach.1 ${pkgdir}/usr/share/man/man1/dtach.1
}

# vim:set ts=2 sw=2 et:
