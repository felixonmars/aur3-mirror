# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer:  <ivo@Arch>
pkgname=binary-clock
pkgver=3883e88
pkgrel=3
pkgdesc="Ncurses clock, with time displayed in colourful binary "
arch=('i686' 'x86_64')
url="https://github.com/JohnAnthony/Binary-Clock"
license=('GPL')
groups=()
depends=('ncurses')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
source=("git+https://github.com/JohnAnthony/Binary-Clock.git")
md5sums=('SKIP')

_gitname="Binary-Clock"

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed 's|-|.|g'
}

package() {
  cd $srcdir/$_gitname

  make || return 1
  install -d $pkgdir/usr/bin
  install -m 755 $srcdir/$_gitname/binclock $pkgdir/usr/bin/binclock
}

# vim:set ts=2 sw=2 et:
