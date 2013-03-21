# Maintainer: perlawk
pkgname=spf
pkgver=4.20
pkgrel=1
epoch=
pkgdesc="SP-Forth is an ANS forth system for Windows and Linux. It features optimized native code generation, high speed execution, full ANS94 support, small yet highly-extensible kernel, 32-bits only."
arch=(any)
url=("http://spf.sourceforge.net/")
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
noextract=()
source=(http://nchc.dl.sourceforge.net/project/spf/sp-forth4/SP-Forth%204.20/$pkgname-$pkgver.tar.gz)
md5sums=('0b28b74da6d0e40d38b0f59438d57924')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  sed -ie "s/gcc/gcc -m32 /;" Makefile
  sed -ie "s/gcc/gcc -m32 /;" posix/Makefile
  make
}

package() {
  mkdir -p "$pkgdir"/usr/{bin,lib/spforth4/,share/doc/}
  cd "$srcdir/$pkgname-$pkgver/"
  cp spf4 "$pkgdir"/usr/bin/
  cp -a lib src spf4.ini "$pkgdir"/usr/lib/spforth4/
  cp -a docs "$pkgdir/usr/share/doc/"spforth4
  rm -rf "$pkgdir"/usr/lib/spforth4/src/{compile*,*.o,spf4,win,Makefile*,posix/config.gen}
  rm -rf "$pkgdir"/usr/lib/spforth4/lib/win
}

# vim:set ts=2 sw=2 et:
