# Maintainer: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=glunarclock
pkgver=0.34.1
pkgrel=1
pkgdesc="Displays the current phase of the Moon as an applet for the gnome panel."
arch=(i686 x86_64)
url="http://glunarclock.sourceforge.net/"
license=('GPL')
depends=('gnome-panel')
makedepends=('intltool' 'libpanelappletmm' 'rarian' 'gnome-doc-utils')
install=
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('09b622644b7d8b101369bc79f93a9ee0')

build() {

  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/gnome-applets
  make 
  }
  package() {
 cd ${srcdir}/${pkgname}-${pkgver}
 make  DESTDIR=${pkgdir} install
}
