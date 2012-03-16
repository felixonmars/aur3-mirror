# Contributor: Loren Copeland <thisisquitealongname at gm--l>

pkgname=ladspa-wubflip
pkgver=1
pkgrel=1
pkgdesc="A ladspa distortion plugin by Alex Sisson that 'flips' values beyond a definable threshold."
arch=('i686', 'x86_64')
url="http://www.alexs.org/ladspa/"
depends=('ladspa')
license=('GPL')
source="http://www.alexs.org/ladspa/wubflip.tar.gz"
build () {
cd "${srcdir}/wubflip"
make
}

package () {
cd "${srcdir}/wubflip"
mkdir -p "${pkgdir}/usr/lib/ladspa"
cp *.so "${pkgdir}/usr/lib/ladspa"
}
# vim:set ts=2 sw=2 et:

md5sums=('c8b0afec9652b4322fb060f34d30b921')
