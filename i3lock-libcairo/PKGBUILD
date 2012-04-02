# Maintainer: Robert Knauer <robert@privatdemail.net>
# based on PKGBUILD of community/i3lock

pkgname=i3lock-libcairo
pkgver=2.4
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM (with image support)"
arch=('i686' 'x86_64')
url="http://i3wm.org/i3lock/"
license=('MIT')
depends=('xcb-util' 'xcb-util-image' 'xcb-util-keysyms' 'pam' 'cairo-xcb' 'libev')
options=('docs')
source=(http://i3wm.org/i3lock/i3lock-$pkgver.tar.bz2)
md5sums=('728e2654d886ef97449708f0135e9fa5')
provides=('i3lock')
conflicts=('i3lock')

build() {
  cd "${srcdir}/i3lock-${pkgver}"
  make
  gzip i3lock.1
}

package() {
  cd "${srcdir}/i3lock-${pkgver}"
  make DESTDIR="${pkgdir}" install
  
  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/i3lock/LICENSE
  make clean
}
