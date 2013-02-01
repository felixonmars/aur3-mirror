# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

### To make compression faster, as 99% of users will anyway
### install this only once locally.
PKGEXT=.pkg.tar.

pkgname=ember-media
pkgver=0.7.0
pkgrel=1
epoch=1
pkgdesc="Data files for the Ember WordForge client."
arch=('any')
url="http://wiki.worldforge.org/wiki/Ember"
license=('GPL')
options=(!strip)
source=("http://downloads.sourceforge.net/worldforge/${pkgname}-${pkgver}.tar.bz2")

package() {
  mkdir -p "${pkgdir}/usr/share/ember/media"
  mv  "${srcdir}/${pkgname}-${pkgver}/media/"* "${pkgdir}/usr/share/ember/media/"
}

md5sums=('29aa6930d71f5bdc6b45be036d2227ec')
