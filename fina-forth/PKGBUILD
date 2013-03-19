# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=fina-forth
pkgver=0.2
pkgrel=1
epoch=
pkgdesc="FINA (FINA Is Not ANS) is a small direct-threaded Forth compiler/interpreter. Should be easy to port and embed in other applications. Tries to follow the ANS Forth standard. Currently supports PowerPC, X86 and X64 (MIPS and ARM untested)."
arch=( 'i686' 'x86_64')
url="http://code.google.com/p/fina-forth/"
#source=($pkgname-$pkgver.tar.gz)
license=('New BSD License')
groups=()
depends=()
makedepends=(mercurial scons)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

build() {
  cd "$srcdir"
  hg clone https://code.google.com/p/fina-forth/
  cd "$pkgname"
  scons
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/"
  scons prefix="$pkgdir/usr"
  rm "$pkgdir/usr/share/doc/fina/"{AUTHORS,LICENSE,README}
  rm "$pkgdir/usr/share/doc/fina/ffl/"{README,AUTHORS,C*,NEWS}
}

# vim:set ts=2 sw=2 et:
