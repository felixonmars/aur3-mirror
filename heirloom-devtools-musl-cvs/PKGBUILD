# Contributor: Jens Staal <staal1978@gmail.com>
# Contributor: Sascha Biermmanns <saschakb at gmail dot com>
# Contributor: Osmiy
# Contributor: lavandero
pkgname=heirloom-devtools-musl-cvs
pkgver=20120611
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Development tools (yacc, lex, make ...), statically linked to musl libc"
url="http://heirloom.sourceforge.net/devtools.html"
license=('custom:"caldera"' 'custom:"opensolaris"')
depends=('heirloom-sh-musl-cvs' 'musl')
provides=('heirloom-devtools' 'heirloom-devtools-cvs')
replaces=('heirloom-devtools-cvs')
makedepends=('cvs')
source=('000-config.diff')
md5sums=('2585f68fb07fef84cfd4bacbe2bbc1ab')

build() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom-devtools
  
  #making some header hacks...
  rm -rf $srcdir/include
  mkdir -p $srcdir/include/sys
  ln -s /usr/musl/include/errno.h $srcdir/include/sys/errno.h

  rm -rf $srcdir/build
  cp -ar $srcdir/heirloom-devtools $srcdir/build
  cd $srcdir/build

  patch -p1 < ../000-config.diff
#  patch -p0 < ../001-lock.patch # patch does not apply. Probably only needed for stable version.

#unfortunately not yet glibc free. We need a musl alternative for c++...
  make CC="musl-gcc -static -I. -I$srcdir/include -I/usr/musl/include" CXX="g++ -static"
}

package() {
  cd $srcdir/build

  make install ROOT="$pkgdir"

  mkdir -p $pkgdir/usr/share/licenses/$pkgname/
  install -m644 LICENSE/BERKELEY.LICENSE $pkgdir/usr/share/licenses/$pkgname/BERKELEY
  install -m644 LICENSE/CALDERA.LICENSE $pkgdir/usr/share/licenses/$pkgname/CALDERA
}