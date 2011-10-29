# Maintainer: Jamie Webb <aur@digitalice.co.uk>
pkgname=emusicj-bin
pkgver=0.26
pkgrel=1
epoch=
pkgdesc="A alternative Emusic download manager"
arch=(i686 x86_64)
url="http://www.kallisti.net.nz/EMusicJ/"
license=('GPL')
groups=()
depends=(java-runtime)
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
case "$CARCH" in
  i686)
    source=("http://www.kallisti.net.nz/wikifiles/EMusicJ/emusicj-linux-i686-${pkgver}.tar.gz")
    md5sums=('bc97f986e2a91bdde5a7104675cd207f')
    ;;
  x86_64)
    source=("http://www.kallisti.net.nz/wikifiles/EMusicJ/emusicj-linux-x86_64-${pkgver}.tar.gz")
    md5sums=('798ffd9951133003c61c616852b5625c')
    ;;
esac
noextract=()

package() {
  cd "$srcdir/emusicj-linux"
  mkdir -p "$pkgdir/usr/lib/emusicj"
  cp -r emusicj emusicj.xpm lib "$pkgdir/usr/lib/emusicj/"
  mkdir -p "$pkgdir/usr/bin"
  ln -s "../lib/emusicj/emusicj" "$pkgdir/usr/bin/emusicj"
}

# vim:set ts=2 sw=2 et:
