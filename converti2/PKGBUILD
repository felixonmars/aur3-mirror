# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Olivier Médoc <o_medoc@yahoo.fr>
pkgname=converti2
pkgver=0.3
pkgrel=1
epoch=
pkgdesc="converti2 is a tool to convert .rt and .rti tables to the .rti2 format"
arch=('x86_64' 'i686')
url="http://www.freerainbowtables.com/en/download/"
license=('GPL')
groups=()
depends=()
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
source=("http://www.freerainbowtables.com/download/${pkgname}_${pkgver}_src.7z")
noextract=()
md5sums=() #generate with 'makepkg -g'

build() {
  cd "$srcdir/${pkgname}_${pkgver}_src"
  #./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}_${pkgver}_src"
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 converti2 "${pkgdir}/usr/bin/"
}

md5sums=('ab77d461b117f90df0e55f644df87eb0')
# vim:set ts=2 sw=2 et:
