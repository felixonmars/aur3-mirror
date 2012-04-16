# Maintainer: Vitaly M. <jauthu@gmail.com>
# Contributor: Jesse Jaara <gmail: jesse.jaara>

pkgname=ogreoggsound-docs
_pkgbasename=ogreoggsound
pkgver=1.22
pkgrel=1
pkgdesc="OgreOggSound documentation."
arch=('any')
url="http://sourceforge.net/projects/ogreoggsound/"
license=('LGPL')
depends=()
makedepends=('doxygen')
conflicts=('ogreoggsound-svn-docs')
source=(http://downloads.sourceforge.net/project/ogreoggsound/OgreOggSound-Cthugha/ogreoggsound_V${pkgver}.zip)
md5sums=('aa2437d8cfa1c0a5c7fd5dbb78431869')

build() {
 cd "$srcdir/$_pkgbasename/docs"
 doxygen
}

package() {
 cd "$srcdir/$_pkgbasename/docs"
 mkdir -p $pkgdir/usr/share/doc/$_pkgbasename
 cp -r html $pkgdir/usr/share/doc/$_pkgbasename
}

# vim:set ts=2 sw=2 et:
