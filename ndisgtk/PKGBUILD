# Maintainer: maz-1 <loveayawaka at gmail dot com>

pkgname=ndisgtk
pkgver=0.8.5
pkgrel=1
pkgdesc="A GTK+ based frontend for ndiswrapper"
arch=('i686' 'x86_64')
url="https://launchpad.net/ndisgtk/"
license=('GPL')
depends=('pygtk' 'ndiswrapper' 'hicolor-icon-theme')
makedepends=('intltool')
install=ndisgtk.install
source=("http://launchpad.net/ndisgtk/0.8/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('7b03108bc96c72400f2acfecb3487b83')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install || return 1
  mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}
