# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>
pkgname=frc-aliases-hg
pkgver=20130713
pkgrel=1
pkgdesc="Some aliases for the main VxWorks 6.3 GCC compiler"
arch=('any')
url="http://firstforge.wpi.edu/sf/wiki/do/viewPage/projects.c--11_toochain/wiki/HomePage"
license=('GPL')
makedepends=('mercurial')
provides=('frc-aliases')
conflicts=('frc-gcc-tools')
depends=('gcc-powerpc-wrs-vxworks' 'frc-wpilib-git')
_hgroot='https://bitbucket.org/frc-cpp11/'
_hgrepo='frc-aliases'
source=(hg+"$_hgroot""$_hgrepo")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  printf "0.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/$_hgrepo"
  make ${MAKEFLAGS} DESTDIR="$pkgdir" install || return 1
  mkdir -p $pkgdir/usr/share/man/man1
  cp -drp --no-preserve=ownership ./*.1 $pkgdir/usr/share/man/man1
}

# vim:set ts=2 sw=2:
