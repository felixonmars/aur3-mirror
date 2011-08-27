# Contributor: Jan Fader <jan.fader@web.de>
pkgname=switchconf
pkgver=0.0.8
pkgrel=2
pkgdesc="Switchconf allows users to easily change their system's settings, choosing between the possible configurations for different environments."
arch=(i686)
url="http://web.tagus.ist.utl.pt/~jose.calhariz/"
license=('GPL')
install=
source=(http://debian.tagus.ist.utl.pt/debian/dists/etch/updates/main/${pkgname}_${pkgver}.orig.tar.gz jf-al-pkg.patch jf-src.patch)
md5sums=('66b13c4895ac25b8684520a7b9732c39'
         'e044d3a01ac4c3f5e8de00ddf2958837'
         'a0e463f1cd4b09c6b2f961e3588ebfbe')

build() {
  cd "$startdir/src/$pkgname"
  patch -i ../jf-al-pkg.patch
  patch -i ../jf-src.patch

  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
