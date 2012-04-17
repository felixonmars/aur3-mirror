 
# Maintained by Alexander Kazarin <boiler@co.ru>

pkgname=pidgin-mra
pkgver=0.1.4.2
pkgrel=1
pkgdesc="Mail.ru Agent protocol plugin for Pidgin IM"
arch=('i686' 'x86_64')
url="https://github.com/dreadatour/pidgin-mra"
license=('GPLv2')
depends=('libpurple>=2.4.1')
source=(https://github.com/downloads/dreadatour/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('5eab3f7fa73fb1760cb287696edb7028e6101b15')
     
build() {
      tar xfvz ${pkgname}-${pkgver}.tar.gz
      cd "$srcdir/${pkgname}-${pkgver}"
      make
}
     
package() {
      cd "$srcdir/${pkgname}-${pkgver}"
      make DESTDIR="$pkgdir" install
}

