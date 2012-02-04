# Maintainer: cron0 <jf.cron0@gmail.com>

pkgname=grdesktop
pkgver=0.23
pkgrel=8
pkgdesc="An rdesktop client for the GNOME desktop"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/grdesktop/"
license=('GPL')
depends=('rdesktop' 'libgnomeui')
makedepends=('pkgconfig' 'rarian')
source=(http://savannah.nongnu.org/download/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('46f8f3e2d4aa2433b8b1537fefa8a4b7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --with-keymap-path=/usr/share/rdesktop/keymaps --sysconfdir=/etc
  make 
  }
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install 
  install -Dm644 pixmaps/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
