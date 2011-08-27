# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Osmiy
# Contributor: lavandero
pkgname=heirloom-devtools-cvs
pkgver=2011.06.22
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Development tools (yacc, lex, make ...) derived from original UNIX tools"
url="http://heirloom.sourceforge.net/devtools.html"
license=('custom:"caldera"' 'custom:"opensolaris"')
depends=('heirloom-sh-cvs')
makedepends=('cvs')
source=('000-config.diff' '001-lock.patch')
md5sums=('2585f68fb07fef84cfd4bacbe2bbc1ab' '1edde6c9e667e9ee602e237acf1f9dc5')

build() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-devtools

  rm -rf $srcdir/build
  cp -ar $srcdir/heirloom-devtools $srcdir/build
  cd $srcdir/build

  patch -p1 < ../000-config.diff
#  patch -p0 < ../001-lock.patch # patch does not apply. Probably only needed for stable version.

  make
}

package() {
  cd $srcdir/build

  make install ROOT="$pkgdir"

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -m644 LICENSE/BERKELEY.LICENSE $pkgdir/usr/share/licenses/$pkgname/BERKELEY
  install -m644 LICENSE/CALDERA.LICENSE $pkgdir/usr/share/licenses/$pkgname/CALDERA
}