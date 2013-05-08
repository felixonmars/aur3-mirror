# Maintainer: Francisco Martínez <fr0z3d AT outlook DOT com>
# Contributor: Eric Bélanger <eric AT archlinux DOT org>
# Contributor: Smith Dhumbumroong <zodmaner AT gmail DOT com>

pkgname=lcs-svn
pkgver=667
pkgrel=1
pkgdesc="A satirical console-based political role-playing/strategy game in which you recruit a team of Elite Liberal radicals and try to save the United States from a descent into Arch-Conservatism."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/lcsgame/"
license=('GPL2')
depends=('ncurses')
makedepends=('autoconf' 'subversion')
provides=('lcs')
conflicts=('lcs')
replaces=('lcs')
options=('!strip' '!buildflags' '!makeflags')
source=('lcsgame::svn+http://svn.code.sf.net/p/lcsgame/code/trunk')
md5sums=('SKIP')

pkgver(){
  cd "$SRCDEST/lcsgame"
  svnversion | tr -d [A-z]
}

build() {
  cd "${srcdir}/lcsgame"
  ./bootstrap
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/lcsgame"
  make install DESTDIR="${pkgdir}"
}

