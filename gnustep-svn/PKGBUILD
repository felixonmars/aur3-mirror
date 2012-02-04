# Contributor: Mildred <silkensedai@online.fr>
# kate: hl bash; space-indent on; indent-width 2;
# use versionpkg

pkgname=gnustep-svn
pkgver=25221
pkgrel=2
pkgdesc="GNUstep"
arch=(i686)
url="http://gnustep.org"
license=('GPL')
depends=(gnustep-make-svn gnustep-base-svn gnustep-gui-svn gnustep-back-svn)
makedepends=('subversion')
provides=(gnustep)
conflicts=(gnustep)
replaces=()
backup=()
install=
source=()
noextract=()
md5sums=()

_svntrunk="http://svn.gna.org/svn/gnustep/"
_svnmod=gnustep

build() {
  mkdir "$startdir/pkg/opt"
  mkdir "$startdir/pkg/opt/GNUstep"
}
