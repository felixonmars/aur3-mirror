# Contributor: Jakub Vitak <mainiak(at)gmail(dot)com>

pkgname=ditz-commander
pkgver=0.4
pkgrel=1
pkgdesc="GUI for ditz"
arch=(i686 x86_64)
url="http://code.google.com/p/ditz-commander/"
license=('GPL')
depends=(ruby)
source=( "http://ditz-commander.googlecode.com/files/${pkgname}_${pkgver}.orig.tar.gz" )
sha1sums=('16f59dc50bd10eff85a059dc9c74c8b3d631c950')

#
# http://ditz-commander.googlecode.com/files/ditz-commander_0.4.orig.tar.gz
# svn checkout http://ditz-commander.googlecode.com/svn/trunk/ ditz-commander-read-only
#

build() {
  cd "$srcdir/${pkgname}_${pkgver}.orig"
  mkdir -p "${pkgdir}/usr"
  ./setup.py build
  ./setup.py install --prefix="${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
