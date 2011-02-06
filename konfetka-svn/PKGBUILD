#Maintainer lh<jarryson@gmail.com>

pkgname=konfetka-svn
pkgver=188
pkgrel=1
pkgdesc="Konfetka is a fairly new client for xmms2"
arch=(i686)
url="http://code.google.com/p/konfetka/"
license=('GPL')
groups=()
depends=('xmms2' 'qt' 'boost')
makedepends=()
provides=('konfetka')
conflicts=('konfetka')
replaces=()
backup=()
options=()
install=
source=(konfetka.desktop)
noextract=()
md5sums=()

_svnmod="konfetka"
_svntrunk="http://konfetka.googlecode.com/svn/trunk/"

build() {
  cd $startdir/src

  msg "Getting sources..."
  svn co $_svntrunk $_svnmod -r $pkgver

  [ -d $_svnmod-build ] && rm -r $_svnmod-build
  cp $_svnmod $_svnmod-build -r || return 1
  cd $_svnmod-build || return 1

  qmake
  make || return 1
  #make DESTDIR="$startdir/pkg" install
  install -Dm755 konfetka $pkgdir/usr/bin/konfetka
  install -Dm644 $srcdir/konfetka.desktop $pkgdir/usr/share/applications/konfetka.desktop
  install -Dm644 $srcdir/konfetka/images/logo.png $pkgdir/usr/share/pixmaps/konfetka.png
}

# vim:set ts=2 sw=2 et:
