# Contributor: Tim Yang <tdy@gmx.com>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Hussam Al-Tayeb <hussam@visp.net.lb>
pkgname=prozilla
pkgver=2.0.4
pkgrel=5
pkgdesc="A multi-threaded download accelerator"
arch=('i686' 'x86_64')
url="http://prozilla.genesys.ro/"
license=('GPL')
depends=('gcc-libs' 'ncurses')
makedepends=('bison' 'gettext' 'pkgconfig')
source=(http://pkgs.fedoraproject.org/repo/pkgs/${pkgname}/${pkgname}-${pkgver}.tar.bz2/220f03968ddac79c2d6b48a507cd9c71/${pkgname}-${pkgver}.tar.bz2)
sha1sums=('328861f1b1491226f46ce2ed7f872c6a267d384c')
md5sums=('220f03968ddac79c2d6b48a507cd9c71')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i 's/DL_Window:://' src/download_win.h
}
build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man \
      --enable-shared --disable-static 
 make
}
package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/usr/share/locale"
}
