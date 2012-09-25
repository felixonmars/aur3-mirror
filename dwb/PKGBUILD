# Contributor: portix <portix at gmx.net>

pkgname=dwb
pkgver=2012.08.22
pkgrel=2
pkgdesc="A webkit web browser with vi-like keyboard shortcuts, stable snapshot" 
url="http://portix.bitbucket.org/dwb/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libwebkit' 'gtk2')
provides=(dwb)
conflicts=('dwb-hg' 'dwb-gtk3-hg' 'dwb-gtk3')
source=(https://bitbucket.org/portix/dwb/downloads/${pkgname}-${pkgver}.tar.gz)
md5sums=('5cdf3a2b3f8845071529b44e2d93d653')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}
package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
