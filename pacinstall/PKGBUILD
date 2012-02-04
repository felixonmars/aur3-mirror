# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas Oster <thomas.oster@rwth-aachen.de>
pkgname=pacinstall
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="use pacinstall instead of make install to generate binary packages without creating an PKGBUILD(like checkinstall for debian/slackware)"
arch=(any)
url="http://kantico.de/texray/pacinstall.xhtml"
license=('GPL')
groups=()
depends=('installwatch')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('http://kantico.de/texray/code/pacinstall-0.2')
noextract=()
md5sums=('e637e4dc6b2a584243a26a61d44f6faf')
package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/bin
  cp pacinstall-0.2 $pkgdir/usr/bin/pacinstall
  chmod +x $pkgdir/usr/bin/pacinstall
}

# vim:set ts=2 sw=2 et:
