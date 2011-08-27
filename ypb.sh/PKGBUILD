# Maintainer: Your Name <youremail@domain.com>
pkgname=ypb.sh
pkgver=0.0.1
pkgrel=2
pkgdesc="my shell stuff"
arch=('any')
url="http://localhost/"
license=('GPL3')
groups=('ypb')
depends=('sh')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(navigus.sh)
md5sums=('83faac9a1f800edeeafca43975d73c97')
noextract=()

build() {
  :
}

package() {
  cd "$srcdir"

  mkdir -p "$pkgdir/etc/profile.d"
  cp navigus.sh "$pkgdir/etc/profile.d"
}

# vim:set ts=2 sw=2 et:
