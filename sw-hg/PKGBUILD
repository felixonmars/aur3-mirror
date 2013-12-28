# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
_pkgname=sw
pkgname=${_pkgname}-hg
pkgver=r42.2c909bacb97d
pkgrel=2
pkgdesc="Suckless Web-framework"
arch=('any')
url="http://nibble.develsec.org/projects/sw.html"
license=('unknown')
groups=()
depends=()
makedepends=('mercurial')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::hg+http://nibble.develsec.org/hg/${_pkgname}/")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
