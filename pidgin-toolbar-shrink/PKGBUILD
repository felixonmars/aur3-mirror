# Maintainer: Pavel <otchertsov@gmail.com>

pkgname=pidgin-toolbar-shrink
pkgver=1.1
pkgrel=1
pkgdesc="Shrinks the toolbar of the conversation windows by hiding the text of the buttons"
arch=('i686 x86_64')
url="https://launchpad.net/pidgin-toolbar-shrink"
license=('GPL2')
depends=('pidgin')
source=(http://launchpad.net/${pkgname}/trunk/${pkgver}.${pkgrel}/+download/${pkgname}-${pkgver}.${pkgrel}.tar.gz)
md5sums=('8edacae1246bd23720182826028605ab')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}.${pkgrel}
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}.${pkgrel}
  make DESTDIR=${pkgdir} install || return 1
}
