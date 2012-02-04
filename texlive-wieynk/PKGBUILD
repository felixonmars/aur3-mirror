# Maintainer: Edgar Kalkowski <eMail@edgar-kalkowski.de>
pkgname=texlive-wieynk
pkgver=20060330
pkgrel=1
pkgdesc="Wieynk fraktur font for use with LaTeX."
arch=(any)
url="http://www.gaehrken.de/fraktur/"
license=('unknown')
groups=()
depends=(texlive-core texlive-frakturx)
makedepends=(unzip coreutils)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=texlive-wieynk.install
changelog=
source=(http://www.gaehrken.de/fraktur/twieynk.zip)
noextract=()
md5sums=('617f747a6ab9fa1bc09d0b2f032c97bc')

build() {
  return 0
}

package() {
  mkdir -p "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/fonts" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/tex" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/doc" "$pkgdir/usr/share/texmf"
  cp -r "$srcdir/dvips" "$pkgdir/usr/share/texmf"
}
