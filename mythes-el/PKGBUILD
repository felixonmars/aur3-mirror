# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>
pkgname=mythes-el
pkgver=20150215
pkgrel=1
epoch=
pkgdesc="Greek thesaurus"
arch=('any')
url="http://www.openthesaurus.gr/"
license=('AGPL')
groups=()
depends=()
makedepends=('coreutils')
checkdepends=()
optdepends=('libmythes: offers thesaurus library functions')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install='symlinks.install'
changelog=
source=('Greek-Thesaurus.oxt')
noextract=()
sha256sums=('1032a392636d4d8a3053c2b9716c926e68ae04d2a8d83cd9873b08f47f545419')

package() {
  cd "$srcdir/"

  install -D -m 644 th_el_GR_v2.idx ${pkgdir}/usr/share/mythes/th_el_GR_v2.idx
  install -D -m 644 th_el_GR_v2.dat ${pkgdir}/usr/share/mythes/th_el_GR_v2.dat

  install -D -m 644 README.txt ${pkgdir}/usr/share/doc/${pkgname}/README.txt
}

# vim:set ts=2 sw=2 et:
